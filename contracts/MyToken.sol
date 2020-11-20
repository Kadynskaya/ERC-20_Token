// SPDX-License-Identifier: MIT
pragma solidity >=0.5.1 <0.8.0;

contract MyToken {
    string public constant name = "My Token";
    string public constant symbol = "MT";
    uint8 public constant decimals = 2;
    
    uint256 public totalSupply;
    address[] public owners;

    address public firstOwner;
    address public secondOwner;
    
    mapping(address => uint256) internal balances;
    mapping(address => mapping(address => uint256)) private allowed;
    mapping(address => bool) public ownerByAddress;
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _from, address indexed _to, uint256 _value);

    constructor () public {
        firstOwner = msg.sender;
        owners.push(firstOwner);
        ownerByAddress[firstOwner] = true;
        secondOwner = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
        owners.push(secondOwner);
        ownerByAddress[secondOwner] = true;
    }

    modifier onlyOwners {
        require(
            ownerByAddress[msg.sender] == true,
            "Only owner can call this function."
        );
        _;
    }
    
    function mint (address to, uint value) public onlyOwners {
        require(totalSupply + value >= totalSupply && balances[to] + value >= balances[to]);
        balances[to] += value;
        totalSupply += value;
    }
    
    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }
    
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_value > 0 && balances[msg.sender] >= _value && balances[_to] + _value > balances[_to]);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
    }
    
    function transferFrom (address _from, address _to, uint256 _value) public {
        require(_value > 0 && balances[_from] >= _value && balances[_to] + _value >= balances[_to] && allowed[_from][msg.sender] >= _value);
        balances[_from] -= _value;
        balances[_to] += _value;
        allowed[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
    }
    
    function approve(address _spender, uint256 _value) public returns (bool) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
    
    function allowance(address _owner, address _spender) public view returns (uint256) {
        return allowed[_owner][_spender];
    }
    
}