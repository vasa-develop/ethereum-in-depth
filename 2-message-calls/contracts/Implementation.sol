pragma solidity ^0.4.21;

contract Implementation {
  event ImplementationLog(uint256 gas);

  function() public payable {
    emit ImplementationLog(gasleft());
    assert(false);
  }
}
