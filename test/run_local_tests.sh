#!/bin/bash
# Local test harness for vim-solidity syntax highlighting
# Usage: ./test/run_local_tests.sh

set -e

cd "$(dirname "$0")/.."

echo "Running vim-solidity syntax tests locally..."
echo ""

# Run the test script
if vim -Es -Nu test/vimrc -S test/simple_test.vim 2>&1; then
    echo ""
    echo "All tests passed!"
    exit 0
else
    EXIT_CODE=$?
    echo ""
    echo "Tests failed with exit code $EXIT_CODE"
    exit $EXIT_CODE
fi
