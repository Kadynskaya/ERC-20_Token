const BurnableToken = artifacts.require("BurnableToken");

module.exports = function (deployer) {
  deployer.deploy(BurnableToken);
};