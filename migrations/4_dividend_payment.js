const DividendPayment = artifacts.require("DividendPayment");

module.exports = function (deployer) {
  deployer.deploy(DividendPayment);
};