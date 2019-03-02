pragma solidity ^0.4.22 ;

contract rideshare{
    
   
    //address of the owner, value of the ride and the liscense number
    address public owner;
    string destination;
    string name;
    uint ridevalue;   // amout to be paid
    bytes32 public liscence_platenumber;
    
    /* didn't want to call "rating"...as they are just car pooling and the driver need 
    not be a professional one*/
    
    mapping(address =>uint) experience;
    
    /* enum for the status of the car....
    person sharing the ride could be starting the ride or on the way...
    or already the request has been accepted by somebody else
    */
    
    enum OwnerStatus {    
    
    Driving,
    notaccepted,
    Unavailable,
    accepted
  }
  
  OwnerStatus currentstatus;

  bool Iscarready = false;
  
  modifier Ready {
        require(Iscarready);
        _;
    }
    
     event shareRide(address owner,uint pay,string name,string plateno);
     event Acceptride(address riderAddress, uint pay,string name);
    
    
    
    /* this is the function called by the person willing to share the rideshare
    required details are obtained  ....*/
    
    
    constructor rideshare (string dest, uint value,bytes32 plateno,string username ) {
        require(plateno.length>0 && value>0);   
        
        destination=dest;
        owner=msg.sender;
        ridevalue=value;
        liscence_platenumber=plateno;
        name=username;
        
              shareRide(owner,ridevalue,name,liscence_platenumber);

    }
    
    
    /* function called by the person wanting the ride*/
    
    function acceptride(string ridername) public Ready{
        //ride is still available
        require(currentstatus==OwnerStatus.notaccepted);
        
        Acceptride(msg.sender,msg.value,ridername);
        currentstatus=OwnerStatus.accepted;
        
     }
     
     //after the ride..
     //assumes the ride went smoothly...!
     
     function endride(uint ex) public payable{
                 msg.sender.transfer(ridevalue);

         experience[owner]=ex;
     } 

    
}
