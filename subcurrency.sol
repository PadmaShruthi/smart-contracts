pragma solidity >=0.7.0 <0.9.0;

contract coin{
    address minter;
    mapping (address => uint) public balances;

    constructor(){
        minter= msg.sender;
    }

    event sent(address from, address to, uint amount);

//new coins can only be created by owner
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }
// defining error
    error insufficientBalance (uint requested, uint available);
//anybody can send coints to anyone provide they have enough balance
    function send(address receiver, uint amount) public {
        if(balances[msg.sender]<amount)
        revert insufficientBalance({
            requested:amount,
            available:balances[msg.sender]
        });
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit sent(msg.sender, receiver, amount);
    }
}