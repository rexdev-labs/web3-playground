import hre from "hardhat";

async function main() {
  // 1. Buat koneksi ke network
  const connection = await hre.network.connect();

  // 2. Ambil "cetakan" kontrak kita
  const Counter = await connection.ethers.getContractFactory("Counter");

  // 3. Mulai proses deploy
  console.log("Deploying Counter Contract...");
  const counter = await Counter.deploy();

  // 4. Tunggu sampai selesai tercatat di blockchain
  await counter.waitForDeployment();

  // 5. Tampilkan alamatnya
  console.log("Contract deployed to:", await counter.getAddress());
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});