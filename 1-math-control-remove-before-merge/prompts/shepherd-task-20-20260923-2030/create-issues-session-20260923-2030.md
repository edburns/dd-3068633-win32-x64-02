# Copilot CLI Session

> [!NOTE]
> - **Session ID:** `feae8aa0-e754-4223-9984-91608dfbed43`  
> - **Started:** 9/23/2026, 8:30:21 PM  
> - **Duration:** 3m 28s  
> - **Exported:** 9/23/2026, 8:33:50 PM  

---

<sub>5s</sub>

### User

Invoke skill `shepherd-task-20-create-issues-from-plan` with these inputs:

- CAMPAIGN_ID: 44df0558-cc33-4923-ad89-c9499c6d3684
- LESSON_PROPAGATION: off
- REPO: edburns/dd-3068633-win32-x64-02
- BASE_BRANCH: experiment/shepherd-control
- PARENT_ISSUE: 1
- PLAN_DIRECTORY: 1-math-control-remove-before-merge
- PLAN_FILE_NAME: math-tool-ignorance-reduction-plan.md
- QUESTIONS_SECTION: ## Ignorance reduction
- IMPLEMENTATION_SECTION: ## Implementation
- EXPECTED_TASK_COUNT: 2
- BASE_REMOTE: origin
- LOG_DIRECTORY: C:\Users\edburns\workareas\dd-3068633-win32-x64-02-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260923-2030
- DRAFT_VALIDATOR: C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\validate-stage20-drafts.ps1
- ISSUE_BODY_VERIFIER: C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1

Fixture pagination response contract (mandatory):

- `gh api ... --paginate --slurp` returns a JSON array of page payloads, so a
  one-page response has the shape `[[{...}]]`, not `[{...}]`.
- Before indexing child issue fields such as `.id`, normalize the response to
  one flat issue array exactly once.
- In Bash, use:
  `jq 'if length == 0 then [] elif all(.[]; type == "array") then add else . end'`.
- In PowerShell, capture the `gh` output and `$LASTEXITCODE` first, then pass
  the complete JSON through the same `jq` normalization before
  `ConvertFrom-Json`.
- Use the normalized flat array for the pre-creation baseline, final child
  count/order checks, and failure reconciliation. Do not apply `add` a second
  time to an already-flat array.


---

<sub>10s</sub>

### `skill`

**shepherd-task-20-create-issues-from-plan**

<details>
<summary>Arguments</summary>

```json
{
  "skill": "shepherd-task-20-create-issues-from-plan"
}
```

</details>

```
Skill "shepherd-task-20-create-issues-from-plan" loaded successfully. Follow the instructions in the skill context.
```


---

<sub>17s</sub>

### Copilot

I’ll validate the campaign inputs, inspect the plan and all bundled examples, then draft and validate both issue bodies before any GitHub mutation.

---

<sub>35s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\01-1682-java-tool-ergonomics.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\01-1682-java-tool-ergonomics.md (lines 1--1)

<details>
<summary>15 lines</summary>

```
# Example 01: 1682-java-tool-ergonomics-prompts-remove-before-merge

Read `copilot-sdk/1682-java-tool-ergonomics-prompts-remove-before-merge/dd-3018003-ignorance-reduction-for-implementation-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 3 — Ignorance reduction: questions to answer before writing code`.

In this session, we are creating issues of type **Task** as children of Epic https://github.com/github/copilot-sdk/issues/1682 . These issues correspond to the sub-sections in `## Phase 4 — Implementation (the build order)`.

I want you to use `gh` to create issues as sub-issues of 1682.

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Set the type to **Task**.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `upstream`: `edburns/1682-java-tool-ergonomics`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `1682-java-tool-ergonomics-prompts-remove-before-merge`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 4 — Implementation (the build order)` have essential details for each corresponding **Task**.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 4 — Implementation (the build order)` have essential details for each corresponding **Task**, I want you to carefully consider if there additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>36s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\02-1810-java-tool-as-lambda.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\02-1810-java-tool-as-lambda.md (lines 1--1)

<details>
<summary>12 lines</summary>

```
# Example 02: 1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge

Carefully read the plan `copilot-sdk/1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge/1810-ignorance-reduction-for-implementation-plan.md`.

We have completed Phases 1 - 3. We are now on Phase 4.

For each sub item in Phase 4, file a child issue of Feature #1810.

Use `gh` to look at Epic #1682 and its child issues for the standard of verbosity and concreteness for issue descriptions.

The issue should be assignable to a coding agent and there must be sufficient detail in the description for the agent to proceed to completion.

Pull out the specific relevant content from Phase 3 as it applies to this current issue in Phase 4.

Tell the agent to take `edburns/1810-java-tool-ergonomics-tool-as-lambda` as the base branch. When I assign the issue to the coding agent, I will set this as the base branch.

Tell the agent to read `1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge/1810-ignorance-reduction-for-implementation-plan.md`, which is present on the branch, for context.

Tell the agent which sub-item within Phase 4 they are solving.

Tell the agent that each issue will be assigned, resolved and merged to the base branch in the order in which they appear in the plan.

No work is to start until I assign each issue to the coding agent, in turn.
```

</details>


---

<sub>36s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\03-dd-3017826-java-real-estate-demo.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\03-dd-3017826-java-real-estate-demo.md (lines 1--1)

<details>
<summary>14 lines</summary>

```
# Example 03: dd-3017826-java-real-estate-demo-remove-before-merge

Read `dd-3017826-java-real-estate-demo-remove-before-merge\dd-3017826-java-real-estate-demo-ignorance-reduction-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`.

In this session, we are creating sub-issues as children of https://github.com/edburns/Build26-BRK206-your-agent-anywhere-multiclient-multidevice-with-github-copilot-sdk/issues/2 . These issues correspond to the sub-sections in `## Phase 3 — Implementation (build order)`.

I want you to use `gh` to create issues as sub-issues of #2.

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `origin`: `edburns/2-build-out-demo`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `dd-3017826-java-real-estate-demo-remove-before-merge`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue, I want you to carefully consider if there additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>37s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\04-28-python-agent-demo.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\04-28-python-agent-demo.md (lines 1--1)

<details>
<summary>16 lines</summary>

```
# Example 04: 28-python-agent-demo-remove-before-merge

Read `28-python-agent-demo-remove-before-merge/28-python-agent-demo-ignorance-reduction-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`. These pertain to the implementation tasks in Phase 3. ✅✅✅ Include relevant spike findings as self-contained prose in the issue description; do not direct the agent to spike directories or source files.

In this session, we are creating sub-issues as children of https://github.com/edburns/Build26-BRK206-your-agent-anywhere-multiclient-multidevice-with-github-copilot-sdk/issues/28 . These issues correspond to the sub-sections in `## Phase 3 — Implementation (build order)`.

