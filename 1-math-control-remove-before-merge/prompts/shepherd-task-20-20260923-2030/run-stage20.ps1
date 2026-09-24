[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false

$repository = 'edburns/dd-3068633-win32-x64-02'
$parentIssue = 1
$logDirectory = 'C:\Users\edburns\workareas\dd-3068633-win32-x64-02-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260923-2030'
$bodyDirectory = Join-Path $logDirectory 'issue-bodies'
$ledgerPath = Join-Path $logDirectory 'creation-ledger.json'
$resultPath = Join-Path $logDirectory 'stage-20-result.json'
$bodyVerifier = 'C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1'
$selectedIssueType = ''

$specifications = @(
    [pscustomobject]@{
        ImplementationSubsection = '1. Implement Fibonacci with unit and isolated CLI coverage'
        Title = '1. Implement Fibonacci with unit and isolated CLI coverage'
        BodyFile = Join-Path $bodyDirectory '01-1-implement-fibonacci-body.md'
    },
    [pscustomobject]@{
        ImplementationSubsection = '2. Add factorial and operation dispatch'
        Title = '2. Add factorial and operation dispatch'
        BodyFile = Join-Path $bodyDirectory '02-2-add-factorial-dispatch-body.md'
    }
)

function Write-AtomicText {
    param(
        [Parameter(Mandatory)][string]$Path,
        [Parameter(Mandatory)][AllowEmptyString()][string]$Content
    )

    $temporaryPath = "$Path.$([Guid]::NewGuid().ToString('N')).tmp"
    [IO.File]::WriteAllText($temporaryPath, $Content, [Text.UTF8Encoding]::new($false))
    Move-Item -LiteralPath $temporaryPath -Destination $Path -Force
}

function Write-JsonDocument {
    param(
        [Parameter(Mandatory)][string]$Path,
        [Parameter(Mandatory)][AllowEmptyCollection()][object]$Value
    )

    $json = ConvertTo-Json -InputObject $Value -Depth 10
    Write-AtomicText -Path $Path -Content $json
}

function Read-CreationLedger {
    $parsed = [IO.File]::ReadAllText($ledgerPath) |
        ConvertFrom-Json -NoEnumerate
    if ($parsed -isnot [System.Array]) {
        throw 'Creation ledger JSON root must be an array.'
    }

    $ledger = [object[]]$parsed
    if (@($ledger | Where-Object { $_ -is [System.Array] }).Count -ne 0) {
        throw 'Creation ledger must not contain nested array entries.'
    }
    return $ledger
}

function Write-CreationLedger {
    param([Parameter(Mandatory)][AllowEmptyCollection()][object[]]$Ledger)

    $json = ConvertTo-Json -InputObject ([object[]]$Ledger) -Depth 10
    Write-AtomicText -Path $ledgerPath -Content $json
}

function Update-LedgerFlag {
    param(
        [Parameter(Mandatory)][int]$Number,
        [Parameter(Mandatory)][ValidateSet('body_verified', 'linked')][string]$Field,
        [Parameter(Mandatory)][bool]$Value
    )

    $ledger = @(Read-CreationLedger)
    $entry = $ledger | Where-Object { $_.number -eq $Number }
    if (@($entry).Count -ne 1) {
        throw "Expected one ledger entry for issue #$Number."
    }
    $entry.$Field = $Value
    Write-CreationLedger -Ledger $ledger
}

function Get-NormalizedChildren {
    $childrenOutput = & gh api "repos/$repository/issues/$parentIssue/sub_issues" --paginate --slurp 2>&1
    $childrenExitCode = $LASTEXITCODE
    if ($childrenExitCode -ne 0) {
        throw "Unable to query parent children: $($childrenOutput | Out-String)"
    }

    $normalizedOutput = ($childrenOutput | Out-String) |
        & jq 'if length == 0 then [] elif all(.[]; type == "array") then add else . end' 2>&1
    $jqExitCode = $LASTEXITCODE
    if ($jqExitCode -ne 0) {
        throw "Unable to normalize paginated children: $($normalizedOutput | Out-String)"
    }

    $parsed = ($normalizedOutput | Out-String) | ConvertFrom-Json -NoEnumerate
    if ($parsed -isnot [System.Array]) {
        throw 'Normalized parent children response must be an array.'
    }
    $children = [object[]]$parsed
    if (@($children | Where-Object { $_ -is [System.Array] }).Count -ne 0) {
        throw 'Normalized parent children response must be flat.'
    }
    return $children
}

function Invoke-BodyVerification {
    param(
        [Parameter(Mandatory)][int]$IssueNumber,
        [Parameter(Mandatory)][string]$ExpectedBodyPath
    )

    return & $bodyVerifier `
        -Repository $repository `
        -IssueNumber $IssueNumber `
        -ExpectedBodyPath $ExpectedBodyPath `
        -MaxAttempts 6 `
        -DelaySeconds 5 `
        -DiagnosticPath (Join-Path $logDirectory "issue-$IssueNumber-body-verification-failure.json")
}

function Write-Result {
    param(
        [Parameter(Mandatory)][ValidateSet('in_progress', 'complete', 'failed')][string]$Status,
        [AllowNull()][object]$OperationError
    )

    $result = [ordered]@{
        schemaVersion = 1
        status = $Status
        ledgerFile = 'creation-ledger.json'
        operationError = $OperationError
    }
    Write-JsonDocument -Path $resultPath -Value $result
}

$operation = 'initialize'
$baseline = @()

try {
    $baseline = @(Get-NormalizedChildren)
    Write-CreationLedger -Ledger ([object[]]@())
    Write-Result -Status in_progress -OperationError $null

    foreach ($specification in $specifications) {
        $operation = "create issue for $($specification.ImplementationSubsection)"
        if ([string]::IsNullOrEmpty($selectedIssueType)) {
            $createOutput = & gh api "repos/$repository/issues" `
                -X POST `
                -f "title=$($specification.Title)" `
                -F "body=@$($specification.BodyFile)" 2>&1
        }
        else {
            $createOutput = & gh api "repos/$repository/issues" `
                -X POST `
                -f "title=$($specification.Title)" `
                -F "body=@$($specification.BodyFile)" `
                -f "type=$selectedIssueType" 2>&1
        }
        $createExitCode = $LASTEXITCODE
        if ($createExitCode -ne 0) {
            throw "Issue creation failed: $($createOutput | Out-String)"
        }
        $createdIssue = ($createOutput | Out-String) | ConvertFrom-Json
        if (-not $createdIssue.id -or -not $createdIssue.number -or -not $createdIssue.html_url) {
            throw "Issue creation returned an incomplete identity: $($createOutput | Out-String)"
        }

        $ledger = @(Read-CreationLedger)
        $relativeBodyFile = [IO.Path]::GetRelativePath($logDirectory, $specification.BodyFile)
        $ledger += [pscustomobject][ordered]@{
            implementationSubsection = $specification.ImplementationSubsection
            bodyFile = $relativeBodyFile
            id = [long]$createdIssue.id
            number = [int]$createdIssue.number
            title = [string]$createdIssue.title
            url = [string]$createdIssue.html_url
            body_verified = $false
            linked = $false
        }
        Write-CreationLedger -Ledger $ledger

        $operation = "verify body for issue #$($createdIssue.number)"
        $null = Invoke-BodyVerification `
            -IssueNumber ([int]$createdIssue.number) `
            -ExpectedBodyPath $specification.BodyFile
        Update-LedgerFlag -Number ([int]$createdIssue.number) -Field body_verified -Value $true

        $operation = "link issue #$($createdIssue.number) to parent #$parentIssue"
        $linked = $false
        $lastLinkError = ''
        for ($attempt = 1; $attempt -le 3 -and -not $linked; $attempt++) {
            $payload = '{"sub_issue_id": ' + [long]$createdIssue.id + '}'
            $linkOutput = $payload |
                & gh api "repos/$repository/issues/$parentIssue/sub_issues" -X POST --input - 2>&1
            $linkExitCode = $LASTEXITCODE
            if ($linkExitCode -eq 0) {
                $linked = $true
            }
            else {
                $lastLinkError = ($linkOutput | Out-String)
                if ($attempt -lt 3) {
                    Start-Sleep -Seconds 2
                }
            }
        }
        if (-not $linked) {
            throw "Linking failed after three attempts: $lastLinkError"
        }
        Update-LedgerFlag -Number ([int]$createdIssue.number) -Field linked -Value $true
    }

    $operation = 'verify final parent-child count and order'
    $ledger = @(Read-CreationLedger)
    $finalChildren = @(Get-NormalizedChildren)
    if ($finalChildren.Count -ne ($baseline.Count + $ledger.Count)) {
        throw "Parent child count was $($finalChildren.Count); expected $($baseline.Count + $ledger.Count)."
    }

    foreach ($entry in $ledger) {
        $occurrences = @($finalChildren | Where-Object { [long]$_.id -eq [long]$entry.id }).Count
        if ($occurrences -ne 1) {
            throw "Issue #$($entry.number) occurs $occurrences times in the parent child list."
        }
        if (-not $entry.linked) {
            throw "Ledger entry for issue #$($entry.number) is not marked linked."
        }
    }

    $baselineIds = @($baseline | ForEach-Object { [long]$_.id })
    $newChildren = @($finalChildren | Where-Object { [long]$_.id -notin $baselineIds })
    $expectedIds = @($ledger | ForEach-Object { [long]$_.id })
    $observedIds = @($newChildren | ForEach-Object { [long]$_.id })
    if (($expectedIds -join ',') -cne ($observedIds -join ',')) {
        throw "New child order does not match plan order. Expected $($expectedIds -join ','); observed $($observedIds -join ',')."
    }

    $operation = 'verify final issue bodies, state, and assignees'
    foreach ($entry in $ledger) {
        $bodyPath = Join-Path $logDirectory $entry.bodyFile
        $issue = Invoke-BodyVerification -IssueNumber ([int]$entry.number) -ExpectedBodyPath $bodyPath
        if ($issue.state -ne 'open') {
            throw "Issue #$($entry.number) is not open."
        }
        if (@($issue.assignees).Count -ne 0) {
            throw "Issue #$($entry.number) unexpectedly has assignees."
        }
        if (-not $entry.body_verified) {
            throw "Ledger entry for issue #$($entry.number) is not marked body_verified."
        }
    }

    Write-Result -Status complete -OperationError $null
    [pscustomobject]@{
        Status = 'complete'
        SelectedIssueType = if ($selectedIssueType) { $selectedIssueType } else { 'none' }
        BaselineChildCount = $baseline.Count
        FinalChildCount = $finalChildren.Count
        Ledger = @(Read-CreationLedger)
    } | ConvertTo-Json -Depth 10
}
catch {
    $failure = "$operation`: $($_.Exception.Message)"
    try {
        $ledger = @(Read-CreationLedger)
        $serverChildren = @(Get-NormalizedChildren)
        $serverIds = @($serverChildren | ForEach-Object { [long]$_.id })
        foreach ($entry in $ledger) {
            $entry.linked = ([long]$entry.id -in $serverIds)
        }
        Write-CreationLedger -Ledger $ledger
    }
    catch {
        $failure = "$failure Reconciliation also failed: $($_.Exception.Message)"
    }

    Write-Result -Status failed -OperationError $failure
    $ledger = @(Read-CreationLedger)
    [Console]::Error.WriteLine("Stage 20 failed: $failure")
    if ($ledger.Count -eq 0) {
        [Console]::Error.WriteLine('No issues were created; no cleanup is required.')
    }
    else {
        [Console]::Error.WriteLine((ConvertTo-Json -InputObject ([object[]]$ledger) -Depth 10))
        foreach ($entry in $ledger) {
            [Console]::Error.WriteLine("gh issue delete $($entry.number) --repo `"$repository`" --yes")
        }
        [Console]::Error.WriteLine('The operation did not complete and no automatic rollback was performed. Delete every issue in the ledger before invoking stage 20 again.')
    }
    exit 1
}
