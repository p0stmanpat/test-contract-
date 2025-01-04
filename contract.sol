// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721, Ownable {
    uint256 public nextTokenId;
    string private baseURI;

    // Constructor to set the name and symbol of the NFT collection
    constructor(string memory name, string memory symbol) ERC721(name, symbol) {
        nextTokenId = 1; // Start token IDs at 1
    }

    /**
     * @dev Set the base URI for metadata.
     * @param _baseURI Base URI for metadata.
     */
    function setBaseURI(string memory _baseURI) external onlyOwner {
        baseURI = _baseURI;
    }

    /**
     * @dev Returns the base URI for metadata.
     */
    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    /**
     * @dev Mint a new NFT to the specified address.
     * @param to Address to receive the minted NFT.
     */
    function mint(address to) public payable {
        require(msg.value >= 0.01 ether, "Insufficient payment");
        _safeMint(to, nextTokenId);
        nextTokenId++;
    }

    /**
     * @dev Batch mint NFTs to multiple addresses.
     * @param recipients Array of addresses to receive the NFTs.
     */
    function batchMint(address[] memory recipients) public payable {
        require(msg.value >= recipients.length * 0.01 ether, "Insufficient payment");
        for (uint256 i = 0; i < recipients.length; i++) {
            _safeMint(recipients[i], nextTokenId);
            nextTokenId++;
        }
    }

    /**
     * @dev Burn an NFT to remove it from circulation.
     * @param tokenId The ID of the NFT to be burned.
     */
    function burn(uint256 tokenId) external {
        require(_isApprovedOrOwner(msg.sender, tokenId), "Not approved or owner");
        _burn(tokenId);
    }

    /**
     * @dev Withdraw funds from the contract.
     */
    function withdraw() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }
}
