/* eslint-disable no-process-exit */
import { ethers } from "hardhat";

const main = async () => {
  // const [owner, randomPerson] = await ethers.getSigners();
  // const waveContractFactory = await ethers.getContractFactory("WavePortal");
  // const waveContract = await (waveContractFactory as any).deploy({
  //   value: ethers.utils.parseEther("1133"),
  // });
  // await waveContract.deployed();
  // console.log("Contract deployed to:", waveContract.address);
  // console.log("Contract deployed by:", owner.address);
  // let waveCount;
  // waveCount = await waveContract.getTotalWaves();
  // let waveTxn = await waveContract.wave(
  //   "Hello sending a message.",
  //   "greenBlue",
  // );
  // await waveTxn.wait();
  // waveCount = await waveContract.getTotalWaves();
  // waveTxn = await waveContract
  //   .connect(randomPerson)
  //   .wave("MESSAGE. 🚀", "greenBlue");
  // await waveTxn.wait();
  // waveCount = await waveContract.getTotalWaves();
  // console.log(`wave count: ${waveCount}`);
  // const waves = await waveContract.getAllWaves();
  // console.log({ waves });

  const nftContractFactory = await ethers.getContractFactory("EpicNFT");
  const nftContract = await nftContractFactory.deploy();
  await nftContract.deployed();
  console.log("Contract deployed to: ", nftContract.address);

  let txn = await nftContract.makeAnEpicNFT();

  await txn.wait();

  txn = await nftContract.makeAnEpicNFT();

  await txn.wait();
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
