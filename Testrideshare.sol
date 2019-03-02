pragma solidity ^0.4.22;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/rideshare.sol";

contract Testrideshare{

function testride() {

//rs is an instance of the rideshare contract for testing
rideshare rs = rideshare(DeployedAddresses.rideshare());

    
    string test_destination = "UB city";
    string test_name = "pearl";
    uint test_ridevalue = 10 ether;   // amount to be paid
    string  test_licence_platenumber = "KA04 MJ 3211";

    //parameters returned by register()

    address a;
    string d;
    string n;
    uint v;
    string l;

    (a,d,n,v,l)=rs.register(test_destination,test_ridevalue,test_liscence_platenumber,test_name);

    //to check if the returned values are same as values passed int the function

    Assert.equal(n, test_name, "name should match");
        Assert.equal(a,this, "the caller of the function");
                Assert.equal(d, test_destination, "destination should match");

        Assert.equal(v, test_ridevalue, "the amount to be payed should match");
        Assert.equal(l,test_licence_platenumber , "finally the vehicle licence number should match");



}


}	

