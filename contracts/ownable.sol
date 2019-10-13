pragma solidity >=0.4.22 <0.6.0;

//The Ownable contract has an owner address, and provides basic authorization control functions, this simplifies the implementation of "user permissions".

contract Ownable {
  address private _owner;

  event OwnershipTransferred(
    address indexed previousOwner,
    address indexed newOwner
  );

  //The Ownable constructor sets the original `owner` of the contract to the sender account
  constructor() internal {
    _owner = msg.sender;
    emit OwnershipTransferred(address(0), _owner);
  }

  //returns the address of the owner.
  function owner() public view returns(address) {
    return _owner;
  }

  //Throws error if called by any account other than the owner.
  modifier onlyOwner() {
    require(isOwner());
    _;
  }

  //returns true if `msg.sender` is the owner of the contract.
  function isOwner() public view returns(bool) {
    return msg.sender == _owner;
  }

  /**
  Allows the current owner to relinquish control of the contract.
  Renouncing to ownership will leave the contract without an owner.
  It will not be possible to call the functions with the `onlyOwner`
  modifier anymore.
  */
  function renounceOwnership() public onlyOwner {
    emit OwnershipTransferred(_owner, address(0));
    _owner = address(0);
  }

  /**Allows the current owner to transfer control of the contract to a newOwner.
  newOwner The address to transfer ownership to.
  */
  function transferOwnership(address newOwner) public onlyOwner {
    _transferOwnership(newOwner);
  }

  // Transfers control of the contract to a newOwner.
   function _transferOwnership(address newOwner) internal {
    require(newOwner != address(0));
    emit OwnershipTransferred(_owner, newOwner);
    _owner = newOwner;
  }
}

