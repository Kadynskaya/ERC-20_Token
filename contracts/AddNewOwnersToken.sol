// SPDX-License-Identifier: MIT
pragma solidity >=0.5.1 <0.8.0;

import './BurnableToken.sol';

contract AddNewOwnersToken is BurnableToken {
    struct Voting {
        mapping(address => bool) voters;
        uint256 votersCount;
    }
    
    mapping(address => Voting) candidates;
    
    function vote(address _newOwnerAddress) public onlyOwners {
        for(uint256 i = 0; i < owners.length - 1; i++) {
            require(owners[i] != _newOwnerAddress);
        }
        require(!candidates[_newOwnerAddress].voters[msg.sender]);
        candidates[_newOwnerAddress].votersCount++;
        candidates[_newOwnerAddress].voters[msg.sender] = true;
    }
    
    function setOwners(address _newOwnerAddress) public onlyOwners {
        if(candidates[_newOwnerAddress].votersCount > owners.length / 2) {
            owners.push(_newOwnerAddress);
            ownerByAddress[_newOwnerAddress] = true;
        }
        candidates[_newOwnerAddress].votersCount = 0;
        for(uint256 i = 0; i < owners.length - 1; i++) {
            delete candidates[_newOwnerAddress].voters[owners[i]];
        }
    }
    
    function getOwners() public view returns(address[] memory) {
        return owners;
    }
}
