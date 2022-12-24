// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";
// ExtraStorage (child) here inherits all methods and atttributes from SimpleStorage (parent)
contract ExtraStorage is SimpleStorage{
    // we want to multiply the number is PI
    uint256 numerator = 22;
    uint256 PI = numerator / 7;
    // we need to override the store func in parent with the newly created child
    function store(uint256 _favoriteNumber) public override{
        favoriteNumber = _favoriteNumber * PI; // here we are changing the global value of favouriteNumber to the new number
    }
}