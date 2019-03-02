var Migrations = artifacts.require("./rideshare.sol");

module.exports = function(deployer) {
  deployer.deploy(rideshare);
};
