const { ethers } = require("hardhat");

async function mintNFT(to, contractAddress) {
  const nftContract = await ethers.getContractAt("MyNFT", contractAddress);
  const tx = await nftContract.mint(to, { value: ethers.utils.parseEther("0.01") });
  console.log("Minted NFT:", tx.hash);
}
