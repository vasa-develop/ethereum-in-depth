pragma solidity ^0.5.11;

contract Storage {
  uint256 public number;
  address public account;
  uint256[] private array;
  mapping(uint256 => uint256) private map;

  constructor() public {
    number = 2;
    account = address(this);
    array.push(10);
    array.push(100);
    map[1] = 9;
    map[2] = 10;
  }
}
