pragma solidity ^0.4.23 ;
pragma experimental ABIEncoderV2;   //experimental features turned on ...
                                      //not to be used for live deployements

contract rideshare{
    
   
    //address of the owner, value of the ride and the liscense number
    //parameters of a ride
    struct ride{
     address owner;
    string destination;
    string name;
    uint ridevalue;   // amount to be paid
    string  licence_platenumber;
        
    }
    
    uint amt_tobepayed;    
    address owner1;
    
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
    
    
    function register(string dest, uint value,string plateno,string username ) public returns(ride r){
        /* returns(address,string,string,uint,string)
        ---for live deployments  */
        
        
        require( value>0);   
        
        r.destination=dest;
        r.owner=owner1=msg.sender;
        r.ridevalue=value;
        r.licence_platenumber=plateno;
        r.name=username;
         amt_tobepayed=value;
        
             emit shareRide(r.owner,r.ridevalue,r.name,r.licence_platenumber);
             
             return r;

    }
    
    
    /* function called by the person wanting the ride*/
    
    function acceptride(string ridername) public Ready{
        //ride is still available
        require(currentstatus==OwnerStatus.notaccepted);
        
        emit Acceptride(msg.sender,msg.value,ridername);
        currentstatus=OwnerStatus.accepted;
        
     }
     
     //after the ride..
     //assumes the ride went smoothly...!
     
     function endride(uint ex) public payable{
                 msg.sender.transfer(amt_tobepayed);

         experience[owner1]=ex;
     } 

    
}