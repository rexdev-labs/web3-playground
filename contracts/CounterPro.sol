// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract CounterPro {
  uint256 public count;
  address public owner;

  //Event to check count is changed
  event CountChanged(uint256 newCount);

  //Error is owner can continue the functionality
  error JustOwner();

  //Constructor funtion just work for setting owner of contract, running just 1 time once deployed
  constructor(){
    //Set owner of contract as deployer
    owner = msg.sender;
  }

  //Modifier security reusable for all function that need to be run by owner only
  modifier onlyOwner() {
    if(msg.sender != owner) {
      revert JustOwner();
    }
    _;
  }

  function increment () public {
    count += 1;
    emit CountChanged(count);
  }

  function decrement () public {
    require(count > 0, "Count can't be less than zero");
    count -= 1;
    emit CountChanged(count);
  } 

  function reset () public onlyOwner {
    count = 0;
    emit CountChanged(count);
  }
}