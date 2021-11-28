/* eslint-disable no-process-exit */
import { ethers } from "hardhat";

const main = async () => {
  // const [deployer] = await ethers.getSigners();
  // const accountBalance = await deployer.getBalance();
  // console.log("Deploying contracts with account: ", deployer.address);
  // console.log("Account balance: ", accountBalance.toString());
  // const Token = await ethers.getContractFactory("EpicNFT");
  // const portal = await Token.deploy({
  //   value: ethers.utils.parseEther("0.01"),
  // });
  // await portal.deployed();
  // console.log("WavePortal address: ", portal.address);
  const nftContractFactory = await ethers.getContractFactory("EpicNFT");
  const nftContract = await nftContractFactory.deploy();
  await nftContract.deployed();
  console.log("Contract deployed to:", nftContract.address);

  // Call the function.
  const txn = await nftContract.makeAnEpicNFT();
  // Wait for it to be mined.
  await txn.wait();
  console.log("Minted NFT #1");

  // txn = await nftContract.makeAnEpicNFT();
  // // Wait for it to be mined.
  // await txn.wait();
  // console.log("Minted NFT #2");
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();
