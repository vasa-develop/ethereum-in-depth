pragma solidity ^0.5.11;

import "./Product.sol";
import "./Addition.sol";
import "./ResultStorage.sol";

contract Calculator is ResultStorage {
  Product public product;
  Addition public addition;

  constructor() public {
    product = new Product();
    addition = new Addition();
  }

  function add(uint256 x) public {
    bool status;
    bytes memory res;
    (status, res) = address(addition).delegatecall(abi.encodeWithSelector(bytes4(keccak256("calculate(uint256)")), x));
    require(bytesToUInt(res) == x);
  }

  function mul(uint256 x) public {
    bool status;
    bytes memory res;
    (status, res) = address(product).delegatecall(abi.encodeWithSelector(bytes4(keccak256("calculate(uint256)")), x));
    require(bytesToUInt(res) == x);
  }

  function bytesToUInt(bytes memory _b) public returns (uint256){
    uint256 number;
    for(uint i=0;i<_b.length;i++){
      number = number + uint256(uint8(_b[i]))*(2**(8*(_b.length-(i+1))));
    }
    return number;
  }
}
