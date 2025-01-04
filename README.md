# MyNFT Contract

This project contains a smart contract for an NFT collection, along with scripts to deploy and mint NFTs.

## Files

- `contract.sol`: The Solidity smart contract for the NFT collection.
- `metadata.json`: Sample metadata for an NFT.
- `scripts/deploy.js`: Script to deploy the smart contract.
- `scripts/mint.js`: Script to mint an NFT.

## Usage

### Deploy the Contract

To deploy the contract, run the following command:

```sh
npx hardhat run scripts/deploy.js --network <network-name>