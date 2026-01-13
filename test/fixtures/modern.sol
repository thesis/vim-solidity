// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Test file for modern Solidity 0.8.x features

// Custom error (0.8.4+)
error InsufficientBalance(uint256 available, uint256 required);
error Unauthorized();

// User-defined value type (0.8.18+)
type UFixed256x18 is uint256;
type Price is uint128;

// Using global (0.8.19+)
library Math {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }
}

using Math for uint256 global;

contract ModernFeatures {
    // Transient storage (0.8.24+)
    transient uint256 temporaryValue;

    uint256 balance;

    // Unchecked block (0.8.0+)
    function increment(uint256 x) public pure returns (uint256) {
        unchecked {
            return x + 1;
        }
    }

    // Revert with custom error
    function withdraw(uint256 amount) public {
        if (amount > balance) {
            revert InsufficientBalance({
                available: balance,
                required: amount
            });
        }
        balance -= amount;
    }

    // bytes.concat and string.concat
    function concatenateBytes(bytes memory a, bytes memory b) public pure returns (bytes memory) {
        return bytes.concat(a, b);
    }

    function concatenateStrings(string memory a, string memory b) public pure returns (string memory) {
        return string.concat(a, b);
    }

    // Fallback and receive (special functions)
    receive() external payable {}

    fallback() external payable {}
}
