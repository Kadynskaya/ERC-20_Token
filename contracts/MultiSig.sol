// SPDX-License-Identifier: MIT
pragma solidity >=0.5.1 <0.8.0;

import './BurnableToken.sol';

contract MultiSig is BurnableToken {
    struct Voting {
        mapping(address => bool) voters;
        uint256 votersCount;
    }
    
    mapping(address => Voting) candidates;

    function distributionTokensVote(address _addr, uint256 _amount) public onlyOwners {
        require(!candidates[_addr].voters[msg.sender], "This owner is already vote");
        candidates[_addr].votersCount++;
        candidates[_addr].voters[msg.sender] = true;
        
        if (candidates[_addr].votersCount > owners.length / 2) {
            mint(_addr, _amount);

            candidates[_addr].votersCount = 0;
            for (uint256 i = 0; i < owners.length; i++) {
                delete candidates[_addr].voters[owners[i]];
            }
        }
    }
}