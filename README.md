# source code for my first crypto, plaguetoken, PLG

why "plague"?
because if you get infected, this token will remain in your wallet forever

on transfer, it will mint 10% of transaction amount back to your wallet

maybe, i should make antidot


#deployment
npm i
### start local dev node:
npx hardhat node 
you will get private keys, set in hardhat.config.ts, in "testnet"
then run:

npx hardhat ignition deploy ignition/modules/Infection.ts --network testnet
###

