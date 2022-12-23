// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./SimpleStorage.sol";

// the StorageFactory contract is deploying the simplestorage contracts on every function call
contract StorageFactory{

    SimpleStorage[] public simpleStorageArr; // type  SimpleStorage array, visibility public, variable name simpleStorage

    function createSimpleStorage() public{
        SimpleStorage simpleStorage = new SimpleStorage(); // initialised at 0x0000... blank
        simpleStorageArr.push(simpleStorage); // create the new contract and store in arr to keep a track
    }
    // storage factory -> create
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNum) public{
        // interaction with s.c requires 2 things ->>>
        // 1. Address of the deployed s.c   2. Application Binary Interface (ABI)
        // creating obj simpleStorage, accessing the address for given index
        SimpleStorage simpleStorage = simpleStorageArr[_simpleStorageIndex];
        // storing the given num inside the simpleStorage obj
        simpleStorage.store(_simpleStorageNum);
    } 
    // storage factory -> read
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
         return simpleStorageArr[_simpleStorageIndex].retrieve(); // calls the retrieve function on the array item -> s.c
    }
}