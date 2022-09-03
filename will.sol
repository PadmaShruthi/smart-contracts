pragma solidity >=0.7.0 <0.9.0;

contract will{

    address owner;
    uint amount;
    bool deceased;
    uint i;
//constructor is called automatically when the sc is deployed.
    constructor() payable {
        owner=msg.sender;
        amount=msg.value;
        deceased=false;
    }

//modifier sets some behaviour or pre-req to a function
//checks if the calling party of the sc is the owner only
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
//send money only if deceased is true
    modifier onlyDeceased{
        require(true == deceased);
        _;
    }
//unsized array
    address payable[] familyWallets;
//map the amount to the address
    mapping(address => uint) inheritance;
//add wallets to familyWallet list and set amount to the wallet address which is triggered by the owner only
    function setInheritance(address payable wallet, uint walletAmount) onlyOwner public{
        familyWallets.push(wallet); 
        inheritance[wallet] = walletAmount;
    }
//transfer amount to all family members by looping the familyWallet list only if deceased
    function payout() onlyDeceased private{
        for(i=0;i<=familyWallets.length;i++){
            //transfers amount from contract address to sender address
            familyWallets[i].transfer(inheritance[familyWallets[i]]);
        }
    }
    
    function isDeceased() public{
        deceased = true;
        payout();
    }

}