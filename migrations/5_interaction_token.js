const InteractionToken = artifacts.require("InteractionToken");

module.exports = function (deployer) {
  deployer.deploy(InteractionToken);
};