---
name: Bug Report
about: Report a bug or unexpected behavior
title: '[BUG] '
labels: bug
assignees: ''
---

## Bug Description

A clear and concise description of what the bug is.

## Steps to Reproduce

1. Open Vim with '...'
2. Edit Solidity file containing '...'
3. Perform action '...'
4. See error/unexpected behavior

## Expected Behavior

A clear description of what you expected to happen.

## Actual Behavior

What actually happened instead.

## Minimal Solidity Code Example

```solidity
// Minimal code that reproduces the issue
contract Example {
    // ...
}
```

## Environment

- **Vim version**: (output of `vim --version`)
- **OS**: (e.g., Ubuntu 22.04, macOS 14.0, Windows 11)
- **Terminal**: (e.g., iTerm2, Windows Terminal, GNOME Terminal)
- **vim-solidity version/commit**: (e.g., v0.8.0 or commit hash)
- **Solidity version**: (if relevant, e.g., 0.8.24)

## Additional Context

Add any other context about the problem here, such as:
- Does it happen with a minimal vimrc?
- Related Vim plugins that might interact?
- Screenshots if applicable

## Checklist

- [ ] I have searched existing issues for duplicates
- [ ] I have tested with a minimal vimrc (`vim -Nu test/vimrc`)
- [ ] I have provided a minimal code example
- [ ] I have included my environment details
