// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Test case for Issue #5: Indentation problems
// Multi-line function calls and event definitions

contract IndentationTest {
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 value
    );

    event ComplexEvent(
        address indexed user,
        uint256 amount,
        bytes data,
        bool success
    );

    function multiLineCall() public {
        // Multi-line function call with arguments
        someFunction(
            arg1,
            arg2,
            arg3
        );

        // Chained method calls
        address(this)
            .call(data)
            .data;

        // For loop with method call
        for (uint256 i = 0; i < 10; i++) {
            someArray.push(
                i * 2
            );
        }
    }

    function multiLineSignature(
        uint256 arg1,
        address arg2,
        bytes memory arg3
    ) public pure returns (
        uint256 result1,
        bool result2
    ) {
        return (arg1, true);
    }

    // Function with modifiers
    function withModifiers(
        uint256 x
    )
        public
        payable
        onlyOwner
        whenNotPaused
        returns (uint256)
    {
        return x * 2;
    }

    modifier onlyOwner() { _; }
    modifier whenNotPaused() { _; }
}
