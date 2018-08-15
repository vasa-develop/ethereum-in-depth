pragma solidity ^0.4.21;

import './MyContract.sol';

contract AnotherContract {
  MyContract public myContract;

  function AnotherContract() public {
    myContract = new MyContract();
  }
}
