# Pre-commit Hook

This document describes the pre-commit hook that automatically generates diagnostic artifacts before every commit.

## Overview

The pre-commit hook ensures that diagnostic artifacts (`diagnostic/build-*.logd` and `diagnostic/build-*.json`) are always up-to-date and included in every commit. This prevents PRs from being rejected by the diagnostic-build-log GitHub Action.

## Installation

Install the hook by running:

```bash
make install-hooks
```

This copies `tools/pre-commit` to `.git/hooks/pre-commit` and makes it executable.

## Usage

Once installed, the hook runs automatically on every `git commit`:

```bash
git commit -m "Your commit message"
```

The hook will:
1. Run `python3 build.py` with a countdown timer
2. Copy the generated diagnostic files to the staging area
3. Abort the commit if `build.py` fails

## Removing the Hook

To remove the hook:

```bash
make clean-hooks
```

## How It Works

1. **Check existing diagnostics**: The hook checks if diagnostic files already exist
2. **Run build.py**: Executes the build script with real-time elapsed time display
3. **Stage diagnostics**: Automatically stages the generated `.logd` and `.json` files
4. **Error handling**: Aborts the commit if build.py fails with a clear error message

## Troubleshooting

### Build.py takes too long

The hook displays a countdown timer so you know it's still running. Build times vary depending on the project size and dependencies.

### Hook fails with "No diagnostic files generated"

This means `build.py` ran successfully but didn't generate diagnostic files. Check that:
- The `diagnostic/` directory exists
- `build.py` is configured to generate diagnostics
- You have write permissions to the `diagnostic/` directory

### Want to commit without running the hook

Use `git commit --no-verify` to skip the pre-commit hook:

```bash
git commit --no-verify -m "Your commit message"
```

**Note**: This is not recommended as it may cause CI failures.
