import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";


const LockModule = buildModule("LockModule", (m) => {

  const tokenName = m.getParameter("tokenName", "MetaERC20");
  const tokenSymbol = m.getParameter("tokenSymbol", "MT20");
  const tokenDecimal = m.getParameter("tokenDecimal", 18);

  const metaERC20Token = m.contract("MetaERC20Token", [tokenName, tokenSymbol, tokenDecimal]);

  return { metaERC20Token };
});

export default LockModule;

//to deploy
//npx hardhat ignition deploy ignition/modules/Lock.ts --network localhost