I want you to use `gh` to create issues as sub-issues of #28

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Again, ✅✅For each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`, include the relevant Resolution values in the issue description. These pertain to the implementation tasks in Phase 3. ✅✅✅ State relevant spike findings directly in the issue body with enough detail to implement them without reading spike code.

- For tasks dealing with the UI, make sure to refer to the relevant screengrabs, but only ones within `28-python-agent-demo-remove-before-merge/`.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `origin`: `edburns/28-python-agent-demo`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `28-python-agent-demo-remove-before-merge/`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue, I want you to carefully consider if there additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>38s</sub>

### `glob`

**1-math-control-remove-before-merge\****

"1-math-control-remove-before-merge\**"

<details>
<summary>7 matches</summary>

```
C:\Users\edburns\workareas\dd-3068633-win32-x64-02-shepherd-control\1-math-control-remove-before-merge\shepherd-test-experiment.json
C:\Users\edburns\workareas\dd-3068633-win32-x64-02-shepherd-control\1-math-control-remove-before-merge\shepherd-campaign.json
C:\Users\edburns\workareas\dd-3068633-win32-x64-02-shepherd-control\1-math-control-remove-before-merge\campaign-lessons.md
C:\Users\edburns\workareas\dd-3068633-win32-x64-02-shepherd-control\1-math-control-remove-before-merge\math-tool-ignorance-reduction-plan.md
C:\Users\edburns\workareas\dd-3068633-win32-x64-02-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260923-2030\create-issues-otel-20260923-2030.jsonl
C:\Users\edburns\workareas\dd-3068633-win32-x64-02-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260923-2030\20260923-2030-invoke-shepherd-task-20-create-issues-from-plan-skill.ps1
C:\Users\edburns\workareas\dd-3068633-win32-x64-02-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260923-2030\20260923-2030-invoke-shepherd-task-20-create-issues-from-plan-skill.md
```

</details>


---

<sub>38s</sub>

### `powershell`

**Validate stage inputs and GitHub state**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $repo='edburns/dd-3068633-win32-x64-02'; $base='experiment/shepherd-control'; $remote='origin'; $log='C:\\Users\\edburns\\workareas\\dd-3068633-win32-x64-02-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260923-2030'; $dv='C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\validate-stage20-drafts.ps1'; $bv='C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\verify-github-issue-body.ps1'; if (-not (Test-Path -LiteralPath $log -PathType Container)) { throw 'LOG_DIRECTORY missing' }; $probe=Join-Path $log '.write-probe'; [IO.File]::WriteAllText($probe,'ok'); Remove-Item -LiteralPath $probe; New-Item -ItemType Directory -Force -Path (Join-Path $log 'issue-bodies') | Out-Null; if (-not ([IO.Path]::IsPathRooted($dv) -and (Test-Path -LiteralPath $dv -PathType Leaf))) { throw 'DRAFT_VALIDATOR invalid' }; if (-not ([IO.Path]::IsPathRooted($bv) -and (Test-Path -LiteralPath $bv -PathType Leaf))) { throw 'ISSUE_BODY_VERIFIER invalid' }; $defaultOut=& gh repo view $repo --json defaultBranchRef,owner 2>&1; $defaultExit=$LASTEXITCODE; if ($defaultExit -ne 0) { throw \"repo lookup failed: $($defaultOut|Out-String)\" }; $default=$defaultOut|Out-String|ConvertFrom-Json; if ($base -eq 'main' -or $base -eq $default.defaultBranchRef.name) { throw 'Invalid base branch' }; git show-ref --verify --quiet \"refs/heads/$base\"; if ($LASTEXITCODE -ne 0) { git ls-remote --exit-code --heads $remote $base | Out-Null; if ($LASTEXITCODE -ne 0) { throw 'Base branch missing' } }; $remoteUrl=git remote get-url $remote; if ($LASTEXITCODE -ne 0 -or $remoteUrl -notmatch '(?i)(github\\.com[:/])edburns/dd-3068633-win32-x64-02(?:\\.git)?$') { throw \"Remote mismatch: $remoteUrl\" }; $parentOut=& gh api \"repos/$repo/issues/1\" 2>&1; $parentExit=$LASTEXITCODE; if ($parentExit -ne 0) { throw \"Parent lookup failed: $($parentOut|Out-String)\" }; $parent=$parentOut|Out-String|ConvertFrom-Json; if ($parent.state -ne 'open') { throw 'Parent issue not open' }; $repoOut=& gh api \"repos/$repo\" 2>&1; $repoExit=$LASTEXITCODE; if ($repoExit -ne 0) { throw \"Repository lookup failed: $($repoOut|Out-String)\" }; $repoData=$repoOut|Out-String|ConvertFrom-Json; if ($repoData.owner.type -notin @('User','Organization')) { throw \"Unrecognized owner type: $($repoData.owner.type)\" }; $selected=''; if ($repoData.owner.type -eq 'Organization') { $typesOut=& gh api \"orgs/$($repoData.owner.login)/issue-types\" 2>&1; $typesExit=$LASTEXITCODE; if ($typesExit -ne 0) { throw \"Issue type lookup failed: $($typesOut|Out-String)\" }; $types=$typesOut|Out-String|ConvertFrom-Json; if ($types | Where-Object { $_.name -eq 'Task' -and $_.is_enabled -eq $true }) { $selected='Task' } }; [pscustomobject]@{defaultBranch=$default.defaultBranchRef.name; owner=$repoData.owner.login; ownerType=$repoData.owner.type; selectedIssueType=$selected; parentTitle=$parent.title; remoteUrl=$remoteUrl; logDirectory=$log} | ConvertTo-Json -Compress",
  "description": "Validate stage inputs and GitHub state",
  "initial_wait": 120,
  "mode": "sync"
}
```

</details>

```
{"defaultBranch":"main","owner":"edburns","ownerType":"User","selectedIssueType":"","parentTitle":"[Campaign][off] shepherd-task simple-math control","remoteUrl":"git@github.com:edburns/dd-3068633-win32-x64-02.git","logDirectory":"C:\\Users\\edburns\\workareas\\dd-3068633-win32-x64-02-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260923-2030"}
<shellId: 0 completed with exit code 0>
```


---

<sub>37s</sub>

### `sql`

**Track stage workflow**

<details>
<summary>Arguments</summary>

```json
{
  "description": "Track stage workflow",
  "query": "INSERT OR REPLACE INTO todos (id,title,description,status) VALUES ('validate-stage20','Validating stage inputs','Validate local paths, branch, remote, parent issue, campaign manifest, plan sections, examples, and existing children','in_progress'),('draft-stage20','Drafting issue specifications','Build traceability map and persist two complete child issue bodies','pending'),('create-stage20','Creating ordered child issues','Validate drafts, create and link issues serially with persistent ledger','pending'),('verify-stage20','Verifying stage postconditions','Verify bodies, state, assignees, type, child count and order; finalize result','pending'); INSERT OR IGNORE INTO todo_deps(todo_id,depends_on) VALUES ('draft-stage20','validate-stage20'),('create-stage20','draft-stage20'),('verify-stage20','create-stage20');"
}
```

</details>

<details>
<summary>5 lines</summary>

```
Executed 2 statement(s):

1. INSERT
   4 row(s) inserted. Last inserted row ID: 4.

2. INSERT
   3 row(s) inserted. Last inserted row ID: 3.
```

</details>


---

<sub>42s</sub>

### Copilot

Input validation passed; this user-owned repository has no organization issue types, so children will be untyped. I’m now validating the branch-resident plan, resolved decisions, campaign manifest, and normalized pre-creation child baseline.

---

<sub>52s</sub>

### `powershell`

**Read plan from base branch**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $base='experiment/shepherd-control'; $planPath='1-math-control-remove-before-merge/math-tool-ignorance-reduction-plan.md'; $content=git show \"${base}:$planPath\" 2>&1; $code=$LASTEXITCODE; if ($code -ne 0) { throw \"git show failed: $($content|Out-String)\" }; $content | Out-String",
  "description": "Read plan from base branch",
  "initial_wait": 30,
  "mode": "sync"
}
```

</details>

<details>
<summary>39 lines</summary>

```
# PowerShell math-tool control campaign

Build the fixture in two cheap, serial tasks. The repository already contains
deterministic CI pinned to Pester 5.7.1. The acceptance command for every task
is `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. Task 2 starts only after task 1 is merged.

## Ignorance reduction

### Repository-owned validation

**Question:** What command and environment define acceptance?

**Resolution:** The committed canonical command is
`pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The baseline workflow
`.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester
5.7.1 and invokes that repository-owned runner. Do not replace or bypass it.

### Output and ordering contracts

**Question:** What externally observable behavior and dependency order are required?

**Resolution:** Direct CLI execution writes exactly one result line to stdout:
`Fibonacci(N) = value` or `Factorial(N) = value`. Functions return the
numeric value without incidental output. Inputs are non-negative integers.
Implementation is serial: task 2 depends on merged task 1. The implementation
and test files are repository-root `math-tool.ps1` and
`math-tool.Tests.ps1`.

## Implementation

### 1. Implement Fibonacci with unit and isolated CLI coverage

Create `math-tool.ps1` with parameter `N` and a pure `Get-Fibonacci`
function. Direct execution must print exactly `Fibonacci(N) = value`.
Create `math-tool.Tests.ps1` containing dot-sourced unit tests for the
function and isolated child-`pwsh` process tests for direct CLI behavior.
Cover N=0, N=1, and a small representative value. Keep changes limited to the
math tool and its tests.

Acceptance: `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero and the pinned pull-request CI
passes.

### 2. Add factorial and operation dispatch

After task 1 is merged, extend the same script with a pure `Get-Factorial`
function and an `Operation` parameter that dispatches between `fibonacci`
and `factorial` while retaining `N`. Preserve Fibonacci behavior. Cover
factorial edge cases 0 and 1 plus a small representative value. Keep the
interface and tests objective and small; the issue does not prescribe how to
extend the tests.

