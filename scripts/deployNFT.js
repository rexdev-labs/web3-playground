import hre from "hardhat";

async function main() {

  const connection = await hre.network.connect();

  const MyNFT = await connection.ethers.getContractFactory("MyNFT");

  const nft = await MyNFT.deploy();

  await nft.waitForDeployment();

  console.log("NFT berhasil dideploy ke:", await nft.getAddress());
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});