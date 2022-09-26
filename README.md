# vim-solidity

Maintained syntax files for [Solidity](https://github.com/ethereum/solidity),
the smart contract programming language for Ethereum.

## Installation

### Pathogen
Run the following command:

```bash
git clone https://github.com/thesis/vim-solidity.git ~/.vim/bundle/vim-solidity
```

### Vundle
Add the following line to your `~/.vimrc`:

```vim
Plugin 'thesis/vim-solidity'
```

### Plug
Add the following line to your `~/.vimrc`:

```vim
Plug 'thesis/vim-solidity', {'branch': 'main' }
```

### No Plugin Manager

Copy all of the files manually into your `~/.vim`.

## Configuration

```vim
augroup solidity_folding
    au!
    au FileType solidity setlocal foldmethod=syntax
augroup END
```

Will enable Solidity code-folding based on the included syntax file. This might
have an impact on editing performance.