Acceptance: `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero for the combined regression suite
and the pinned pull-request CI passes.
<shellId: 1 completed with exit code 0>
```

</details>


---

<sub>53s</sub>

### `powershell`

**Validate campaign manifest**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $base='experiment/shepherd-control'; $path='1-math-control-remove-before-merge/shepherd-campaign.json'; $out=git show \"${base}:$path\" 2>&1; $code=$LASTEXITCODE; if ($code -ne 0) { throw \"manifest read failed: $($out|Out-String)\" }; $json=$out|Out-String|ConvertFrom-Json; $lessons=git cat-file -e \"${base}:1-math-control-remove-before-merge/campaign-lessons.md\" 2>&1; $lessonsCode=$LASTEXITCODE; if ($lessonsCode -ne 0) { throw 'campaign-lessons.md missing on base branch' }; [pscustomobject]@{campaignId=$json.campaignId;lessonPropagation=$json.lessonPropagation;lessonsExists=$true} | ConvertTo-Json -Compress",
  "description": "Validate campaign manifest",
  "initial_wait": 30,
  "mode": "sync"
}
```

</details>

```
{"campaignId":"44df0558-cc33-4923-ad89-c9499c6d3684","lessonPropagation":"off","lessonsExists":true}
<shellId: 2 completed with exit code 0>
```


---

<sub>54s</sub>

### `powershell`

**Capture normalized child baseline**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $repo='edburns/dd-3068633-win32-x64-02'; $raw=& gh api \"repos/$repo/issues/1/sub_issues\" --paginate --slurp 2>&1; $ghCode=$LASTEXITCODE; if ($ghCode -ne 0) { throw \"child lookup failed: $($raw|Out-String)\" }; $flat=($raw|Out-String) | jq 'if length == 0 then [] elif all(.[]; type == \"array\") then add else . end'; $jqCode=$LASTEXITCODE; if ($jqCode -ne 0) { throw 'pagination normalization failed' }; $parsed=$flat|Out-String|ConvertFrom-Json -NoEnumerate; if ($parsed -isnot [System.Array]) { throw 'Normalized children must be an array' }; if (@($parsed|Where-Object { $_ -is [System.Array] }).Count -ne 0) { throw 'Normalized children must be flat' }; ConvertTo-Json -InputObject ([object[]]$parsed) -Depth 5 -Compress",
  "description": "Capture normalized child baseline",
  "initial_wait": 120,
  "mode": "sync"
}
```

</details>

```
[]
<shellId: 3 completed with exit code 0>
```


---

<sub>53s</sub>

### `powershell`

**Inspect worktree and base branch**

<details>
<summary>Arguments</summary>

```json
{
  "command": "git --no-pager status --short; git --no-pager branch --show-current; git --no-pager log -1 --oneline experiment/shepherd-control",
  "description": "Inspect worktree and base branch",
  "initial_wait": 30,
  "mode": "sync"
}
```

</details>

```
?? 1-math-control-remove-before-merge/prompts/
experiment/shepherd-control
3208abb test: initialize simple-math control campaign #1
<shellId: 4 completed with exit code 0>
```


---

<sub>1m 6s</sub>

### `powershell`

**Read acceptance test runner**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$base='experiment/shepherd-control'; $out=git show \"${base}:eng/test-math-tool.ps1\" 2>&1; $code=$LASTEXITCODE; if ($code -ne 0) { throw \"runner read failed: $($out|Out-String)\" }; $out|Out-String",
  "description": "Read acceptance test runner",
  "initial_wait": 30,
  "mode": "sync"
}
```

</details>

<details>
<summary>32 lines</summary>

```
[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$requiredVersion = '5.7.1'
$repositoryRoot = Split-Path -Parent $PSScriptRoot
$implementationPath = Join-Path $repositoryRoot 'math-tool.ps1'
$testPath = Join-Path $repositoryRoot 'math-tool.Tests.ps1'

$implementationExists = Test-Path -LiteralPath $implementationPath -PathType Leaf
$testsExist = Test-Path -LiteralPath $testPath -PathType Leaf
if (-not $implementationExists -and -not $testsExist) {
    Write-Host 'Math-tool implementation has not been introduced yet; baseline validation passed.'
    exit 0
}
if (-not $implementationExists -or -not $testsExist) {
    throw 'math-tool.ps1 and math-tool.Tests.ps1 must be introduced together.'
}

$available = Get-Module -ListAvailable Pester |
    Where-Object { $_.Version.ToString() -eq $requiredVersion } |
    Select-Object -First 1
if (-not $available) {
    Write-Host "Installing Pester $requiredVersion in CurrentUser scope..."
    Install-Module Pester -RequiredVersion $requiredVersion -Scope CurrentUser -Force
}

Import-Module Pester -RequiredVersion $requiredVersion -Force
$result = Invoke-Pester -Path $testPath -PassThru
if ($result.FailedCount -gt 0) {
    Write-Error "Pester reported $($result.FailedCount) failed test(s)."
    exit 1
}
exit 0
<shellId: 5 completed with exit code 0>
```

</details>


---

<sub>1m 7s</sub>

### `powershell`

**Read pinned CI workflow**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$base='experiment/shepherd-control'; $out=git show \"${base}:.github/workflows/shepherd-task-math-tool.yml\" 2>&1; $code=$LASTEXITCODE; if ($code -ne 0) { throw \"workflow read failed: $($out|Out-String)\" }; $out|Out-String",
  "description": "Read pinned CI workflow",
  "initial_wait": 30,
  "mode": "sync"
}
```

</details>

<details>
<summary>20 lines</summary>

```
name: Shepherd task math tool

on:
  pull_request:
  push:
  workflow_dispatch:

permissions:
  contents: read

jobs:
  test:
    name: Shepherd task math tool
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install Pester 5.7.1
        shell: pwsh
        run: Install-Module Pester -RequiredVersion 5.7.1 -Scope CurrentUser -Force
      - name: Test math tool
        shell: pwsh
        run: ./eng/test-math-tool.ps1
<shellId: 6 completed with exit code 0>
```

</details>


---

<sub>1m 7s</sub>

### `powershell`

**Find math tool files on base**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$base='experiment/shepherd-control'; $tree=git ls-tree -r --name-only $base 2>&1; $code=$LASTEXITCODE; if ($code -ne 0) { throw \"tree listing failed: $($tree|Out-String)\" }; $tree | Where-Object { $_ -match '(math-tool|Pester|psd1|psm1)' } | Out-String",
  "description": "Find math tool files on base",
  "initial_wait": 30,
  "mode": "sync"
}
```

</details>

```
.github/workflows/shepherd-task-math-tool.yml
1-math-control-remove-before-merge/math-tool-ignorance-reduction-plan.md
eng/test-math-tool.ps1
<shellId: 7 completed with exit code 0>
```


---

<sub>1m 8s</sub>

### `powershell`

**Read parent issue context**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$out=& gh api 'repos/edburns/dd-3068633-win32-x64-02/issues/1' 2>&1; $code=$LASTEXITCODE; if ($code -ne 0) { throw \"parent fetch failed: $($out|Out-String)\" }; $issue=$out|Out-String|ConvertFrom-Json; [pscustomobject]@{title=$issue.title;body=$issue.body;labels=@($issue.labels|ForEach-Object name);assignees=@($issue.assignees|ForEach-Object login)}|ConvertTo-Json -Depth 4",
  "description": "Read parent issue context",
  "initial_wait": 120,
  "mode": "sync"
}
```

</details>

<details>
<summary>7 lines</summary>

```
{
  "title": "[Campaign][off] shepherd-task simple-math control",
  "body": "## Shepherd-task simple-math control campaign\n\nThis campaign contains two serial math-tool tasks and runs with lesson\npropagation disabled.\n\n- Campaign base branch: `experiment/shepherd-control`\n- Campaign shortname: `math-control`\n- Lesson propagation: `off`\n- Immutable baseline SHA: `7dcbdc725410a68aa924f88c51b4b5d9ddb8aab0`\n- Expected task count: 2\n- Task 1: Fibonacci implementation and unit/CLI tests\n- Task 2: factorial and operation dispatch using the same test infrastructure",
  "labels": [],
  "assignees": []
}
<shellId: 8 completed with exit code 0>
```

</details>


---

<sub>1m 10s</sub>

### Copilot

The plan has exactly two direct implementation tasks and both gating questions are resolved: acceptance is the repository runner with Pester 5.7.1, and the CLI/function/output/order contracts are concrete. I’m drafting self-contained serial specifications with extra regression gates and no spike-code references.

---

<sub>1m 14s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\validate-stage20-drafts.ps1.**

C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\validate-stage20-drafts.ps1 (lines 1--1)

<details>
<summary>60 lines</summary>

```
# shepherd-task-version: 1.0.4
<#
.SYNOPSIS
    Validates persisted stage-20 issue bodies before GitHub mutation.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$BodyDirectory,

    [Parameter(Mandatory)]
    [ValidateRange(1, [int]::MaxValue)]
    [int]$ExpectedCount,

    [Parameter(Mandatory)]
    [ValidateSet('off', 'campaign')]
    [string]$LessonPropagation
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $BodyDirectory -PathType Container)) {
    throw "Stage-20 body directory does not exist: $BodyDirectory"
}

$bodyFiles = @(
    Get-ChildItem -LiteralPath $BodyDirectory -Filter '*-body.md' -File |
        Where-Object { $_.Name -notlike '*-observed-body.md' } |
        Sort-Object Name
)
if ($bodyFiles.Count -ne $ExpectedCount) {
    throw "Expected $ExpectedCount persisted stage-20 body files; found $($bodyFiles.Count)."
}

$requiredHeadings = @(
    '## Campaign context and required reading',
    '## Branch and execution order',
    '## Implement',
    '## Completion gates',
    '## Out of scope'
)

foreach ($bodyFile in $bodyFiles) {
    $text = [System.IO.File]::ReadAllText($bodyFile.FullName)
    $lines = [System.IO.File]::ReadAllLines($bodyFile.FullName)
    if ([string]::IsNullOrWhiteSpace($text) -or $text -notmatch "`r?`n" -or $lines.Count -le 1) {
        throw "Persisted issue body must contain physical Markdown lines: $($bodyFile.FullName)"
    }

    $firstNonblank = $lines | Where-Object { -not [string]::IsNullOrWhiteSpace($_) } | Select-Object -First 1
    if ($firstNonblank -notmatch '^##\s+\S') {
        throw "Persisted issue body must begin with a level-two heading: $($bodyFile.FullName)"
    }

    foreach ($heading in $requiredHeadings) {
        if ($lines -cnotcontains $heading) {
            throw "Persisted issue body is missing the physical heading '$heading': $($bodyFile.FullName)"
        }
    }

    $hasCampaignLessons = $lines -ccontains '## Campaign lessons (REQUIRED)'
    if ($LessonPropagation -eq 'campaign' -and -not $hasCampaignLessons) {
        throw "Treatment issue body is missing its campaign-lessons heading: $($bodyFile.FullName)"
    }
    if ($LessonPropagation -eq 'off' -and $hasCampaignLessons) {
        throw "Control issue body unexpectedly contains a campaign-lessons heading: $($bodyFile.FullName)"
    }
}

$bodyFiles
```

</details>


---

<sub>1m 14s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1.**

C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1 (lines 1--1)

<details>
<summary>166 lines</summary>

```
# shepherd-task-version: 1.0.4
<#
.SYNOPSIS
    Fetches a GitHub issue through REST and verifies its body against a file.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidatePattern('^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$')]
    [string]$Repository,

    [Parameter(Mandatory)]
    [ValidateRange(1, [int]::MaxValue)]
    [int]$IssueNumber,

    [Parameter(Mandatory)]
    [string]$ExpectedBodyPath,

    [ValidateRange(1, 100)]
    [int]$MaxAttempts = 6,

    [ValidateRange(0, 300)]
    [int]$DelaySeconds = 5,

    [string]$DiagnosticPath,

    [string]$GitHubCli = 'gh'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false

function ConvertTo-NormalizedLineEndings {
    param([AllowEmptyString()][string]$Text)
    return $Text -replace "`r`n|`r", "`n"
}

function Test-EquivalentBody {
    param(
        [AllowEmptyString()][string]$Actual,
        [AllowEmptyString()][string]$Expected
    )

    if ($Actual -ceq $Expected) {
        return $true
    }
    if ($Actual.EndsWith("`n") -and $Actual.Substring(0, $Actual.Length - 1) -ceq $Expected) {
        return $true
    }
    if ($Expected.EndsWith("`n") -and $Expected.Substring(0, $Expected.Length - 1) -ceq $Actual) {
        return $true
    }
    return $false
}

