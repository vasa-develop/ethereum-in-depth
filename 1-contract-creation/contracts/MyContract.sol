pragma solidity ^0.4.21;

contract MyContract {
  event Log(address addr);

  function MyContract() public {
    emit Log(this);
  }

  function add(uint256 a, uint256 b) public pure returns (uint256) {
    return a + b;
  }
}
