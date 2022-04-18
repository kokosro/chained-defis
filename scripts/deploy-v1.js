const hre = require('hardhat');
const deployment = require('../src/deployment');

async function main() {
  console.log('deploying v1');
  await hre.run('compile');

  const network = hre.network.name.toLowerCase();
  console.log(network);
  const [admin] = await hre.ethers.getSigners();

  const coreList = ['Constant', 'FlowControl', 'MathUint256', 'ERC20',
    // 'ERC721'
  ];

  console.log('deploying core v1');
  const modules = {};
  for (let i = 0; i < coreList.length; i++) {
    const core = coreList[i];
    console.log(`deploying ${core} module`);
    modules[core] = await deployment.deployer(core, {
      args: [],
      subpath: '/module',
    });

    console.log(`deployed ${core} module at ${modules[core].address}`);
  }
  const defis = {};

  const defisList = ['Mimatic', 'UniswapV2', 'Yearn', 'Tomb'];

  console.log('deploying defis');

  for (let i = 0; i < defisList.length; i++) {
    const defi = defisList[i];
    console.log(`deploying ${defi}`);

    defis[defi] = await deployment.deployer(defi, {
      args: [],
      subpath: '/defis',
    });
    console.log(`deployed ${defi} defi at ${defis[defi].address}`);
  }
}

main().then(() => {
  console.log('MIGRATIONS DONE');
  process.exit(0);
}).catch((error) => {
  console.error(error);
  process.exit(1);
});