function Get-Sha256 {
    param([AllowEmptyString()][string]$Text)

    $bytes = [System.Text.UTF8Encoding]::new($false).GetBytes($Text)
    return [Convert]::ToHexString([System.Security.Cryptography.SHA256]::HashData($bytes)).ToLowerInvariant()
}

function Get-FirstDifference {
    param(
        [AllowEmptyString()][string]$Actual,
        [AllowEmptyString()][string]$Expected
    )

    $limit = [Math]::Min($Actual.Length, $Expected.Length)
    $offset = 0
    while ($offset -lt $limit -and $Actual[$offset] -ceq $Expected[$offset]) {
        $offset++
    }
    if ($offset -eq $limit -and $Actual.Length -eq $Expected.Length) {
        return $null
    }

    $prefix = $Expected.Substring(0, [Math]::Min($offset, $Expected.Length))
    $line = ([regex]::Matches($prefix, "`n").Count) + 1
    $lastNewline = $prefix.LastIndexOf("`n", [StringComparison]::Ordinal)
    $column = if ($lastNewline -lt 0) { $offset + 1 } else { $offset - $lastNewline }
    return [ordered]@{
        offset = $offset
        line = $line
        column = $column
    }
}

function Test-TerminalGitHubFailure {
    param([string]$Message)
    return $Message -match '(?i)(HTTP\s+(401|403)|authentication|not authorized|resource not accessible)'
}

function Write-Diagnostic {
    param(
        [string]$Reason,
        [int]$Attempts,
        [AllowEmptyString()][string]$Actual,
        [AllowEmptyString()][string]$Expected
    )

    if ([string]::IsNullOrWhiteSpace($DiagnosticPath)) {
        return
    }

    $parent = Split-Path -Parent $DiagnosticPath
    if (-not [string]::IsNullOrWhiteSpace($parent) -and
        -not (Test-Path -LiteralPath $parent -PathType Container)) {
        New-Item -ItemType Directory -Path $parent | Out-Null
    }

    $diagnostic = [ordered]@{
        schemaVersion = 1
        repository = $Repository
        issueNumber = $IssueNumber
        endpoint = "repos/$Repository/issues/$IssueNumber"
        attempts = $Attempts
        observedAt = (Get-Date).ToUniversalTime().ToString('o')
        reason = $Reason
        expectedLength = $Expected.Length
        actualLength = $Actual.Length
        expectedSha256 = Get-Sha256 $Expected
        actualSha256 = Get-Sha256 $Actual
        firstDifference = Get-FirstDifference -Actual $Actual -Expected $Expected
    }
    $diagnostic | ConvertTo-Json -Depth 4 |
        Set-Content -LiteralPath $DiagnosticPath -Encoding utf8NoBOM
}

if (-not (Test-Path -LiteralPath $ExpectedBodyPath -PathType Leaf)) {
    throw "Expected issue body file not found: $ExpectedBodyPath"
}

$expected = ConvertTo-NormalizedLineEndings (
    Get-Content -LiteralPath $ExpectedBodyPath -Raw
)
$lastReason = ''
$lastActual = ''
$previousConsoleOutputEncoding = [Console]::OutputEncoding
$previousOutputEncoding = $OutputEncoding
$utf8Encoding = [System.Text.UTF8Encoding]::new($false)

