// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MetaERC20Token is ERC20, Ownable {

    constructor(
        string memory _tokenName,
        string memory _tokenSymbol
    ) ERC20(_tokenName, _tokenSymbol) Ownable(msg.sender) {}


    function mint(address _account, uint256 _amount) public onlyOwner {
        _mint(_account, _amount);
    }

     function transfer(address to, uint256 value) public override  returns (bool) {
        address owner = _msgSender();
        _transfer(owner, to, value);
        return true;
    }
   

    function burn(uint96 _amount) external {

        _burn(msg.sender, _amount);
    }
}
