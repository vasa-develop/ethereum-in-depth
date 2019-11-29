pragma solidity ^0.5.11;

import "./ResultStorage.sol";

contract Product is ResultStorage {
  function calculate(uint256 x) public returns (uint256) {
    if (x == 0) result = 0;
    else {
      uint256 temp = result * x;
      assert(temp / result == x);
      result = temp;
    }
    return result;
  }
}
