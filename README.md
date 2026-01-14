# vim-solidity

[![Version](https://img.shields.io/github/v/tag/thesis/vim-solidity)](https://github.com/thesis/vim-solidity/tags)
[![License](https://img.shields.io/github/license/thesis/vim-solidity)](LICENSE)
[![Test](https://github.com/thesis/vim-solidity/actions/workflows/test.yml/badge.svg)](https://github.com/thesis/vim-solidity/actions/workflows/test.yml)

**The actively maintained Solidity plugin for Vim.**

Comprehensive syntax highlighting, indentation, and code folding for [Solidity](https://soliditylang.org/), the smart contract programming language for Ethereum. Supports Solidity 0.8.x with all modern language features.

## Features

- ✅ **Modern Solidity 0.8.x support**: All keywords through Solidity 0.8.24
  - `transient` storage (0.8.24+)
  - `unchecked` blocks (0.8.0+)
  - Custom `error` declarations (0.8.4+)
  - User-defined value types (`type Foo is uint256`, 0.8.18+)
  - `using ... global` syntax (0.8.19+)
  - `fallback()` and `receive()` functions
- ✅ **Smart indentation**: Context-aware indentation for functions, contracts, and blocks
- ✅ **Code folding**: Fold contracts, functions, and assembly blocks
- ✅ **NatSpec support**: Syntax highlighting for `@param`, `@return`, `@notice`, etc.
- ✅ **Yul/Assembly**: Full Yul opcode highlighting with proper scoping
- ✅ **Foundry integration**: Automatic detection of `.t.sol` and `.s.sol` files
- ✅ **Pure Vim**: No external dependencies, works in Vim 8.0+ and Neovim

## Installation

### vim-plug

Add to your `~/.vimrc` or `~/.config/nvim/init.vim`:

```vim
Plug 'thesis/vim-solidity', { 'branch': 'main' }
```

Then run `:PlugInstall`

### Vundle

Add to your `~/.vimrc`:

```vim
Plugin 'thesis/vim-solidity'
```

Then run `:PluginInstall`

### Pathogen

```bash
git clone https://github.com/thesis/vim-solidity.git ~/.vim/bundle/vim-solidity
```

### Native Vim Packages (Vim 8+)

```bash
mkdir -p ~/.vim/pack/plugins/start
git clone https://github.com/thesis/vim-solidity.git ~/.vim/pack/plugins/start/vim-solidity
```

### Neovim with lazy.nvim

```lua
{
  'thesis/vim-solidity',
  branch = 'main',
  ft = 'solidity',
}
```

## Configuration

### Enable Code Folding

Add to your `~/.vimrc`:

```vim
augroup solidity_folding
    au!
    au FileType solidity setlocal foldmethod=syntax
augroup END
```

**Usage:**
- `zc` - Close fold under cursor
- `zo` - Open fold under cursor
- `zM` - Close all folds
- `zR` - Open all folds

### Comment Toggling

vim-solidity works with [vim-commentary](https://github.com/tpope/vim-commentary):

```vim
Plug 'tpope/vim-commentary'
```

**Usage:**
- `gcc` - Toggle comment on current line
- `gc` in visual mode - Toggle comment on selection

### Matchit Support

Enable `%` jumping between Solidity constructs:

```vim
" In your .vimrc
runtime macros/matchit.vim
```

**Supported matches:**
- `contract` ↔ `}`
- `function` ↔ `}`
- `if` ↔ `else`
- `try` ↔ `catch`
- `assembly` ↔ `}`

## Advanced Features

### Foundry Workflow

vim-solidity detects Foundry projects automatically:

- `.t.sol` files → Test files
- `.s.sol` files → Script files
- Regular `.sol` files → Contract files

A buffer-local variable `b:solidity_file_type` is set to `'test'`, `'script'`, or `'contract'`.

### Syntax Highlighting

All modern Solidity features are highlighted:

```solidity
// Custom errors (0.8.4+)
error InsufficientBalance(uint256 available, uint256 required);

// User-defined value types (0.8.18+)
type UFixed256x18 is uint256;

// Using global (0.8.19+)
using SafeMath for uint256 global;

// Transient storage (0.8.24+)
contract Example {
    transient uint256 temporaryValue;

    // Unchecked arithmetic (0.8.0+)
    function increment(uint256 x) public pure returns (uint256) {
        unchecked {
            return x + 1;
        }
    }
}
```

### NatSpec Comments

Full support for Solidity's documentation format:

```solidity
/// @title A title
/// @author The author name
/// @notice Explain to end users what this does
/// @dev Explain to developers the extra details
/// @param x Description of parameter x
/// @return Description of return value
function example(uint256 x) public returns (uint256) {
    return x * 2;
}
```

### Yul/Assembly

Assembly blocks have proper syntax highlighting with scoped opcodes:

```solidity
function getCodeSize(address addr) public view returns (uint256 size) {
    assembly {
        size := extcodesize(addr)
    }
}
```

## Compatibility

- **Vim**: 8.0 or later
- **Neovim**: Fully compatible
- **Solidity**: 0.8.0 through 0.8.24+ (backward compatible with 0.7.x)

## Known Limitations

This is a **pure Vim plugin** focused on syntax, indentation, and folding. It does not provide:

- **Language Server Protocol (LSP)** features (go-to-definition, hover, rename)
- **Linting** (use [ALE](https://github.com/dense-analysis/ale) or [Syntastic](https://github.com/vim-syntastic/syntastic))
- **Code completion** (use LSP or [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe))
- **Compiler integration** (planned for future release)

For full IDE features, you can set up an LSP client ([coc.nvim](https://github.com/neoclide/coc.nvim), [vim-lsp](https://github.com/prabirshrestha/vim-lsp), or native Neovim LSP) with a Solidity language server like [nomicfoundation/solidity-language-server](https://github.com/NomicFoundation/hardhat-vscode/tree/development/server).

## Comparison with Other Plugins

| Feature | vim-solidity (this) | tomlion/vim-solidity |
|---------|---------------------|----------------------|
| Actively maintained | ✅ Yes | ❌ Abandoned (5+ years) |
| Vim support | ✅ Yes | ✅ Yes |
| Neovim support | ✅ Yes | ✅ Yes |
| Solidity 0.8.x | ✅ Yes | ❌ Partial |
| Pure Vim | ✅ Yes | ✅ Yes |

**Use vim-solidity if:**
- You want actively maintained Solidity syntax support
- You need modern Solidity 0.8.x features
- You prefer a simple, dependency-free plugin
- You work on remote servers via SSH
- You want syntax highlighting and code folding that "just works"

**For LSP features:**

If you need go-to-definition, hover, rename, and other IDE features:
- Set up an LSP client ([coc.nvim](https://github.com/neoclide/coc.nvim), [vim-lsp](https://github.com/prabirshrestha/vim-lsp), or native Neovim LSP)
- Use a Solidity language server like [nomicfoundation/solidity-language-server](https://github.com/NomicFoundation/hardhat-vscode/tree/development/server)
- vim-solidity works alongside LSP for syntax highlighting

## Troubleshooting

### Colors look wrong

Your colorscheme may not define Solidity-specific groups. Try a different colorscheme or customize:

```vim
" In your .vimrc
hi link solKeyword Statement
hi link solBuiltinType Type
hi link solConstant Constant
```

### Indentation is incorrect

The indentation logic is based on JavaScript. For complex cases, you may need to manually adjust with `>>` and `<<`.

Please report persistent indentation issues with a minimal example.

### Folding doesn't work

Make sure you've set `foldmethod`:

```vim
:set foldmethod=syntax
```

If folding is slow, try:

```vim
:set foldmethod=indent
```

## Contributing

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Development Setup

```bash
# Clone vader.vim for testing
git clone https://github.com/junegunn/vader.vim.git test/vader.vim

# Run tests
vim -Nu test/vimrc -c 'Vader! test/vader/*.vader'
```

### Reporting Issues

Before opening an issue:
1. Check existing issues for duplicates
2. Test with a minimal `.vimrc`
3. Provide a minimal Solidity example
4. Include your Vim version and OS

Use our [issue templates](https://github.com/thesis/vim-solidity/issues/new/choose).

## Related Projects

- [Foundry](https://github.com/foundry-rs/foundry) - Ethereum development toolkit
- [solc](https://github.com/ethereum/solidity) - The Solidity compiler
- [Hardhat VSCode](https://github.com/NomicFoundation/hardhat-vscode) - Official Solidity LSP implementation
- [coc.nvim](https://github.com/neoclide/coc.nvim) - LSP client for Vim/Neovim
- [vim-lsp](https://github.com/prabirshrestha/vim-lsp) - Async LSP client for Vim

## History

This plugin is a maintained fork of [tomlion/vim-solidity](https://github.com/tomlion/vim-solidity), which has been inactive since 2018. It incorporates improvements from the Ethereum Foundation's fork and adds modern Solidity 0.8.x support.

## License

MIT License - see [LICENSE](LICENSE) for details.

## Maintainers

- [Thesis](https://github.com/thesis)

---

**⭐ If you find vim-solidity useful, please star the repository!**

Built with ❤️ for the Solidity and Vim communities.
