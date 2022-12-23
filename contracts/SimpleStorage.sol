// SPDX-License-Identifier: MIT

// also can be ^0.8.0 , means >= 0.8.0 versions
pragma solidity >=0.8.0 <0.9.0;

contract SimpleStorage {

    uint256 favoriteNumber; // non-negative value upto 255bit
    // maximum value is 2^256-1 (zero needs one space)

    struct People {
        uint256 favoriteNumber; // unsigned int vairable favouriteNumber
        string name; // string data type variable name
    }
    // uint256[] public anArray;
    People[] public people; // People-> structure unit, public-> function specifier , people-> array variable

    mapping(string => uint256) public nameToFavoriteNumber; // like a hash table

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    function retrieve() public view returns (uint256){
        return favoriteNumber; // view means no txn fee is required for this func call
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name)); // create from structure and store in array
        nameToFavoriteNumber[_name] = _favoriteNumber; // add person to a key
    }
}