// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

/**
 * @notice DO NOT USE THIS CODE IN PRODUCTION. This is an example contract.
 */
contract GetBool is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    uint256 private constant ORACLE_PAYMENT =
        ((1 * LINK_DIVISIBILITY) / 10) * 1;
    bool public value;

    event RequestValue(bytes32 indexed requestId, bool indexed value);

    bytes32 constant jobId = "a75ebb6e5a7b492fbfb67ab240100a95"; // POLYGON MAINNET

    constructor() ConfirmedOwner(msg.sender) {
        // POLYGON MAINNET
        setChainlinkToken(0xb0897686c545045aFc77CF20eC7A532E3120E0F1);
        setChainlinkOracle(0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434);
    }

    function requestValue(string memory _url, string memory _path)
        public
        onlyOwner
        returns (bytes32 requestId)
    {
        Chainlink.Request memory req = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfillValue.selector
        );
        req.add("get", _url);
        req.add("path", _path);
        return sendChainlinkRequest(req, ORACLE_PAYMENT);
    }

    function fulfillValue(bytes32 _requestId, bool _value)
        public
        recordChainlinkFulfillment(_requestId)
    {
        emit RequestValue(_requestId, _value);
        value = _value;
    }
}
