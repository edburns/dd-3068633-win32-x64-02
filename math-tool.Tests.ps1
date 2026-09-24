[CmdletBinding()]
param()

$mathToolPath = Join-Path $PSScriptRoot 'math-tool.ps1'
$pwshPath = (Get-Process -Id $PID).Path

. $mathToolPath

Describe 'math-tool dot sourcing' {
    It 'exposes Get-Fibonacci without CLI output' {
        $output = . $mathToolPath

        @($output).Count | Should -Be 0
        Get-Command -Name Get-Fibonacci -CommandType Function | Should -Not -BeNullOrEmpty
    }
}

Describe 'Get-Fibonacci' {
    It 'returns <Expected> for N=<N> without incidental output' -TestCases @(
        @{ N = 0; Expected = 0 }
        @{ N = 1; Expected = 1 }
        @{ N = 7; Expected = 13 }
    ) {
        param($N, $Expected)

        $result = Get-Fibonacci -N $N

        @($result) | Should -HaveCount 1
        ($result -is [int]) | Should -BeTrue
        $result | Should -Be $Expected
    }
}

Describe 'math-tool CLI' {
    It 'writes exactly one Fibonacci result line for N=<N>' -TestCases @(
        @{ N = 0; Expected = 0 }
        @{ N = 1; Expected = 1 }
        @{ N = 7; Expected = 13 }
    ) {
        param($N, $Expected)

        $output = @(& $pwshPath -NoLogo -NoProfile -File $mathToolPath -N $N 2>&1)

        $LASTEXITCODE | Should -Be 0
        $output | Should -HaveCount 1
        $output[0] | Should -Be "Fibonacci($N) = $Expected"
    }
}
