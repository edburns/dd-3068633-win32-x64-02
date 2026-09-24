## Campaign context and required reading

On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.

Read the entire plan before working. Then re-read these exact sections:

- `## Ignorance reduction`
- `### Repository-owned validation`
- `### Output and ordering contracts`
- `## Implementation`
- `### 1. Implement Fibonacci with unit and isolated CLI coverage`

The resolved acceptance contract is the committed command `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The repository-owned runner and `.github/workflows/shepherd-task-math-tool.yml` use exactly Pester 5.7.1; do not replace, bypass, or weaken that runner.

The resolved behavior contract is:

- Direct CLI execution writes exactly one result line to stdout in the form `Fibonacci(N) = value`.
- `Get-Fibonacci` returns only the numeric result and produces no incidental output.
- Supported inputs are non-negative integers.
- The implementation and test files are repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.

Research for the plan established that unit behavior and direct CLI behavior are separate contracts. Test the function by dot-sourcing the production script, and test the CLI through an isolated child `pwsh` process so output from direct execution cannot be confused with function return values. Implement production behavior from the plan's findings; do not copy or adapt research code.

## Branch and execution order

Target `experiment/shepherd-control` as the PR base branch. This is implementation subsection 1 and the first of two serial tasks. Tasks are assigned, completed, and merged in plan order. Do not begin work until this issue is assigned. The factorial/dispatch task starts only after this task is merged.

## Implement

Create repository-root `math-tool.ps1` with:

- A script parameter named `N` accepting non-negative integer input.
- A pure `Get-Fibonacci` function that computes the Fibonacci value for `N` and returns only that numeric value.
- Direct-execution behavior that emits exactly `Fibonacci(N) = value` as the sole stdout line.
- Dot-source behavior suitable for unit testing: importing the function must not emit the direct-execution result line.

Create repository-root `math-tool.Tests.ps1` using Pester 5.7.1 with:

- Dot-sourced unit tests for `Get-Fibonacci`.
- Cases for `N=0`, `N=1`, and at least one small representative value greater than 1.
- Isolated child-`pwsh` process tests of direct CLI execution for the same boundary and representative inputs.
- Assertions on the complete CLI stdout contract, including that there is exactly one result line and no incidental output.

Use the repository's existing PowerShell style and keep the implementation deterministic and small.

## Completion gates

- `Get-Fibonacci 0` returns numeric `0` without extra output.
- `Get-Fibonacci 1` returns numeric `1` without extra output.
- A representative Fibonacci input greater than 1 returns the expected numeric value without extra output.
- Dot-sourcing `math-tool.ps1` exposes `Get-Fibonacci` without printing a CLI result.
- Direct child-process execution for each covered input exits successfully and stdout is exactly one line matching `Fibonacci(N) = value`.
- `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero.
- The pinned pull-request workflow passes with Pester 5.7.1.

## Out of scope

- Do not implement factorial or operation dispatch; those belong to subsection 2.
- Do not change the canonical runner, pinned Pester version, or CI workflow.
- Do not add unrelated files, dependencies, output formats, or behavior for inputs outside the resolved non-negative-integer contract.
- Keep changes limited to `math-tool.ps1` and `math-tool.Tests.ps1`.
