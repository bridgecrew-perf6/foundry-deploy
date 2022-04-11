// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

contract ContractB {
    address immutable contractA;

    constructor(address _contractA) {
        contractA = _contractA;
    }
}
