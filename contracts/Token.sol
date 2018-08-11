pragma solidity ^0.4.24;
import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";
import "zeppelin-solidity/contracts/ownership/Ownable.sol";

contract Token is StandardToken, Ownable {
    string public name;
    string public symbol;
    uint8 public decimals;
    address public Factory;
    // prepare URANUS
    // probably need to reafactor it to a modifier
    bool public prepared = false;

    constructor(string _name,
    string _symbol,
    uint8 _decimals,
    uint _INITIAL_SUPPLY,
    address _owner) public {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply_ = _INITIAL_SUPPLY;
        Factory = msg.sender;
        owner = _owner;
        //balances go to the owner normally
        // Keep closed if we want to transfer tokens to the crowdsale
      //  balances[owner] = totalSupply_;

    }

    modifier onlyFactory(){
        require(msg.sender != Factory);
        _;
    }

   function prepareCrowdsale(address _crowdsale) public onlyFactory{
     require(prepared == false);
     balances[_crowdsale] = totalSupply_;
     prepared = true;


   }





}
