// SPDX-License-Identifier: MIT
pragma solidity >=0.5.1 <0.8.0;

interface MyToken {
    function mint(address _to, uint _value) external;
    function balanceOf(address _owner) external view returns (uint256);
    function transfer(address _to, uint256 _value) external;
    function transferFrom(address _from, address _to, uint256 _value) external;
    function approve(address _spender, uint256 _value) external returns (bool);
    function allowance(address _owner, address _spender) external view returns (uint);
}

contract InteractionToken {
    MyToken public standartToken;

    function setAddress(address _addr) public {
        standartToken = MyToken(_addr);
    }

    function myTokenMint(address _to, uint256 _value) public {
        standartToken.mint(_to, _value);
    }
    
    function myTokenBalance(address _owner) public view returns (uint256) {
        return standartToken.balanceOf(_owner);
    }
    
   function myTokenTransfer(address _to, uint256 _value) public {
       standartToken.transfer(_to, _value);
   }
   
   function myTokenTransferFrom(address _from, address _to, uint256 _value) public {
       standartToken.transferFrom(_from, _to, _value);
   }
   
   function myTokenApprove(address _spender, uint256 _value) public returns (bool) {
       return standartToken.approve(_spender, _value);
   }
   
   function myTokenAllowance(address _owner, address _spender) public view returns (uint) {
       return standartToken.allowance(_owner, _spender);
   }
}