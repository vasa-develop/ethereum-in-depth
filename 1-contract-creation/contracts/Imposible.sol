pragma solidity ^0.5.0;

contract Impossible {
  constructor() public {
    test();
  }

  function test() public pure returns(uint256) {
    return 2;
  }
}
