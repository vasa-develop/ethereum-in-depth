pragma solidity ^0.5.11;

import "./Greeter.sol";

contract Wallet {
  Greeter internal greeter;

  constructor() public {
    greeter = new Greeter();
  }

  function() external payable {
    bool status;
    bytes memory res;
    (status, res) = address(greeter).delegatecall(abi.encodeWithSelector(bytes4(keccak256("thanks()"))));
  }
}
