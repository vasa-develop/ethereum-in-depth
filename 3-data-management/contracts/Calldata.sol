pragma solidity ^0.4.21;

contract Calldata {
  function add(uint256 _a, uint256 _b) public view returns (uint256 result) {
    assembly {
      let a := mload(0x40)
      let b := add(a, 32)
      calldatacopy(a, 4, 32)
      calldatacopy(b, add(4, 32), 32)
      result := add(mload(a), mload(b))
    }
  }
}
