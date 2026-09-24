[CmdletBinding()]
param(
    [ValidateRange(0, 2147483647)]
    [int]$N = 0
)

Set-StrictMode -Version Latest

function Get-Fibonacci {
    [OutputType([int])]
    param(
        [Parameter(Mandatory)]
        [ValidateRange(0, 2147483647)]
        [int]$N
    )

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

if ($MyInvocation.InvocationName -ne '.') {
    $value = Get-Fibonacci -N $N
    Write-Output "Fibonacci($N) = $value"
}
