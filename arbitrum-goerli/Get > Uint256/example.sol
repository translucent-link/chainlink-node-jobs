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

    uint256 private constant ORACLE_PAYMENT = 0;
    uint256 public value;

    event RequestValue(bytes32 indexed requestId, uint256 indexed value);

    bytes32 constant jobId = "7599d3c8f31e4ce78ad2b790cbcfc673"; // ARBITRUM-RINKEBY

    constructor() ConfirmedOwner(msg.sender) {
        // ARBITRUM-RINKEBY
        setChainlinkToken(0x615fBe6372676474d9e6933d310469c9b68e9726);
        setChainlinkOracle(0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434);
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
