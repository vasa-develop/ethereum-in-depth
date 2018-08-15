pragma solidity ^0.4.21;

import "./Greeter.sol";

contract Wallet {
  Greeter internal greeter;

  function Wallet() public {
    greeter = new Greeter();
  }

  function () public payable {
    bytes4 methodId = Greeter(0).thanks.selector;
    require(greeter.delegatecall(methodId));
  }
}
