#!/bin/bash
# Run vader tests and report results

cd "$(dirname "$0")/.."

# Run all tests
echo "Running vim-solidity test suite..."
echo ""

# Track overall status
FAILED=0

# Run syntax tests
echo "=== Syntax Tests ==="
if vim -Nu test/vimrc -c 'Vader! test/vader/syntax.vader' 2>&1; then
    echo "✓ Syntax tests passed"
else
    echo "✗ Syntax tests failed"
    FAILED=1
fi
echo ""

# Run indent tests
echo "=== Indentation Tests ==="
if vim -Nu test/vimrc -c 'Vader! test/vader/indent.vader' 2>&1; then
    echo "✓ Indentation tests passed"
else
    echo "✗ Indentation tests failed"
    FAILED=1
fi
echo ""

# Run folding tests
echo "=== Folding Tests ==="
if vim -Nu test/vimrc -c 'Vader! test/vader/folding.vader' 2>&1; then
    echo "✓ Folding tests passed"
else
    echo "✗ Folding tests failed"
    FAILED=1
fi
echo ""

# Final summary
if [ $FAILED -eq 0 ]; then
    echo "✓ All tests passed"
    exit 0
else
    echo "✗ Some tests failed"
    exit 1
fi
