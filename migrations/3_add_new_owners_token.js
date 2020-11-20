const AddNewOwnersToken = artifacts.require("AddNewOwnersToken");

module.exports = function (deployer) {
  deployer.deploy(AddNewOwnersToken);
};