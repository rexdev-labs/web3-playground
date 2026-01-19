// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
// Kita impor template ERC20 yang sudah jadi dari OpenZeppelin
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
// Wariskan fitur ERC20 dan Ownable ke kontrak kita
contract MyToken is ERC20, Ownable {
    // Constructor: Dijalankan sekali saat deploy
    // Ganti "MyToken" dan "MTK" dengan Nama dan Simbol token impianmu!
    constructor() ERC20("PolyTune", "PTN") Ownable(msg.sender) {
        // MINTING AWAL
        // Kita cetak 1 juta token buat diri sendiri saat deploy.
        // Ingat: Solidity tidak pakai koma, tapi pakai 18 nol di belakang.
        // 1000000 * 10^18
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
    // Fungsi Mint Tambahan
    // Cuma Owner yang boleh cetak uang tambahan nanti
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