try {
    [Console]::OutputEncoding = $utf8Encoding
    $OutputEncoding = $utf8Encoding

    for ($attempt = 1; $attempt -le $MaxAttempts; $attempt++) {
        $output = (& $GitHubCli api "repos/$Repository/issues/$IssueNumber" 2>&1 | Out-String).Trim()
        $exitCode = $LASTEXITCODE
        if ($exitCode -ne 0) {
            $lastReason = "GitHub REST request failed with exit code $exitCode."
            if (Test-TerminalGitHubFailure $output) {
                Write-Diagnostic -Reason $lastReason -Attempts $attempt -Actual '' -Expected $expected
                throw "Unable to fetch issue #$IssueNumber from ${Repository}: $output"
            }
        }
        else {
            try {
                $issue = $output | ConvertFrom-Json
                $lastActual = ConvertTo-NormalizedLineEndings ([string]$issue.body)
                if (Test-EquivalentBody -Actual $lastActual -Expected $expected) {
                    return $issue
                }
                $lastReason = 'GitHub issue body differs from the persisted draft.'
            }
            catch {
                $lastReason = "GitHub REST response was invalid JSON: $($_.Exception.Message)"
            }
        }

        if ($attempt -lt $MaxAttempts) {
            Write-Warning "$lastReason Retrying issue #$IssueNumber body verification ($attempt/$MaxAttempts)."
            if ($DelaySeconds -gt 0) {
                Start-Sleep -Seconds $DelaySeconds
            }
        }
    }

    Write-Diagnostic -Reason $lastReason -Attempts $MaxAttempts -Actual $lastActual -Expected $expected
    $diagnosticSuffix = if ([string]::IsNullOrWhiteSpace($DiagnosticPath)) {
        ''
    }
    else {
        " Diagnostic: $DiagnosticPath"
    }
    throw "Issue #$IssueNumber body verification failed after $MaxAttempts attempts. $lastReason$diagnosticSuffix"
}
finally {
    $OutputEncoding = $previousOutputEncoding
    [Console]::OutputEncoding = $previousConsoleOutputEncoding
}
```

</details>


---

<sub>1m 15s</sub>

### `sql`

**Advance drafting phase**

<details>
<summary>Arguments</summary>

```json
{
  "description": "Advance drafting phase",
  "query": "UPDATE todos SET status='done' WHERE id='validate-stage20'; UPDATE todos SET status='in_progress' WHERE id='draft-stage20';"
}
```

</details>

<details>
<summary>5 lines</summary>

```
Executed 2 statement(s):

1. UPDATE
   1 row(s) updated.

2. UPDATE
   1 row(s) updated.
```

</details>


---

<sub>1m 47s</sub>

### `apply_patch`

<details>
<summary>Arguments</summary>

```json
"*** Begin Patch\n*** Add File: 1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2030/issue-bodies/01-1-implement-fibonacci-body.md\n+## Campaign context and required reading\n+\n+On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.\n+\n+Read the entire plan before working. Then re-read these exact sections:\n+\n+- `## Ignorance reduction`\n+- `### Repository-owned validation`\n+- `### Output and ordering contracts`\n+- `## Implementation`\n+- `### 1. Implement Fibonacci with unit and isolated CLI coverage`\n+\n+The resolved acceptance contract is the committed command `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The repository-owned runner and `.github/workflows/shepherd-task-math-tool.yml` use exactly Pester 5.7.1; do not replace, bypass, or weaken that runner.\n+\n+The resolved behavior contract is:\n+\n+- Direct CLI execution writes exactly one result line to stdout in the form `Fibonacci(N) = value`.\n+- `Get-Fibonacci` returns only the numeric result and produces no incidental output.\n+- Supported inputs are non-negative integers.\n+- The implementation and test files are repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.\n+\n+Research for the plan established that unit behavior and direct CLI behavior are separate contracts. Test the function by dot-sourcing the production script, and test the CLI through an isolated child `pwsh` process so output from direct execution cannot be confused with function return values. Implement production behavior from the plan's findings; do not copy or adapt research code.\n+\n+## Branch and execution order\n+\n+Target `experiment/shepherd-control` as the PR base branch. This is implementation subsection 1 and the first of two serial tasks. Tasks are assigned, completed, and merged in plan order. Do not begin work until this issue is assigned. The factorial/dispatch task starts only after this task is merged.\n+\n+## Implement\n+\n+Create repository-root `math-tool.ps1` with:\n+\n+- A script parameter named `N` accepting non-negative integer input.\n+- A pure `Get-Fibonacci` function that computes the Fibonacci value for `N` and returns only that numeric value.\n+- Direct-execution behavior that emits exactly `Fibonacci(N) = value` as the sole stdout line.\n+- Dot-source behavior suitable for unit testing: importing the function must not emit the direct-execution result line.\n+\n+Create repository-root `math-tool.Tests.ps1` using Pester 5.7.1 with:\n+\n+- Dot-sourced unit tests for `Get-Fibonacci`.\n+- Cases for `N=0`, `N=1`, and at least one small representative value greater than 1.\n+- Isolated child-`pwsh` process tests of direct CLI execution for the same boundary and representative inputs.\n+- Assertions on the complete CLI stdout contract, including that there is exactly one result line and no incidental output.\n+\n+Use the repository's existing PowerShell style and keep the implementation deterministic and small.\n+\n+## Completion gates\n+\n+- `Get-Fibonacci 0` returns numeric `0` without extra output.\n+- `Get-Fibonacci 1` returns numeric `1` without extra output.\n+- A representative Fibonacci input greater than 1 returns the expected numeric value without extra output.\n+- Dot-sourcing `math-tool.ps1` exposes `Get-Fibonacci` without printing a CLI result.\n+- Direct child-process execution for each covered input exits successfully and stdout is exactly one line matching `Fibonacci(N) = value`.\n+- `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero.\n+- The pinned pull-request workflow passes with Pester 5.7.1.\n+\n+## Out of scope\n+\n+- Do not implement factorial or operation dispatch; those belong to subsection 2.\n+- Do not change the canonical runner, pinned Pester version, or CI workflow.\n+- Do not add unrelated files, dependencies, output formats, or behavior for inputs outside the resolved non-negative-integer contract.\n+- Keep changes limited to `math-tool.ps1` and `math-tool.Tests.ps1`.\n*** Add File: 1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2030/issue-bodies/02-2-add-factorial-dispatch-body.md\n+## Campaign context and required reading\n+\n+On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.\n+\n+Read the entire plan before working. Then re-read these exact sections:\n+\n+- `## Ignorance reduction`\n+- `### Repository-owned validation`\n+- `### Output and ordering contracts`\n+- `## Implementation`\n+- `### 1. Implement Fibonacci with unit and isolated CLI coverage`\n+- `### 2. Add factorial and operation dispatch`\n+\n+The resolved acceptance contract is the committed command `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The repository-owned runner and `.github/workflows/shepherd-task-math-tool.yml` use exactly Pester 5.7.1; do not replace, bypass, or weaken that runner.\n+\n+The resolved behavior contract is:\n+\n+- Direct CLI execution writes exactly one result line to stdout: `Fibonacci(N) = value` or `Factorial(N) = value`, according to the selected operation.\n+- `Get-Fibonacci` and `Get-Factorial` return only numeric results and produce no incidental output.\n+- Supported inputs are non-negative integers.\n+- The implementation and tests remain in repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.\n+- Fibonacci behavior delivered by the merged first task must remain compatible.\n+\n+Research for the plan established that operation functions and direct CLI dispatch are distinct contracts. Exercise pure functions through dot-sourced tests and exercise each operation's formatted output through isolated child `pwsh` processes. Implement production behavior from the plan's findings; do not copy or adapt research code.\n+\n+## Branch and execution order\n+\n+Target `experiment/shepherd-control` as the PR base branch. This is implementation subsection 2 and the second of two serial tasks. Tasks are assigned, completed, and merged in plan order. Do not begin until this issue is assigned and subsection 1 has been merged into the base branch.\n+\n+## Implement\n+\n+Extend the merged repository-root `math-tool.ps1` with:\n+\n+- A pure `Get-Factorial` function that computes factorial for non-negative integer `N` and returns only the numeric result.\n+- An `Operation` parameter that dispatches between `fibonacci` and `factorial` while retaining the `N` parameter.\n+- Exact direct-execution output of `Fibonacci(N) = value` for Fibonacci and `Factorial(N) = value` for factorial, with no additional stdout.\n+- Preservation of the existing Fibonacci function, results, CLI formatting, and invocation behavior. Calls that supplied only `N` before this task must continue to run Fibonacci; explicit Fibonacci dispatch must produce the same result and output.\n+- Dot-source behavior that exposes both pure functions without emitting a direct-execution result line.\n+\n+Extend `math-tool.Tests.ps1` using the existing production test structure. Add:\n+\n+- Dot-sourced unit coverage for `Get-Factorial` at `N=0`, `N=1`, and at least one small representative value greater than 1.\n+- Isolated child-`pwsh` CLI coverage for explicit factorial dispatch with exact complete stdout assertions.\n+- Explicit Fibonacci dispatch coverage.\n+- Regression coverage proving the task-1 Fibonacci unit and direct CLI contracts still pass, including the prior invocation that supplies only `N`.\n+\n+Keep the interface and test suite objective and small.\n+\n+## Completion gates\n+\n+- `Get-Factorial 0` returns numeric `1` without extra output.\n+- `Get-Factorial 1` returns numeric `1` without extra output.\n+- A representative factorial input greater than 1 returns the expected numeric value without extra output.\n+- Dot-sourcing `math-tool.ps1` exposes both functions without printing a CLI result.\n+- Explicit `fibonacci` and `factorial` child-process invocations exit successfully and each emits exactly one correctly formatted result line.\n+- The task-1 Fibonacci boundary, representative-value, and isolated CLI tests remain green, including invocation with only `N`.\n+- The combined suite demonstrates dispatch selects the requested operation rather than accidentally using the other calculation.\n+- `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero.\n+- The pinned pull-request workflow passes with Pester 5.7.1.\n+\n+## Out of scope\n+\n+- Do not change the canonical runner, pinned Pester version, or CI workflow.\n+- Do not redesign or rename the merged Fibonacci API or alter its output contract.\n+- Do not add operations other than Fibonacci and factorial, unrelated dependencies, or behavior for inputs outside the resolved non-negative-integer contract.\n+- Keep changes limited to `math-tool.ps1` and `math-tool.Tests.ps1`.\n*** End Patch\n"
```

</details>

```
Added 2 file(s): C:\Users\edburns\workareas\dd-3068633-win32-x64-02-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260923-2030\issue-bodies\01-1-implement-fibonacci-body.md, C:\Users\edburns\workareas\dd-3068633-win32-x64-02-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260923-2030\issue-bodies\02-2-add-factorial-dispatch-body.md
```


---

<sub>2m 0s</sub>

### `powershell`

**Validate persisted issue drafts**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $validator='C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\validate-stage20-drafts.ps1'; $bodyDir='C:\\Users\\edburns\\workareas\\dd-3068633-win32-x64-02-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260923-2030\\issue-bodies'; $validated=@(& $validator -BodyDirectory $bodyDir -ExpectedCount 2 -LessonPropagation off); if ($validated.Count -ne 2) { throw \"Validator returned $($validated.Count) files\" }; $validated | Select-Object Name,Length | Format-Table -AutoSize | Out-String",
  "description": "Validate persisted issue drafts",
  "initial_wait": 120,
  "mode": "sync"
}
```

