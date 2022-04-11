// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import {ContractB} from "./ContractB.sol";

contract ContractA {
    uint256 public immutable n;

    address public immutable contractB;

    constructor(uint256 _n) {
        n = _n;

        contractB = address(new ContractB(address(this)));
    }
}
