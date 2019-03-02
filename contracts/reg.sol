pragma solidity >=0.4.22 <0.6.0;

import "./ownable.sol";

contract Aadhaar is Ownable {
  
  //To Register new Users by UIDAI
  struct userDetails{
        string name;
        string contact;
        uint userid;
        uint usertype;
        string email;
    }
    //Total No of users registered
    uint public userCount;
    userDetails[] public userList;
    
    mapping (uint => bool) public userRegistered;
    
    function register(string memory _name,string memory _contact,uint _userid,uint _usertype,string memory _email)public onlyOwner{
        require(userRegistered[_userid]);
            userRegistered[_userid]=true;
            address adr = msg.sender;
            userList.push(userDetails(_name,_contact,_userid,_usertype,_email));
            userCount=userCount+1;
    }
  
  
  struct Request {
    address company;            //The AUA which wants to raise an authentication request
    address user;               //The user which the AUA is looking to authenticate
    bytes32 purpose;            //The purpose of authentication
    string encryptedData;       //The authentication data (biometric/demographic) provided by the user
    bool approvedByUser; 
      
  }
  

  Request[] public requests;


  /* Called by the AUA to add an authentication request to the blockchain
     user - The public address of the user which the AUA wants to authenticate
     purpose - The purpose of authentication*/
  function requestAuthentication(address user, bytes32 purpose) public {
    requests.push(Request(msg.sender,user,purpose,"",false)); //map to the request object above
  }



  /* Called by the user to approve the request, and upload his encrypted data
      Inputs: 
        1. company - The public address of the AUA whose request the user wants to approve
        2. encryptedData - The encrypted data - biometric/demographic
  */
  function provideData(address company, string memory encryptedData) public {
    for(uint i=0; i<requests.length; i++) {
      Request memory r = requests[i];
      if (r.company == company && r.user == msg.sender) {
        r.approvedByUser = true;
        r.encryptedData = encryptedData;
      }
    }
  }


  /* Called by the govt. to certify that the data provided by the user was correct
      Inputs: 
        1. company - The AUA which raised the request
        2. user - The user who is being authenticated
  */
  function approveAuthentication(address company, address user)public onlyOwner returns (bool){
    for(uint i=0; i<requests.length; i++) {
      Request memory r = requests[i];
      if (r.company == company && r.user == user && r.approvedByUser == true) {
            return true;
      }
    }
  }

}
