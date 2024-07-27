 
# MetaERC20Token
MetaERC20Token is a simple ERC20 smart contract. It is not a complete ERC20 functions. 

## Description
This is a simple an ERC20 smart contract written in Solidity comprising ten functions: four defined functions and six automatically generated functions.

The four defined functions are:

- mint(address _account, uint256 _amount): allows the owner of the contract to mint (_amount) token to user (_account).
- balanceOf(address _owner): allows a user (_owner) to check his/her token balance in the contract.
- transfer(address _to, uint256 _value): allows a user to transfer (_value) token owned to another user (_to).
- burn(uint96 _amount): allows user (msg.sender) to burn (_amount) token no longer needed.

The six automatically generated functions are:

- owner(): returns the EOA address that deploys this contract.
- tokenName(): returns the name given to the token at the point of deployment.
- tokenSymbol(): returns the symbol given to the token at the point of deployment.
- totalSupply(): returns the current total supply of the tokens.
- tokenDecimal(): returns the decimal of the token.
- MAX_SUPPLY(): returns 1000000 which is the maximum supply of the token.

## Getting Started
After cloning the github, do the following to get the code running on your computer.

- Inside the project directory, in the terminal type: npm i
- Open two terminals in your VS code or your preferred IDE
- In the first terminal type: ```npx hardhat compile``` to compile your contracts
- In the second terminal type: ```npx hardhat node``` to set up local nodes
- Go back to the first terminal and type: ```npx hardhat ignition deploy ./ignition/modules/MetaERC20Token.ts --network localhost``` to deploy your contract
- To interact with the functions in the contract, you can create another file in the script folder to write your interaction scripts.

## Authors
Peter Fatukasi

## License
This project is licensed under the MIT License - see the LICENSE.md file for details
