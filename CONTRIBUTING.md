# Contributing to vim-solidity

Thank you for your interest in contributing to vim-solidity! This document provides guidelines and instructions for contributing.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Testing](#testing)
- [Submitting Changes](#submitting-changes)
- [Style Guidelines](#style-guidelines)

## Code of Conduct

This project follows the Contributor Covenant Code of Conduct. By participating, you are expected to uphold this code. Please report unacceptable behavior to the maintainers.

## How Can I Contribute?

### Reporting Bugs

Before creating a bug report, please check existing issues to avoid duplicates. When creating a bug report, include:

- **Description**: Clear description of the problem
- **Steps to reproduce**: Minimal steps to reproduce the issue
- **Expected behavior**: What you expected to happen
- **Actual behavior**: What actually happened
- **Environment**: Vim version, OS, terminal emulator
- **Sample code**: Minimal Solidity code that demonstrates the issue

### Suggesting Enhancements

Enhancement suggestions are welcome! Please provide:

- **Use case**: Why is this enhancement useful?
- **Proposed solution**: How would you like it to work?
- **Alternatives**: Other approaches you've considered
- **Examples**: Code examples if applicable

### Pull Requests

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Add tests if applicable
5. Run the test suite
6. Commit your changes (see commit guidelines below)
7. Push to your branch
8. Open a Pull Request

## Development Setup

### Prerequisites

- Vim 8.0+ or Neovim
- Git
- [vader.vim](https://github.com/junegunn/vader.vim) for testing

### Clone and Setup

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/vim-solidity.git
cd vim-solidity

# Clone vader.vim for testing
git clone https://github.com/junegunn/vader.vim.git test/vader.vim
```

### File Structure

```
vim-solidity/
├── ftdetect/      # File type detection
├── ftplugin/      # File type plugin settings
├── indent/        # Indentation logic
├── syntax/        # Syntax highlighting
├── test/          # Test suite
│   ├── vader/     # Vader test files
│   ├── fixtures/  # Test Solidity files
│   └── vimrc      # Test configuration
└── README.md
```

## Testing

### Running Tests Locally

```bash
# Run all tests
vim -Nu test/vimrc -c 'Vader! test/vader/*.vader'

# Run specific test file
vim -Nu test/vimrc -c 'Vader! test/vader/syntax.vader'

# Run interactively (for debugging)
vim -Nu test/vimrc -c 'Vader test/vader/syntax.vader'
```

### Writing Tests

We use [vader.vim](https://github.com/junegunn/vader.vim) for testing. Tests are located in `test/vader/`.

**Example syntax test:**
```vader
Given solidity (test description):
  contract Test {
      uint256 value;
  }

Execute (check syntax highlighting):
  normal! /uint256
  let l:group = synIDattr(synID(line('.'), col('.'), 1), 'name')
  AssertEqual 'solBuiltinType', l:group
```

**Example indentation test:**
```vader
Given solidity (unindented code):
  contract Test {
  function foo() {
  return 1;
  }
  }

Execute (indent buffer):
  normal! gg=G

Expect solidity (properly indented):
  contract Test {
      function foo() {
          return 1;
      }
  }
```

### Manual Testing

Use the test fixtures to manually verify changes:

```bash
# Open a test file
vim test/fixtures/modern.sol

# Check syntax highlighting
:syn list

# Test indentation
gg=G

# Test folding
:set foldmethod=syntax
zM
zR
```

## Submitting Changes

### Commit Messages

Follow these guidelines for commit messages:

```
Add brief summary (50 characters or less)

More detailed explanation if needed. Wrap at 72 characters.

- Use bullet points for multiple changes
- Reference issues: "Fixes #123" or "Closes #456"
- Explain the why, not just the what

Co-Authored-By: Name <email@example.com>
```

**Examples:**
```
Add transient keyword support (0.8.24+)

- Add transient to solKeyword list
- Update syntax tests
- Add test fixture with transient storage

Fixes #45
```

### Pull Request Guidelines

- **One feature per PR**: Keep PRs focused on a single feature or fix
- **Update tests**: Add or update tests for your changes
- **Update documentation**: Update README.md if adding user-facing features
- **Update CHANGELOG**: Add an entry to CHANGELOG.md under "Unreleased"
- **Pass CI**: Ensure GitHub Actions tests pass
- **Clean history**: Rebase and squash commits if needed

### PR Template

Your PR description should include:

```markdown
## Description
Brief description of the changes

## Motivation
Why is this change needed?

## Changes
- List of specific changes
- What was added/modified/removed

## Testing
- How was this tested?
- Which test cases were added/updated?

## Checklist
- [ ] Tests pass locally
- [ ] Added/updated tests for changes
- [ ] Updated CHANGELOG.md
- [ ] Updated README.md if needed
- [ ] Follows style guidelines
```

## Style Guidelines

### VimL Style

- **Indentation**: 4 spaces (no tabs)
- **Line length**: 80 characters where reasonable
- **Comments**: Use `"` for comments, be descriptive
- **Variables**: Use descriptive names (`l:` for local, `b:` for buffer)
- **Functions**: PascalCase for user functions, snake_case for private

**Example:**
```vim
" Check if current line is a function definition
function! s:is_function_line(lnum)
    let l:line = getline(a:lnum)
    return l:line =~# '^\s*function\>'
endfunction
```

### Syntax Highlighting Rules

- **Keyword groups**: Use `solKeyword`, `solConstant`, `solBuiltinType`
- **Regions**: Use `fold` option for foldable blocks
- **Contains**: Be specific about what regions can contain
- **Highlighting**: Link to standard highlight groups when possible

### Test Style

- **Descriptive names**: Test names should clearly state what they test
- **One concept per test**: Each test should verify one thing
- **Fixtures**: Add complex test cases to `test/fixtures/`
- **Comments**: Explain non-obvious test logic

## Solidity Version Support

vim-solidity aims to support:

- **Current**: Latest stable Solidity version (currently 0.8.x)
- **Recent**: Previous minor versions still in common use
- **Future**: New features added as they're released

When adding support for new Solidity features:

1. Reference the Solidity version in comments
2. Add test cases using the new feature
3. Update CHANGELOG with version info
4. Consider backward compatibility

## Getting Help

- **Questions**: Open a GitHub Discussion
- **Bugs**: Open an issue with the bug template
- **Features**: Open an issue with the feature template
- **Chat**: Mention @thesis/vim-solidity maintainers

## Recognition

Contributors are recognized in several ways:

- Mentioned in commit messages (Co-Authored-By)
- Listed in All Contributors (see README)
- Highlighted in release notes for major contributions

Thank you for contributing to vim-solidity!
