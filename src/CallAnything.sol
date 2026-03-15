// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3;

import { HelperFunctions } from "src/HelperFunctions.sol";

contract CallAnything {
  using HelperFunctions for address;
  
  function callOnTestContract(address contractAddress, string memory functionSignature, uint256 value) public returns (bytes memory returnedData) {
    returnedData = contractAddress.callBySignature(functionSignature, value);
  }
}