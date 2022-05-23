# chained-defis

Programable wallet that can interact with multiple defi protocols with off-chain strategy building.

## Rationale

## How it works

## Execution

```solidity
enum InstructionType { SELF, EXTERNAL }
  
struct Instruction {
  InstructionType _type;
  uint256 value;
  address target;
  string name;
  uint256 version;
  bytes data;
  bytes next;
}

```

`InstructionType.SELF` - will `delegatecall` to `target`

`InstructionType.EXTERNAL` - will `call` `target`

`version` - `target` should respond with corresponding `version` ( `target.__version()` )

`data` - data to call `target` with

`value` - native amount to call `target` with

`next` - next instruction that should be executed after this. When `next` is empty the execution ends


## Wrappers

A wrapper to a protocol is a way to uniformize the call to a specific contract.
It is a contract that emulates the interface of the protocol that accepts `bytes memory` arguments that encode Instructions.
First argument is always an `Instruction` that outputs the address of the end contract that needs to be called.

Wrappers can be auto generated from their abi using

```sh
npm run generate ContractName ./path/to/abi/ContractName.json ./path/to/where/the/wrapper/will/be/generated/WrapperContractName.sol
```

