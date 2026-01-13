# vim-solidity Tests

This directory contains automated tests for vim-solidity using [vader.vim](https://github.com/junegunn/vader.vim).

## Structure

```
test/
├── vader/              # Vader test files
│   ├── syntax.vader    # Syntax highlighting tests
│   ├── indent.vader    # Indentation tests
│   └── folding.vader   # Code folding tests
├── fixtures/           # Test Solidity files
│   ├── modern.sol          # Modern Solidity 0.8.x features
│   ├── issue_15.sol        # String literal bug (Issue #15)
│   ├── issue_5.sol         # Indentation problems (Issue #5)
│   └── foundry_test.t.sol  # Foundry test file example
├── vimrc               # Minimal vimrc for testing
└── README.md           # This file
```

## Running Tests Locally

### Prerequisites

1. Clone vader.vim:
```bash
git clone https://github.com/junegunn/vader.vim.git test/vader.vim
```

2. Ensure you have Vim installed (version 8.0+)

### Run All Tests

```bash
# From the project root directory
vim -Nu test/vimrc -c 'Vader! test/vader/*.vader'
```

### Run Specific Test Files

```bash
# Syntax tests only
vim -Nu test/vimrc -c 'Vader! test/vader/syntax.vader'

# Indentation tests only
vim -Nu test/vimrc -c 'Vader! test/vader/indent.vader'

# Folding tests only
vim -Nu test/vimrc -c 'Vader! test/vader/folding.vader'
```

### Interactive Testing

For debugging tests interactively:

```bash
# Run without the ! to keep Vim open
vim -Nu test/vimrc -c 'Vader test/vader/syntax.vader'
```

## Writing New Tests

### Test Structure

Vader tests use a simple DSL:

```vader
Given solidity (test description):
  # Input Solidity code

Execute (what the test does):
  " Vim commands and assertions

Expect solidity (expected result):
  # Expected output
```

### Common Assertions

```vim
" Check equality
AssertEqual expected, actual

" Check inequality
AssertNotEqual unexpected, actual

" Check syntax group at cursor
let l:group = synIDattr(synID(line('.'), col('.'), 1), 'name')
AssertEqual 'solKeyword', l:group
```

### Testing Syntax Highlighting

```vader
Given solidity (keyword test):
  transient uint256 value;

Execute (check transient is highlighted):
  normal! /transient
  let l:group = synIDattr(synID(line('.'), col('.'), 1), 'name')
  AssertEqual 'solKeyword', l:group
```

### Testing Indentation

```vader
Given solidity (unindented code):
  contract Test {
  function foo() {
  uint x = 1;
  }
  }

Execute (indent buffer):
  normal! gg=G

Expect solidity (indented code):
  contract Test {
      function foo() {
          uint x = 1;
      }
  }
```

### Testing Folding

```vader
Given solidity (contract):
  contract Test {
      function foo() {}
  }

Execute (check fold exists):
  set foldmethod=syntax
  normal! gg
  let l:foldlevel = foldlevel(1)
  AssertNotEqual 0, l:foldlevel
```

## CI/CD

Tests run automatically on GitHub Actions for:
- Push to `main` or `revamp` branches
- Pull requests targeting `main` or `revamp`

See `.github/workflows/test.yml` for the CI configuration.

## Test Fixtures

The `fixtures/` directory contains example Solidity files for manual testing:

- **modern.sol**: Tests all Solidity 0.8.x features (transient, unchecked, error, etc.)
- **issue_15.sol**: Reproduces the string literal syntax bug
- **issue_5.sol**: Contains problematic indentation patterns
- **foundry_test.t.sol**: Example Foundry test file

You can open these in Vim to manually verify syntax highlighting, indentation, and folding:

```bash
vim test/fixtures/modern.sol
```

## Troubleshooting

### Tests fail locally but pass in CI

- Ensure you're using Vim 8.0+
- Make sure vader.vim is cloned to `test/vader.vim`
- Check that you're running from the project root

### Syntax group not found

Use `:syn list` in Vim to see all defined syntax groups and verify the expected group name.

### Indentation tests fail

The indentation tests are sensitive to the `shiftwidth` and `expandtab` settings. The test vimrc should set these correctly, but you can verify with:

```vim
:set shiftwidth?
:set expandtab?
```
