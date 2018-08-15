pragma solidity ^0.4.21;

contract Greeter {
  event Thanks(address sender, uint256 value);

  function thanks() public payable {
    emit Thanks(msg.sender, msg.value);
  }
}
