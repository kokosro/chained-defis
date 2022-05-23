const fs = require('fs');

const dataLocationType = (type) => {
  const memoryDataTypes = ['string', 'bytes', 'address[]', 'uint256[]'];
  if (memoryDataTypes.includes(type)) {
    return ' memory ';
  }
  return ' ';
};

const generate = (contractName, abiPath, contractPath) => {
  const abiJson = fs.readFileSync(abiPath).toString();
  const abi = JSON.parse(abiJson);
  //  console.log(abi);
  let interfaceFunctions = '';
  let functions = `

`;
  for (let i = 0; i < abi.length; i++) {
    const element = abi[i];
    if (element.type == 'function') {
      functions = `${functions}
function ${element.name}(bytes memory _contractAddress${element.inputs.length > 0 ? ', ' : ''}${element.inputs.map(({ type }, idx) => `bytes memory arg${idx}`).join(', ')}) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
${element.inputs.map(({ type }, idx) => `${type}${dataLocationType(type)}input${idx} = abi.decode(execute(arg${idx}), (${type}));`).join('\n')}
${element.outputs.length == 0 ? '' : `(${element.outputs.map(({ type, name }, idx) => `${type}${dataLocationType(type)}output${idx}`).join(',')})=`} ${contractName}(contractAddress).${element.name}(${element.inputs.map(((_, idx) => `input${idx}`))});
output = ${element.outputs.length == 0 ? 'abi.encode(true)' : `abi.encode(${element.outputs.map((_, idx) => `output${idx}`).join(',')})`};
}
`;
      interfaceFunctions = `${interfaceFunctions}
function ${element.name}(${element.inputs.map(({ type }) => `${type}${dataLocationType(type)}`).join(',')}) external ${element.stateMutability != 'nonpayable' ? element.stateMutability : ''} ${element.outputs.length == 0 ? '' : `returns (${element.outputs.map(({ type }) => `${type}${dataLocationType(type)}`).join(',')})`} ;`;
    }
  }

  const contractCode = `/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { Base } from "../Base.sol";
interface ${contractName} {
${interfaceFunctions}
}

contract Defi_${contractName} is Base {

${functions}

}
`;
  // console.log(contractCode);
  fs.writeFileSync(contractPath, contractCode);
};

generate(process.argv[2], process.argv[3], process.argv[4]);
