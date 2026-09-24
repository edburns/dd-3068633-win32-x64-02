## Campaign context and required reading

On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.

Read the entire plan before working. Then re-read these exact sections:

- `## Ignorance reduction`
- `### Repository-owned validation`
- `### Output and ordering contracts`
- `## Implementation`
- `### 1. Implement Fibonacci with unit and isolated CLI coverage`
- `### 2. Add factorial and operation dispatch`

The resolved acceptance contract is the committed command `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The repository-owned runner and `.github/workflows/shepherd-task-math-tool.yml` use exactly Pester 5.7.1; do not replace, bypass, or weaken that runner.

The resolved behavior contract is:

- Direct CLI execution writes exactly one result line to stdout: `Fibonacci(N) = value` or `Factorial(N) = value`, according to the selected operation.
- `Get-Fibonacci` and `Get-Factorial` return only numeric results and produce no incidental output.
- Supported inputs are non-negative integers.
- The implementation and tests remain in repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.
- Fibonacci behavior delivered by the merged first task must remain compatible.

Research for the plan established that operation functions and direct CLI dispatch are distinct contracts. Exercise pure functions through dot-sourced tests and exercise each operation's formatted output through isolated child `pwsh` processes. Implement production behavior from the plan's findings; do not copy or adapt research code.

## Branch and execution order

Target `experiment/shepherd-control` as the PR base branch. This is implementation subsection 2 and the second of two serial tasks. Tasks are assigned, completed, and merged in plan order. Do not begin until this issue is assigned and subsection 1 has been merged into the base branch.

## Implement

Extend the merged repository-root `math-tool.ps1` with:

- A pure `Get-Factorial` function that computes factorial for non-negative integer `N` and returns only the numeric result.
- An `Operation` parameter that dispatches between `fibonacci` and `factorial` while retaining the `N` parameter.
- Exact direct-execution output of `Fibonacci(N) = value` for Fibonacci and `Factorial(N) = value` for factorial, with no additional stdout.
- Preservation of the existing Fibonacci function, results, CLI formatting, and invocation behavior. Calls that supplied only `N` before this task must continue to run Fibonacci; explicit Fibonacci dispatch must produce the same result and output.
- Dot-source behavior that exposes both pure functions without emitting a direct-execution result line.

Extend `math-tool.Tests.ps1` using the existing production test structure. Add:

- Dot-sourced unit coverage for `Get-Factorial` at `N=0`, `N=1`, and at least one small representative value greater than 1.
- Isolated child-`pwsh` CLI coverage for explicit factorial dispatch with exact complete stdout assertions.
- Explicit Fibonacci dispatch coverage.
- Regression coverage proving the task-1 Fibonacci unit and direct CLI contracts still pass, including the prior invocation that supplies only `N`.

Keep the interface and test suite objective and small.

## Completion gates

- `Get-Factorial 0` returns numeric `1` without extra output.
- `Get-Factorial 1` returns numeric `1` without extra output.
- A representative factorial input greater than 1 returns the expected numeric value without extra output.
- Dot-sourcing `math-tool.ps1` exposes both functions without printing a CLI result.
- Explicit `fibonacci` and `factorial` child-process invocations exit successfully and each emits exactly one correctly formatted result line.
- The task-1 Fibonacci boundary, representative-value, and isolated CLI tests remain green, including invocation with only `N`.
- The combined suite demonstrates dispatch selects the requested operation rather than accidentally using the other calculation.
- `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero.
- The pinned pull-request workflow passes with Pester 5.7.1.

## Out of scope

- Do not change the canonical runner, pinned Pester version, or CI workflow.
- Do not redesign or rename the merged Fibonacci API or alter its output contract.
- Do not add operations other than Fibonacci and factorial, unrelated dependencies, or behavior for inputs outside the resolved non-negative-integer contract.
- Keep changes limited to `math-tool.ps1` and `math-tool.Tests.ps1`.
