pragma solidity ^0.5.11;

contract Greeter {
  event Thanks(address sender, uint256 value);

  function thanks() public payable {
    emit Thanks(msg.sender, msg.value);
  }
}
