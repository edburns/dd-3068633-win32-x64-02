[CmdletBinding()]
param()

BeforeAll {
    $script:mathToolPath = Join-Path $PSScriptRoot 'math-tool.ps1'
    $script:pwshPath = (Get-Process -Id $PID).Path

    . $mathToolPath
}

Describe 'math-tool dot sourcing' {
    It 'exposes calculation functions without CLI output' {
        $output = . $mathToolPath

        @($output).Count | Should -Be 0
        Get-Command -Name Get-Fibonacci -CommandType Function | Should -Not -BeNullOrEmpty
        Get-Command -Name Get-Factorial -CommandType Function | Should -Not -BeNullOrEmpty
    }
}

Describe 'Get-Fibonacci' {
    It 'returns <Expected> for N=<N> without incidental output' -TestCases @(
        @{ N = 0; Expected = 0 }
        @{ N = 1; Expected = 1 }
        @{ N = 7; Expected = 13 }
        @{ N = 46; Expected = 1836311903 }
    ) {
        param($N, $Expected)

        $result = Get-Fibonacci -N $N

        @($result) | Should -HaveCount 1
        ($result -is [int]) | Should -BeTrue
        $result | Should -Be $Expected
    }

    It 'rejects values that exceed the Int32 Fibonacci range' {
        { Get-Fibonacci -N 47 } | Should -Throw
    }
}

Describe 'Get-Factorial' {
    It 'returns <Expected> for N=<N> without incidental output' -TestCases @(
        @{ N = 0; Expected = 1 }
        @{ N = 1; Expected = 1 }
        @{ N = 5; Expected = 120 }
    ) {
        param($N, $Expected)

        $result = Get-Factorial -N $N

        @($result) | Should -HaveCount 1
        ($result -is [System.Numerics.BigInteger]) | Should -BeTrue
        $result | Should -Be $Expected
    }

    It 'supports the documented upper bound' {
        $result = Get-Factorial -N 1000

        @($result) | Should -HaveCount 1
        ($result -is [System.Numerics.BigInteger]) | Should -BeTrue
        $result | Should -BeGreaterThan 0
    }

    It 'rejects values above the documented upper bound' {
        { Get-Factorial -N 1001 } | Should -Throw
    }
}

Describe 'math-tool CLI' {
    It 'writes exactly one Fibonacci result line for N=<N>' -TestCases @(
        @{ N = 0; Expected = 0 }
        @{ N = 1; Expected = 1 }
        @{ N = 7; Expected = 13 }
        @{ N = 46; Expected = 1836311903 }
    ) {
        param($N, $Expected)

        $stdoutPath = Join-Path $TestDrive "stdout-$N.txt"
        $stderrPath = Join-Path $TestDrive "stderr-$N.txt"
        & $pwshPath -NoLogo -NoProfile -File $mathToolPath -N $N 1> $stdoutPath 2> $stderrPath
        $exitCode = $LASTEXITCODE
        $stdout = @(Get-Content -LiteralPath $stdoutPath)
        $stderr = @(Get-Content -LiteralPath $stderrPath)

        $exitCode | Should -Be 0
        $stdout | Should -HaveCount 1
        $stdout[0] | Should -Be "Fibonacci($N) = $Expected"
        $stderr | Should -HaveCount 0
    }

    It 'writes exactly one Fibonacci result line when explicitly selected' {
        $stdoutPath = Join-Path $TestDrive 'stdout-fibonacci.txt'
        $stderrPath = Join-Path $TestDrive 'stderr-fibonacci.txt'
        & $pwshPath -NoLogo -NoProfile -File $mathToolPath -Operation fibonacci -N 7 1> $stdoutPath 2> $stderrPath
        $exitCode = $LASTEXITCODE

        $exitCode | Should -Be 0
        [System.IO.File]::ReadAllText($stdoutPath) | Should -Be "Fibonacci(7) = 13$([Environment]::NewLine)"
        [System.IO.File]::ReadAllText($stderrPath) | Should -Be ''
    }

    It 'preserves the positional N-only Fibonacci invocation' {
        $stdoutPath = Join-Path $TestDrive 'stdout-positional-fibonacci.txt'
        $stderrPath = Join-Path $TestDrive 'stderr-positional-fibonacci.txt'
        & $pwshPath -NoLogo -NoProfile -File $mathToolPath 7 1> $stdoutPath 2> $stderrPath
        $exitCode = $LASTEXITCODE

        $exitCode | Should -Be 0
        [System.IO.File]::ReadAllText($stdoutPath) | Should -Be "Fibonacci(7) = 13$([Environment]::NewLine)"
        [System.IO.File]::ReadAllText($stderrPath) | Should -Be ''
    }

    It 'writes exactly one Factorial result line when explicitly selected' {
        $stdoutPath = Join-Path $TestDrive 'stdout-factorial.txt'
        $stderrPath = Join-Path $TestDrive 'stderr-factorial.txt'
        & $pwshPath -NoLogo -NoProfile -File $mathToolPath -Operation factorial -N 5 1> $stdoutPath 2> $stderrPath
        $exitCode = $LASTEXITCODE

        $exitCode | Should -Be 0
        [System.IO.File]::ReadAllText($stdoutPath) | Should -Be "Factorial(5) = 120$([Environment]::NewLine)"
        [System.IO.File]::ReadAllText($stderrPath) | Should -Be ''
    }
}
