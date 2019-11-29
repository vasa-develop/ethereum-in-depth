pragma solidity ^0.5.11;

contract MyContract {
  event Log(address addr);

  constructor() public {
    emit Log(address(this));
  }

  function add(uint256 a, uint256 b) public pure returns (uint256) {
    return a + b;
  }
}
