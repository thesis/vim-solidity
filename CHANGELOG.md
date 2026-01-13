# Changelog

All notable changes to vim-solidity will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

Nothing yet - next release will be 0.9.0 with Foundry tooling integration.

## [0.8.0] - 2026-01-13

**Major release with modern Solidity 0.8.x support and testing infrastructure**

### Added
- Comprehensive testing infrastructure with vader.vim
- GitHub Actions CI for automated testing
- Solidity 0.8.24 `transient` keyword support
- Solidity 0.8.19 `using ... global` syntax support
- Solidity 0.8.18 user-defined value types (`type Foo is uint256`)
- Solidity 0.8.4 `error` keyword for custom errors
- `unchecked` block syntax (0.8.0+)
- `fallback()` and `receive()` special function keywords
- `global` keyword for library attachments
- Contract-level code folding for contracts, libraries, and interfaces
- Foundry test file detection (`.t.sol` extension)
- Foundry script file detection (`.s.sol` extension)
- Buffer-local variable `b:solidity_file_type` to distinguish file types
- Test fixtures for modern Solidity features, indentation, and folding
- Comprehensive test suites for syntax, indentation, and folding

### Fixed
- Contract bodies can now be folded (Issue #11)
- String literal syntax highlighting after function signatures (Issue #15)

### Known Issues
- Indentation for some multi-line constructs may need manual adjustment (Issue #5)
  - The indent logic is based on JavaScript and works well for most cases
  - Complex multi-line function signatures with modifiers may need refinement
  - Contributions welcome to improve edge cases

### Changed
- Enhanced ftdetect to recognize Foundry file naming conventions
- Improved syntax highlighting for modern Solidity 0.8.x features
- Updated maintainer information

## [0.7.0] - 2021-01-17

### Changed
- Leave foldmethod to be configured by the user
- Fix syntax file maintainer

### Added
- Add 'require' to keywords
- Add 'revert' to keywords
- Add Yul opcode dialect
- Ensure Yul ops only highlight in assembly blocks
- Add 'switch' to statements

### Improved
- Better handling of comments and doc comments
- Enhanced NatSpec comment support

---

## Migration Notes

### From 0.7.0 to Unreleased

If you were using the old vim-solidity, the main changes are:

1. **Modern Solidity Support**: All Solidity 0.8.x features are now supported
2. **Contract Folding**: Enable with `set foldmethod=syntax` to fold entire contracts
3. **Foundry Support**: `.t.sol` and `.s.sol` files are automatically recognized
4. **Testing**: The plugin now has comprehensive automated tests

### Future Breaking Changes

No breaking changes are planned. The plugin maintains backward compatibility
with Vim 8.0+ and works in Neovim (though Neovim users may prefer solidity.nvim
for LSP features).

---

## Version History

- **Unreleased**: Modern Solidity 0.8.x support, testing infrastructure, Foundry integration
- **0.7.0**: Yul support, comment improvements, basic keyword additions
- **Earlier versions**: See git history

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on contributing to vim-solidity.

## License

MIT License - see [LICENSE](LICENSE) for details.