</details>

```
Name                                Length
----                                ------
01-1-implement-fibonacci-body.md      4053
02-2-add-factorial-dispatch-body.md   4835
<shellId: 9 completed with exit code 0>
```


---

<sub>2m 12s</sub>

### Copilot

Both persisted drafts passed the supplied validator. I’m beginning the one-shot GitHub mutation now: each issue will be created, body-verified, and linked before the next starts, with atomic ledger/result updates and normalized pagination for every child-state check.

---

<sub>2m 43s</sub>

### `apply_patch`

<details>
<summary>Arguments</summary>

```json
"*** Begin Patch\n*** Add File: 1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2030/run-stage20.ps1\n+[CmdletBinding()]\n+param()\n+\n+Set-StrictMode -Version Latest\n+$ErrorActionPreference = 'Stop'\n+$PSNativeCommandUseErrorActionPreference = $false\n+\n+$repository = 'edburns/dd-3068633-win32-x64-02'\n+$parentIssue = 1\n+$logDirectory = 'C:\\Users\\edburns\\workareas\\dd-3068633-win32-x64-02-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260923-2030'\n+$bodyDirectory = Join-Path $logDirectory 'issue-bodies'\n+$ledgerPath = Join-Path $logDirectory 'creation-ledger.json'\n+$resultPath = Join-Path $logDirectory 'stage-20-result.json'\n+$bodyVerifier = 'C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\verify-github-issue-body.ps1'\n+$selectedIssueType = ''\n+\n+$specifications = @(\n+    [pscustomobject]@{\n+        ImplementationSubsection = '1. Implement Fibonacci with unit and isolated CLI coverage'\n+        Title = '1. Implement Fibonacci with unit and isolated CLI coverage'\n+        BodyFile = Join-Path $bodyDirectory '01-1-implement-fibonacci-body.md'\n+    },\n+    [pscustomobject]@{\n+        ImplementationSubsection = '2. Add factorial and operation dispatch'\n+        Title = '2. Add factorial and operation dispatch'\n+        BodyFile = Join-Path $bodyDirectory '02-2-add-factorial-dispatch-body.md'\n+    }\n+)\n+\n+function Write-AtomicText {\n+    param(\n+        [Parameter(Mandatory)][string]$Path,\n+        [Parameter(Mandatory)][AllowEmptyString()][string]$Content\n+    )\n+\n+    $temporaryPath = \"$Path.$([Guid]::NewGuid().ToString('N')).tmp\"\n+    [IO.File]::WriteAllText($temporaryPath, $Content, [Text.UTF8Encoding]::new($false))\n+    Move-Item -LiteralPath $temporaryPath -Destination $Path -Force\n+}\n+\n+function Write-JsonDocument {\n+    param(\n+        [Parameter(Mandatory)][string]$Path,\n+        [Parameter(Mandatory)][AllowEmptyCollection()][object]$Value\n+    )\n+\n+    $json = ConvertTo-Json -InputObject $Value -Depth 10\n+    Write-AtomicText -Path $Path -Content $json\n+}\n+\n+function Read-CreationLedger {\n+    $parsed = [IO.File]::ReadAllText($ledgerPath) |\n+        ConvertFrom-Json -NoEnumerate\n+    if ($parsed -isnot [System.Array]) {\n+        throw 'Creation ledger JSON root must be an array.'\n+    }\n+\n+    $ledger = [object[]]$parsed\n+    if (@($ledger | Where-Object { $_ -is [System.Array] }).Count -ne 0) {\n+        throw 'Creation ledger must not contain nested array entries.'\n+    }\n+    return $ledger\n+}\n+\n+function Write-CreationLedger {\n+    param([Parameter(Mandatory)][AllowEmptyCollection()][object[]]$Ledger)\n+\n+    $json = ConvertTo-Json -InputObject ([object[]]$Ledger) -Depth 10\n+    Write-AtomicText -Path $ledgerPath -Content $json\n+}\n+\n+function Update-LedgerFlag {\n+    param(\n+        [Parameter(Mandatory)][int]$Number,\n+        [Parameter(Mandatory)][ValidateSet('body_verified', 'linked')][string]$Field,\n+        [Parameter(Mandatory)][bool]$Value\n+    )\n+\n+    $ledger = @(Read-CreationLedger)\n+    $entry = $ledger | Where-Object { $_.number -eq $Number }\n+    if (@($entry).Count -ne 1) {\n+        throw \"Expected one ledger entry for issue #$Number.\"\n+    }\n+    $entry.$Field = $Value\n+    Write-CreationLedger -Ledger $ledger\n+}\n+\n+function Get-NormalizedChildren {\n+    $childrenOutput = & gh api \"repos/$repository/issues/$parentIssue/sub_issues\" --paginate --slurp 2>&1\n+    $childrenExitCode = $LASTEXITCODE\n+    if ($childrenExitCode -ne 0) {\n+        throw \"Unable to query parent children: $($childrenOutput | Out-String)\"\n+    }\n+\n+    $normalizedOutput = ($childrenOutput | Out-String) |\n+        & jq 'if length == 0 then [] elif all(.[]; type == \"array\") then add else . end' 2>&1\n+    $jqExitCode = $LASTEXITCODE\n+    if ($jqExitCode -ne 0) {\n+        throw \"Unable to normalize paginated children: $($normalizedOutput | Out-String)\"\n+    }\n+\n+    $parsed = ($normalizedOutput | Out-String) | ConvertFrom-Json -NoEnumerate\n+    if ($parsed -isnot [System.Array]) {\n+        throw 'Normalized parent children response must be an array.'\n+    }\n+    $children = [object[]]$parsed\n+    if (@($children | Where-Object { $_ -is [System.Array] }).Count -ne 0) {\n+        throw 'Normalized parent children response must be flat.'\n+    }\n+    return $children\n+}\n+\n+function Invoke-BodyVerification {\n+    param(\n+        [Parameter(Mandatory)][int]$IssueNumber,\n+        [Parameter(Mandatory)][string]$ExpectedBodyPath\n+    )\n+\n+    return & $bodyVerifier `\n+        -Repository $repository `\n+        -IssueNumber $IssueNumber `\n+        -ExpectedBodyPath $ExpectedBodyPath `\n+        -MaxAttempts 6 `\n+        -DelaySeconds 5 `\n+        -DiagnosticPath (Join-Path $logDirectory \"issue-$IssueNumber-body-verification-failure.json\")\n+}\n+\n+function Write-Result {\n+    param(\n+        [Parameter(Mandatory)][ValidateSet('in_progress', 'complete', 'failed')][string]$Status,\n+        [AllowNull()][string]$OperationError\n+    )\n+\n+    $result = [ordered]@{\n+        schemaVersion = 1\n+        status = $Status\n+        ledgerFile = 'creation-ledger.json'\n+        operationError = $OperationError\n+    }\n+    Write-JsonDocument -Path $resultPath -Value $result\n+}\n+\n+$operation = 'initialize'\n+$baseline = @()\n+\n+try {\n+    $baseline = @(Get-NormalizedChildren)\n+    Write-CreationLedger -Ledger ([object[]]@())\n+    Write-Result -Status in_progress -OperationError $null\n+\n+    foreach ($specification in $specifications) {\n+        $operation = \"create issue for $($specification.ImplementationSubsection)\"\n+        if ([string]::IsNullOrEmpty($selectedIssueType)) {\n+            $createOutput = & gh api \"repos/$repository/issues\" `\n+                -X POST `\n+                -f \"title=$($specification.Title)\" `\n+                -F \"body=@$($specification.BodyFile)\" 2>&1\n+        }\n+        else {\n+            $createOutput = & gh api \"repos/$repository/issues\" `\n+                -X POST `\n+                -f \"title=$($specification.Title)\" `\n+                -F \"body=@$($specification.BodyFile)\" `\n+                -f \"type=$selectedIssueType\" 2>&1\n+        }\n+        $createExitCode = $LASTEXITCODE\n+        if ($createExitCode -ne 0) {\n+            throw \"Issue creation failed: $($createOutput | Out-String)\"\n+        }\n+        $createdIssue = ($createOutput | Out-String) | ConvertFrom-Json\n+        if (-not $createdIssue.id -or -not $createdIssue.number -or -not $createdIssue.html_url) {\n+            throw \"Issue creation returned an incomplete identity: $($createOutput | Out-String)\"\n+        }\n+\n+        $ledger = @(Read-CreationLedger)\n+        $relativeBodyFile = [IO.Path]::GetRelativePath($logDirectory, $specification.BodyFile)\n+        $ledger += [pscustomobject][ordered]@{\n+            implementationSubsection = $specification.ImplementationSubsection\n+            bodyFile = $relativeBodyFile\n+            id = [long]$createdIssue.id\n+            number = [int]$createdIssue.number\n+            title = [string]$createdIssue.title\n+            url = [string]$createdIssue.html_url\n+            body_verified = $false\n+            linked = $false\n+        }\n+        Write-CreationLedger -Ledger $ledger\n+\n+        $operation = \"verify body for issue #$($createdIssue.number)\"\n+        $null = Invoke-BodyVerification `\n+            -IssueNumber ([int]$createdIssue.number) `\n+            -ExpectedBodyPath $specification.BodyFile\n+        Update-LedgerFlag -Number ([int]$createdIssue.number) -Field body_verified -Value $true\n+\n+        $operation = \"link issue #$($createdIssue.number) to parent #$parentIssue\"\n+        $linked = $false\n+        $lastLinkError = ''\n+        for ($attempt = 1; $attempt -le 3 -and -not $linked; $attempt++) {\n+            $payload = '{\"sub_issue_id\": ' + [long]$createdIssue.id + '}'\n+            $linkOutput = $payload |\n+                & gh api \"repos/$repository/issues/$parentIssue/sub_issues\" -X POST --input - 2>&1\n+            $linkExitCode = $LASTEXITCODE\n+            if ($linkExitCode -eq 0) {\n+                $linked = $true\n+            }\n+            else {\n+                $lastLinkError = ($linkOutput | Out-String)\n+                if ($attempt -lt 3) {\n+                    Start-Sleep -Seconds 2\n+                }\n+            }\n+        }\n+        if (-not $linked) {\n+            throw \"Linking failed after three attempts: $lastLinkError\"\n+        }\n+        Update-LedgerFlag -Number ([int]$createdIssue.number) -Field linked -Value $true\n+    }\n+\n+    $operation = 'verify final parent-child count and order'\n+    $ledger = @(Read-CreationLedger)\n+    $finalChildren = @(Get-NormalizedChildren)\n+    if ($finalChildren.Count -ne ($baseline.Count + $ledger.Count)) {\n+        throw \"Parent child count was $($finalChildren.Count); expected $($baseline.Count + $ledger.Count).\"\n+    }\n+\n+    foreach ($entry in $ledger) {\n+        $occurrences = @($finalChildren | Where-Object { [long]$_.id -eq [long]$entry.id }).Count\n+        if ($occurrences -ne 1) {\n+            throw \"Issue #$($entry.number) occurs $occurrences times in the parent child list.\"\n+        }\n+        if (-not $entry.linked) {\n+            throw \"Ledger entry for issue #$($entry.number) is not marked linked.\"\n+        }\n+    }\n+\n+    $baselineIds = @($baseline | ForEach-Object { [long]$_.id })\n+    $newChildren = @($finalChildren | Where-Object { [long]$_.id -notin $baselineIds })\n+    $expectedIds = @($ledger | ForEach-Object { [long]$_.id })\n+    $observedIds = @($newChildren | ForEach-Object { [long]$_.id })\n+    if (($expectedIds -join ',') -cne ($observedIds -join ',')) {\n+        throw \"New child order does not match plan order. Expected $($expectedIds -join ','); observed $($observedIds -join ',').\"\n+    }\n+\n+    $operation = 'verify final issue bodies, state, and assignees'\n+    foreach ($entry in $ledger) {\n+        $bodyPath = Join-Path $logDirectory $entry.bodyFile\n+        $issue = Invoke-BodyVerification -IssueNumber ([int]$entry.number) -ExpectedBodyPath $bodyPath\n+        if ($issue.state -ne 'open') {\n+            throw \"Issue #$($entry.number) is not open.\"\n+        }\n+        if (@($issue.assignees).Count -ne 0) {\n+            throw \"Issue #$($entry.number) unexpectedly has assignees.\"\n+        }\n+        if (-not $entry.body_verified) {\n+            throw \"Ledger entry for issue #$($entry.number) is not marked body_verified.\"\n+        }\n+    }\n+\n+    Write-Result -Status complete -OperationError $null\n+    [pscustomobject]@{\n+        Status = 'complete'\n+        SelectedIssueType = if ($selectedIssueType) { $selectedIssueType } else { 'none' }\n+        BaselineChildCount = $baseline.Count\n+        FinalChildCount = $finalChildren.Count\n+        Ledger = @(Read-CreationLedger)\n+    } | ConvertTo-Json -Depth 10\n+}\n+catch {\n+    $failure = \"$operation`: $($_.Exception.Message)\"\n+    try {\n+        $ledger = @(Read-CreationLedger)\n+        $serverChildren = @(Get-NormalizedChildren)\n+        $serverIds = @($serverChildren | ForEach-Object { [long]$_.id })\n+        foreach ($entry in $ledger) {\n+            $entry.linked = ([long]$entry.id -in $serverIds)\n+        }\n+        Write-CreationLedger -Ledger $ledger\n+    }\n+    catch {\n+        $failure = \"$failure Reconciliation also failed: $($_.Exception.Message)\"\n+    }\n+\n+    Write-Result -Status failed -OperationError $failure\n+    $ledger = @(Read-CreationLedger)\n+    [Console]::Error.WriteLine(\"Stage 20 failed: $failure\")\n+    if ($ledger.Count -eq 0) {\n+        [Console]::Error.WriteLine('No issues were created; no cleanup is required.')\n+    }\n+    else {\n+        [Console]::Error.WriteLine((ConvertTo-Json -InputObject ([object[]]$ledger) -Depth 10))\n+        foreach ($entry in $ledger) {\n+            [Console]::Error.WriteLine(\"gh issue delete $($entry.number) --repo `\"$repository`\" --yes\")\n+        }\n+        [Console]::Error.WriteLine('The operation did not complete and no automatic rollback was performed. Delete every issue in the ledger before invoking stage 20 again.')\n+    }\n+    exit 1\n+}\n*** End Patch\n"
```

</details>

```
Added 1 file(s): C:\Users\edburns\workareas\dd-3068633-win32-x64-02-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260923-2030\run-stage20.ps1
```


---

<sub>2m 55s</sub>

### `powershell`

**Create, link, and verify child issues**

<details>
<summary>Arguments</summary>

```json
{
  "command": "& 'C:\\Users\\edburns\\workareas\\dd-3068633-win32-x64-02-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260923-2030\\run-stage20.ps1'",
  "description": "Create, link, and verify child issues",
  "initial_wait": 180,
  "mode": "sync"
}
```

</details>

<details>
<summary>29 lines</summary>

```
{
  "Status": "complete",
  "SelectedIssueType": "none",
  "BaselineChildCount": 0,
  "FinalChildCount": 2,
  "Ledger": [
    {
      "implementationSubsection": "1. Implement Fibonacci with unit and isolated CLI coverage",
      "bodyFile": "issue-bodies\\01-1-implement-fibonacci-body.md",
      "id": 5561278754,
      "number": 2,
      "title": "1. Implement Fibonacci with unit and isolated CLI coverage",
      "url": "https://github.com/edburns/dd-3068633-win32-x64-02/issues/2",
      "body_verified": true,
      "linked": true
    },
    {
      "implementationSubsection": "2. Add factorial and operation dispatch",
      "bodyFile": "issue-bodies\\02-2-add-factorial-dispatch-body.md",
      "id": 5561279026,
      "number": 3,
      "title": "2. Add factorial and operation dispatch",
      "url": "https://github.com/edburns/dd-3068633-win32-x64-02/issues/3",
      "body_verified": true,
      "linked": true
    }
  ]
}
<shellId: 10 completed with exit code 0>
```

</details>


---

<sub>3m 0s</sub>

### Copilot

Creation completed successfully: #2 and #3 are body-verified, unassigned, open, and linked to #1 in plan order. I’m checking the persisted authoritative result and ledger before handing off the ordered list.

---

<sub>3m 6s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3068633-win32-x64-02-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260923-2030\stage-20-result.json.**

C:\Users\edburns\workareas\dd-3068633-win32-x64-02-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260923-2030\stage-20-result.json (lines 1--1)

<details>
<summary>6 lines</summary>

```
{
  "schemaVersion": 1,
  "status": "complete",
  "ledgerFile": "creation-ledger.json",
  "operationError": ""
}
```

</details>


---

<sub>3m 6s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3068633-win32-x64-02-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260923-2030\creation-ledger.json.**

C:\Users\edburns\workareas\dd-3068633-win32-x64-02-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260923-2030\creation-ledger.json (lines 1--1)

<details>
<summary>22 lines</summary>

```
[
  {
    "implementationSubsection": "1. Implement Fibonacci with unit and isolated CLI coverage",
    "bodyFile": "issue-bodies\\01-1-implement-fibonacci-body.md",
    "id": 5561278754,
    "number": 2,
    "title": "1. Implement Fibonacci with unit and isolated CLI coverage",
    "url": "https://github.com/edburns/dd-3068633-win32-x64-02/issues/2",
    "body_verified": true,
    "linked": true
  },
  {
    "implementationSubsection": "2. Add factorial and operation dispatch",
    "bodyFile": "issue-bodies\\02-2-add-factorial-dispatch-body.md",
    "id": 5561279026,
    "number": 3,
    "title": "2. Add factorial and operation dispatch",
    "url": "https://github.com/edburns/dd-3068633-win32-x64-02/issues/3",
    "body_verified": true,
    "linked": true
  }
]
```

</details>


---

<sub>3m 7s</sub>

### `powershell`

**Check final worktree status**

<details>
<summary>Arguments</summary>

```json
{
  "command": "git --no-pager status --short",
  "description": "Check final worktree status",
  "initial_wait": 30,
  "mode": "sync"
}
```

</details>

```
?? 1-math-control-remove-before-merge/prompts/
<shellId: 11 completed with exit code 0>
```


---

<sub>3m 7s</sub>

### `sql`

**Complete stage workflow**

<details>
<summary>Arguments</summary>

```json
{
  "description": "Complete stage workflow",
  "query": "UPDATE todos SET status='done' WHERE id IN ('draft-stage20','create-stage20','verify-stage20'); SELECT id,status FROM todos ORDER BY created_at;"
}
```

</details>

<details>
<summary>11 lines</summary>

```
Executed 2 statement(s):

