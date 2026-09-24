[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [ValidateRange(0, 2147483647)]
    [int]$N = 0,

    [Parameter(Position = 1)]
    [ValidateSet('fibonacci', 'factorial')]
    [string]$Operation = 'fibonacci'
)

function Get-Fibonacci {
    [OutputType([int])]
    param(
        [Parameter(Mandatory)]
        [ValidateRange(0, 46)]
        [int]$N
    )

    Set-StrictMode -Version Latest

    if ($N -lt 2) {
        return $N
    }

    $previous = 0
    $current = 1
    for ($index = 2; $index -le $N; $index++) {
        $next = $previous + $current
        $previous = $current
        $current = $next
    }

    return $current
}

function Get-Factorial {
    [OutputType([System.Numerics.BigInteger])]
    param(
        [Parameter(Mandatory)]
        [ValidateRange(0, 2147483647)]
        [int]$N
    )

    Set-StrictMode -Version Latest

    $value = [System.Numerics.BigInteger]::One
    for ($factor = 2; $factor -le $N; $factor++) {
        $value *= $factor
    }

    return $value
}

if ($MyInvocation.InvocationName -ne '.') {
    switch ($Operation) {
        'fibonacci' {
            $value = Get-Fibonacci -N $N
            Write-Output "Fibonacci($N) = $value"
        }
        'factorial' {
            $value = Get-Factorial -N $N
            Write-Output "Factorial($N) = $value"
        }
    }
}
