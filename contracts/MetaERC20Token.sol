// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./IMetaERC20Token.sol";

contract MetaERC20Token is IMetaERC20Token {
    address public immutable owner;
    string public tokenName;
    string public tokenSymbol;
    uint256 public totalSupply;
    uint8 public tokenDecimal;
    uint256 public constant MAX_SUPPLY = 1000000;

    mapping(address => uint256) private userBalances;

    constructor(
        string memory _tokenName,
        string memory _tokenSymbol,
        uint8 decimal
    ) {
        tokenName = _tokenName;
        tokenSymbol = _tokenSymbol;
        tokenDecimal = decimal;
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "UNAUTHORIZED");
        _;
    }

    function mint(address _account, uint256 _amount) public onlyOwner {
        require(_amount > 0, "CANNOT_MINT_ZERO_VALUE");
        uint256 tempSupply = totalSupply + _amount;
        require(tempSupply <= MAX_SUPPLY, "MAXIMUM_TOKEN_SUPPLY_REACHED");

        totalSupply = totalSupply + _amount;
        userBalances[_account] = userBalances[_account] + _amount;

    }

    function balanceOf(address _owner) external view returns (uint256) {
        return userBalances[_owner];
    }

    function transfer(address _to, uint256 _value) external  returns (bool) {
        require(_to != address(0), "ZERO_ADDRESS_NOT_ALLOWED");
        require(_to != msg.sender, "You cannot trasfer token to yourself");

        uint256 _bal = userBalances[msg.sender];
        require(_bal >= _value, "INSUFFICIENT_BALANCE");

        uint256 _newBal = _bal - _value;
        
        userBalances[msg.sender] = _newBal;
        userBalances[_to] = userBalances[_to] + _value;

        assert(userBalances[msg.sender] == _newBal);

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function burn(uint96 _amount) external {

        require(userBalances[msg.sender] > 0, "YOU_DO_NOT_HAVE_ANY_TOKEN");
        require(userBalances[msg.sender] >= _amount, "INSUFFICIENT_TOKEN_BALANCE");

        userBalances[msg.sender] = userBalances[msg.sender] - _amount;
        totalSupply = totalSupply - _amount;

        userBalances[address(0)] = userBalances[address(0)] + _amount;
    }
}