1. UPDATE
   3 row(s) updated.

2. SELECT
   4 row(s) returned:
   
   | id | status |
   | --- | --- |
   | validate-stage20 | done |
   | draft-stage20 | done |
   | create-stage20 | done |
   | verify-stage20 | done |
```

</details>


---

<sub>3m 14s</sub>

### `apply_patch`

<details>
<summary>Arguments</summary>

```json
"*** Begin Patch\n*** Update File: 1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2030/run-stage20.ps1\n@@\n     param(\n         [Parameter(Mandatory)][ValidateSet('in_progress', 'complete', 'failed')][string]$Status,\n-        [AllowNull()][string]$OperationError\n+        [AllowNull()][object]$OperationError\n     )\n*** End Patch\n"
```

</details>

```
Modified 1 file(s): C:\Users\edburns\workareas\dd-3068633-win32-x64-02-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260923-2030\run-stage20.ps1
```


---

<sub>3m 19s</sub>

### `powershell`

**Correct and verify final result document**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$path='C:\\Users\\edburns\\workareas\\dd-3068633-win32-x64-02-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260923-2030\\stage-20-result.json'; $tmp=\"$path.$([Guid]::NewGuid().ToString('N')).tmp\"; $value=[ordered]@{schemaVersion=1;status='complete';ledgerFile='creation-ledger.json';operationError=$null}; $json=ConvertTo-Json -InputObject $value -Depth 10; [IO.File]::WriteAllText($tmp,$json,[Text.UTF8Encoding]::new($false)); Move-Item -LiteralPath $tmp -Destination $path -Force; $parsed=[IO.File]::ReadAllText($path)|ConvertFrom-Json; if ($parsed.status -ne 'complete' -or $null -ne $parsed.operationError) { throw 'Final stage result is invalid' }; [IO.File]::ReadAllText($path)",
  "description": "Correct and verify final result document",
  "initial_wait": 30,
  "mode": "sync"
}
```

