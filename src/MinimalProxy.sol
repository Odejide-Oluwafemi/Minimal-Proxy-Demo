// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract MinimalProxy {
    address implementation;

    constructor(address implementationAddress) {
        implementation = implementationAddress;
    }

    function setImplementationAddress(address newAddress) public {
        implementation = newAddress;
    }

    fallback() external payable {
        (bool success, ) = implementation.call{value: msg.value}(msg.data);

        require (success);
    }

    receive() external payable { }
}