pragma solidity >=0.7.0 <0.9.0;

contract payInvestor{
    address investor;
    uint amount;

    address payable[] wallets;
    mapping(address => uint) valuePaid;

    function payInvestors(address payable investorWallet, uint amountPaid) public{
        wallets.push(investorWallet);
        valuePaid[investor] = amountPaid;
    }

    function payout() private{
        for (uint i=0;i<wallets.length;i++){
            wallets[i].transfer(valuePaid[wallets[i]]);
        }
    }

    function makePayment() payable public {
        payout();
    }

    function checkInvestors() public view returns(uint){
        return wallets.length;
    }

}