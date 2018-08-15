pragma solidity ^0.4.21;

contract Impossible {
  function Impossible() public {
    this.test();
  }

  function test() public pure returns(uint256) {
    return 2;
  }
}
