// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3;

library HelperFunctions {
    function getFunctionSelector(string calldata selector) public pure returns (bytes4) {
        return bytes4(keccak256(bytes(selector)));
    }

    function getFunctionSig(string memory signature, uint256 value) public pure returns (bytes memory)  {
        return abi.encodeWithSignature(signature, value);
    }

    function callBySignature(address contractToCall, string memory signature, uint256 value) public returns (bytes memory) {
        (bool success, bytes memory data) = contractToCall.call(abi.encodeWithSignature(signature, value));

        require(success);

        return data;
    }

    function callBySelector(address contractToCall, bytes4 selector, uint256 value) public returns (bytes memory) {
        (bool success, bytes memory data) = contractToCall.call(abi.encodeWithSelector(selector, value));

        require (success);

        return data;
    }
}