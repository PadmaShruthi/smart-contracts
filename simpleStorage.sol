pragma solidity >=0.7.0 <0.9.0;
//This contract receives the data, stores it and returns the data back.

contract simpleStorage{
        uint id;
        string name;
        bool eligible;
    

    //function that receives data
    function setDetails(uint _id, string memory _name, bool _eligible) public{
        id = _id;
        name = _name;
        eligible = _eligible;
    }

    //function that returns data
    function getDetails() public view returns (uint,string memory,bool) {
        return (id,name,eligible);
    }
}