</details>

<details>
<summary>7 lines</summary>

```
{
  "schemaVersion": 1,
  "status": "complete",
  "ledgerFile": "creation-ledger.json",
  "operationError": null
}
<shellId: 12 completed with exit code 0>
```

</details>


---

<sub>3m 25s</sub>

### Copilot

Created and linked two unassigned child issues to #1 in plan order, **without an issue type**.

| Implementation subsection | Issue | Title | URL |
|---|---:|---|---|
| 1. Implement Fibonacci with unit and isolated CLI coverage | #2 | 1. Implement Fibonacci with unit and isolated CLI coverage | https://github.com/edburns/dd-3068633-win32-x64-02/issues/2 |
| 2. Add factorial and operation dispatch | #3 | 2. Add factorial and operation dispatch | https://github.com/edburns/dd-3068633-win32-x64-02/issues/3 |

**Ordered child numbers:** `2,3`

**Suggested stage 25 invocation:** Invoke `shepherd-task-25-given-list` with `CAMPAIGN_ID=44df0558-cc33-4923-ad89-c9499c6d3684`, `REPO=edburns/dd-3068633-win32-x64-02`, `BASE_BRANCH=experiment/shepherd-control`, `PARENT_ISSUE=1`, `PLAN_DIRECTORY=1-math-control-remove-before-merge`, and ordered issues `2,3`. Stage 25 should derive lesson propagation from the campaign manifest.

The authoritative `stage-20-result.json` is `complete`; both ledger entries are body-verified and linked.

---

<sub>Generated by [GitHub Copilot CLI](https://github.com/features/copilot/cli)</sub>
