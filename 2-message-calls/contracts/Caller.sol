pragma solidity ^0.4.21;

import "./Implementation.sol";

contract Caller {
  event CallerLog(uint256 gas);

  Implementation public implementation;

  function Caller() public {
    implementation = new Implementation();
  }

  function () public payable {
    emit CallerLog(gasleft());
    implementation.call.gas(gasleft()).value(msg.value)(msg.data);
    emit CallerLog(gasleft());
  }
}
