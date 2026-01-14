// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Test file for code folding

contract SimpleContract {
    uint256 public value;

    function setValue(uint256 _value) public {
        value = _value;
    }

    function getValue() public view returns (uint256) {
        return value;
    }
}

library MathLib {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }
}

interface IToken {
    function transfer(address to, uint256 amount) external returns (bool);
}

contract ContractWithInheritance is SimpleContract {
    function doubleValue() public {
        value = value * 2;
    }
}
