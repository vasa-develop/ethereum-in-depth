pragma solidity ^0.4.21;

contract Storage {
  uint256 public number;
  address public account;
  uint256[] private array;
  mapping(uint256 => uint256) private map;

  function Storage() public {
    number = 2;
    account = this;
    array.push(10);
    array.push(100);
    map[1] = 9;
    map[2] = 10;
  }
}
