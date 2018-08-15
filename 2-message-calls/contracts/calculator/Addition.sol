pragma solidity ^0.4.21;

import "./ResultStorage.sol";

contract Addition is ResultStorage {
  function calculate(uint256 x) public returns (uint256) {
    uint256 temp = result + x;
    assert(temp >= result);
    result = temp;
    return result;
  }
}
