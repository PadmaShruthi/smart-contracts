pragma solidity ^0.8.6;

contract Tether{
    string public name = 'tether';
    string public symbol = 'UDST';
    uint public totalSupply = 1000000000000000000000000;
    uint public decimals = 18;

    event Transfer(
         address indexed _from,
        address indexed _to,
        uint value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint value
    );

    mapping (address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;

    constructor() public{
        balanceOf[msg.sender]=totalSupply;
    }

    function transfer (address _to,uint256 _value) public returns (bool success){
        require( balanceOf[msg.sender]>=_value);
        balanceOf[msg.sender]-=_value;
        balanceOf[_to]+=_value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom (address _from, address _to,uint256 _value) public returns (bool success){
        require( balanceOf[_from]>=_value);
        require(allowance[_from][msg.sender]>=_value);
        balanceOf[_from]-=_value;
        balanceOf[_to]+=_value;
        allowance[_from][msg.sender]-=_value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint _value) public returns(bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

}