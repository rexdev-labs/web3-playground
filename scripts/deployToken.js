import hre from "hardhat";

async function main() {
  // Koneksi ke network
  const connection = await hre.network.connect();
  // Ambil factory kontrak MyToken
  const MyToken = await connection.ethers.getContractFactory("MyToken");
  // Deploy kontrak
  const token = await MyToken.deploy();
  // Tunggu sampai jaringan mengonfirmasi
  await token.waitForDeployment();
  // Tampilkan alamat token
  console.log("Token berhasil dideploy ke:", await token.getAddress());
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});