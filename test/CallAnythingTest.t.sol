// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3;

import { Test } from "forge-std/Test.sol";
import { CallAnything } from "src/CallAnything.sol";
import { TestContract } from "src/TestContract.sol";

contract CallAnythingTest is Test {
  TestContract public testContract;
  CallAnything public callAnythingContract;

  function setUp() public {
    testContract = new TestContract();
    callAnythingContract= new CallAnything();
  }

  function test__SetsTheValueOnTestContract() public {
    uint256 value = 77;
    string memory signature = "setValue(uint256)";

    callAnythingContract.callOnTestContract(address(testContract), signature, value);

    uint256 valueAfter = testContract.getValue();

    assertEq(valueAfter, value);
  }
}