// SPDX-License-Identifier: MIT
// Deployed Rinkeby @ 0xBeCBf3ccC03592979dD032d7d60f77c409095e0A
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

/**
 * @notice DO NOT USE THIS CODE IN PRODUCTION. This is an example contract.
 */
contract GetUint256 is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    uint256 private constant ORACLE_PAYMENT = 100000000000000000; // 0.1LINK
    uint256 public value;

    event RequestValue(bytes32 indexed requestId, uint256 indexed value);

    bytes32 constant jobId = "7599d3c8f31e4ce78ad2b790cbcfc673"; // ARBITRUM

    constructor() ConfirmedOwner(msg.sender) {
        // ARBITRUM
        setChainlinkToken(0xf97f4df75117a78c1A5a0DBb814Af92458539FB4);
        setChainlinkOracle(0x78075387A6ef71FE0F036f22f1Dc6Ea68C9c3FA1);
    }

    function requestValue(
        string memory _url,
        int256 _multiply,
        string memory _path
    ) public onlyOwner returns (bytes32 requestId) {
        Chainlink.Request memory req = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfillValue.selector
        );
        req.add("get", _url);
        req.add("path", _path);
        req.addInt("multiply", _multiply);
        return sendChainlinkRequest(req, ORACLE_PAYMENT);
    }

    function fulfillValue(bytes32 _requestId, uint256 _value)
        public
        recordChainlinkFulfillment(_requestId)
    {
        emit RequestValue(_requestId, _value);
        value = _value;
    }
}
