# Foundry Upgradeable Contract Project

This repository contains a Foundry-based project demonstrating the deployment and upgrade of an Ethereum smart contract using the UUPS (Universal Upgradeable Proxy Standard) pattern. The project includes two versions of a contract (`BoxV1` and `BoxV2`) and scripts for deploying and upgrading the contract.

## Table of Contents

- [Foundry Upgradeable Contract Project](#foundry-upgradeable-contract-project)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Deployment](#deployment)
  - [Upgrading](#upgrading)
  - [Testing](#testing)

## Introduction

This project showcases the implementation of upgradeable smart contracts using the UUPS proxy pattern with OpenZeppelin's upgradeable contracts. It demonstrates deploying the initial version (`BoxV1`) and upgrading to a new version (`BoxV2`) while preserving the contract state.

## Prerequisites

Ensure you have the following installed on your system:

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`

## Installation

Clone the repository and install the dependencies:

```bash
git clone https://github.com/MrSaade/foundry-upgradeable-contracts.git
cd foundry-upgradeable-contracts
make
```

## Deployment

To deploy the initial version of the contract (BoxV1), use the DeployBox script:

```bash
forge script script/BoxDeploy.s.sol:DeployBox --broadcast --rpc-url YOUR_RPC_URL
```

OR

```bash
make deploy
```

## Upgrading

To upgrade the deployed contract to version 2 (BoxV2), use the UpgradeBox script:

```bash
forge script script/UpgradeToBoxV2.s.sol:UpgradeBox --broadcast --rpc-url YOUR_RPC_URL
```

OR

```bash
make upgrade
```

Ensure that the UpgradeBox script correctly fetches the most recently deployed proxy address using the DevOpsTools library.

## Testing

Run the test suite to ensure the deployment and upgrade processes work as expected:

```bash
forge test
```

The tests include:
-Deployment of BoxV1 and verification of its version.
-Ensuring that BoxV2 functions are not accessible before the upgrade.
-Upgrading to BoxV2 and verifying the version and new functionality.
