Reproducing an issue with verifying contract that are deployed by another contract as part of the constructor.

See `src/ContractA.sol`. It deploys `src/ContractB.sol`.

To deploy `ContractA` I ran: 
```
foundry-deploy - (master) > make deploy-contract contract=src/ContractA.sol:ContractA constructorArgs="1" url=${_69} privateKey=${PRIVATE_KEY}

```
where `_69` is Optimism Kovan network url.

To verify `ContractA` I ran:
```
foundry-deploy - (master) > make verify-contract chainId=69 constructorSig="constructor(uint256)" constructorArgs="1" compilerVersion="v0.8.10+commit.fc410830" address=0xecdcc458e7bae747f870b9eab985f5bd1b6a6579 contract=src/ContractA.sol:ContractA apiKey=${ETHERSCAN_OPTIMISM_API_KEY}
```

ContractA is deployed and verified on [Etherscan](https://kovan-optimistic.etherscan.io/address/0xecdcc458e7bae747f870b9eab985f5bd1b6a6579#code).

I attempted to verify ContractB with:
```
foundry-deploy - (master) > make verify-contract chainId=69 constructorSig="constructor(address)" constructorArgs="0xECdCc458E7BAe747F870B9eAb985F5bD1B6a6579" compilerVersion="v0.8.10+commit.fc410830" address=0x3F591096D95E1010217c09e90F14B9433811d507 contract=src/ContractB.sol:ContractB apiKey=${ETHERSCAN_OPTIMISM_API_KEY}
```

However this doesn't work. Verification output is:

```
Submitted contract for verification:
                Response: `OK`
                GUID: `zbdmkr4kqa3jsbaefya9u2hpskgiwv4z3x9r4a2xw6nc5qbb7t`
                url: https://kovan-optimistic.etherscan.io/address/0x3f59…d507#code
```

And calling `verify-check` returns:

```
Error:
   0: Contract verification failed:
      Response: `NOTOK`
      Details: `Fail - Unable to verify`

Location:
   cli/src/cmd/forge/verify.rs:186

```

ContractB is deployed and not verified. See [Etherscan](https://kovan-optimistic.etherscan.io/address/0x3f591096d95e1010217c09e90f14b9433811d507).
