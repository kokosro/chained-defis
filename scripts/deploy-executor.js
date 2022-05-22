const hre = require('hardhat');
const deployment = require('../src/deployment');

async function main() {
  console.log('deploying executor');
  await hre.run('compile');

  const network = hre.network.name.toLowerCase();
  console.log(network);
  const [admin] = await hre.ethers.getSigners();

  console.log('deploying Executor');
  const executor = await deployment.deployer('Executor', {
    args: [],
  });
  console.log(`deployed Executor at ${executor.address}`);
}

main().then(() => {
  console.log('MIGRATIONS DONE');
  process.exit(0);
}).catch((error) => {
  console.error(error);
  process.exit(1);
});
