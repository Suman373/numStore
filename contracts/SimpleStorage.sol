// SPDX-License-Identifier: MIT

// pragma solidity ^0.8.17;
// pragma solidity ^0.8.0;
pragma solidity >=0.8.0 <0.9.0;

contract SimpleStorage {

    uint256 favoriteNumber; // non-negative value upto 255bit
    // maximum value is 2^256-1 (zero needs one space)

    struct People {
        uint256 favoriteNumber;
        string name;
    }
    // uint256[] public anArray;
    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber; // like a hash table

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name)); // create from structure and store in array
        nameToFavoriteNumber[_name] = _favoriteNumber; // add person to a key
    }
}