// SPDX-License-Identifier: MIT
pragma solidity >=0.5.1 <0.8.0;

import './MyToken.sol';

contract BurnableToken is MyToken {
    uint256 public BurningPossibilityDate = block.timestamp + 1 minutes;

    event Burn(address indexed burner, uint256 value);

    function burn(uint256 _value) public {
        require(_value > 0 && _value <= balances[msg.sender].tokens);

        if(block.timestamp > BurningPossibilityDate) {
            balances[msg.sender].tokens -= _value;
            totalSupply -= _value;

            emit Burn(msg.sender, _value);
        }
    }
}