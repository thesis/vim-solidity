// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Test case for Issue #15: String literal syntax bug
// After the closing quote in strings with function signatures,
// syntax highlighting should continue to work correctly

contract StringSyntaxTest {
    function testFunctionSignatureString() public pure {
        // This is the problematic pattern from Issue #15
        bytes32 hash1 = keccak256(bytes("submitSomething(bytes)"));

        // More variations to test
        bytes32 hash2 = keccak256(abi.encodePacked("transfer(address,uint256)"));

        // Nested quotes and parens
        string memory sig = "approve(address,uint256)";
        bytes32 hash3 = keccak256(bytes(sig));

        // Function signature comparison
        if (keccak256(bytes("foo(uint256)")) == keccak256(bytes("foo(uint256)"))) {
            // This should still highlight correctly
            uint256 value = 42;
        }

        // Multiple strings on same line
        string memory a = "func(uint256)";
        string memory b = "other(bytes)";

        // String with escaped quotes
        string memory c = "test\"nested\"quotes";
    }
}
