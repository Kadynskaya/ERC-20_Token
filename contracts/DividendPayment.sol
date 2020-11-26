// SPDX-License-Identifier: MIT
pragma solidity >=0.5.1 <0.8.0;

import './AddNewOwnersToken.sol';

contract DividendPayment is AddNewOwnersToken {
    address payable holder;
    
    event Deposit(address sender, uint amount, uint balance);
    
    function deposit() public payable {
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }
    
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function payDivideds() public {
        require(address(this).balance > 0 && totalSupply > 0);
        uint256 totalBalance = address(this).balance;
        for (uint256 i = 0; i < holders.length; i++) {
            address key = holders[i];
            holder = address(uint160(key));
            holder.transfer(totalBalance * balances[holder].tokens / totalSupply);
        }
    }
}