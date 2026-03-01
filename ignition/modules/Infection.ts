import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const PlagueTokenModule = buildModule("PlagueTokenModule", (m) => {
  const plagueToken = m.contract("PlagueToken");

  return { plagueToken };
});

export default PlagueTokenModule;