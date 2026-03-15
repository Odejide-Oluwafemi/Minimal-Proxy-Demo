// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3;

import { Test, console2 } from "forge-std/Test.sol";
import { MinimalProxy } from "src/MinimalProxy.sol";
import { TestContract } from "src/TestContract.sol";
import { HelperFunctions } from "src/HelperFunctions.sol";

contract MinimalProxyTest is Test {
  TestContract public testContract;
  MinimalProxy public proxyContract;

  function setUp() public {
    testContract = new TestContract();
    proxyContract = new MinimalProxy(address(testContract));
  }

  function test__ProxyWorks() public {
    uint256 value = 77;
    string memory signature = "setValue(uint256)";

    bytes memory callBytes = HelperFunctions.getFunctionSig(signature, value);
    console2.log(string(callBytes));

    (bool success, ) = address(proxyContract).call(callBytes);
    require(success);

    assertEq(testContract.getValue(), value);
  }
}