// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "@openzeppelin/contracts/access/Ownable.sol";
contract MyNFT is ERC721, Ownable {
    // Kita butuh penghitung manual untuk nomor seri (ID)
    uint256 private _nextTokenId;
    constructor() ERC721("PolyArt", "PAT") Ownable(msg.sender) {}
    // Fungsi MINT (Mencetak) [cite: 68]
    // Kita buat supaya cuma Owner yang bisa mint (biar eksklusif)
    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
    }
    // Fungsi Metadata [cite: 72]
    // Ini mengarahkan gambar NFT ke suatu link.
    // Untuk latihan, kita pakai link gambar placeholder sederhana.
    function _baseURI() internal pure override returns (string memory) {
        return "https://api.rdv.com/metadata/";
        // Nanti di dunia nyata, ini diganti link IPFS kamu.
    }
}
