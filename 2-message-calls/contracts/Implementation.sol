pragma solidity ^0.5.11;

contract Implementation {
  event ImplementationLog(uint256 gas);

  function() external payable {
    emit ImplementationLog(gasleft());
    assert(false);
  }
}
