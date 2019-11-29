pragma solidity ^0.5.11;

contract Calldata {
  function add(uint256 _a, uint256 _b) public view returns (uint256 result) {
    assembly{
      _a := mload(0x40)
      _b := add(_a, 32)
      calldatacopy(_a, 4, 32)
      calldatacopy(_b, add(4, 32), 32)
      result := add(mload(_a), mload(_b))
    }
  }
}
