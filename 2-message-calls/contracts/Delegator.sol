pragma solidity ^0.5.11;

import "./Implementation.sol";

contract Delegator {
  event DelegatorLog(uint256 gas);

  Implementation public implementation;

  constructor() public {
    implementation = new Implementation();
  }

  function() external payable {
    emit DelegatorLog(gasleft());

    address _impl = address(implementation);
    
    assembly {
      let ptr := mload(0x40)
      calldatacopy(ptr, 0, calldatasize)
      let result := delegatecall(gas, _impl, ptr, calldatasize, 0, 0)
    }

    emit DelegatorLog(gasleft());
  }
}
