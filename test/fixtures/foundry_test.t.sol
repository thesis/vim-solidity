// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Foundry test file (.t.sol extension)

import "forge-std/Test.sol";

contract MyContractTest is Test {
    function setUp() public {
        // Setup code
    }

    function test_BasicAssertion() public {
        assertEq(1 + 1, 2);
    }

    function testFail_ShouldRevert() public {
        // This test expects a revert
        revert("Expected revert");
    }

    function test_Fuzz(uint256 x) public {
        // Fuzz testing
        assertGe(x, 0);
    }
}
