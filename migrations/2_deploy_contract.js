var InvalidOpcode = artifacts.require("./InvalidOpcode.sol");

module.exports = function(deployer, network, accounts) {
    deployer.deploy(InvalidOpcode);
};
