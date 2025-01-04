const hre = require("hardhat");

async function main() {
  const MyNFT = await hre.ethers.getContractFactory("MyNFT");
  const myNFT = await MyNFT.deploy("MyNFT", "NFT");
  await myNFT.deployed();
  console.log("Contract deployed to:", myNFT.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
