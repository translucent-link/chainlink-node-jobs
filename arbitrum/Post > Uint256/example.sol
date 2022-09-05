// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

/**
 * @notice DO NOT USE THIS CODE IN PRODUCTION. This is an example contract.
 */
contract PostUint256 is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    uint256 private constant ORACLE_PAYMENT =
        ((1 * LINK_DIVISIBILITY) / 100) * 5;
    uint256 public value;

    event RequestValue(bytes32 indexed requestId, uint256 indexed value);

    bytes32 constant jobId = "fc2ecbc2f58f45c4868d3959850df8c3";

    constructor() ConfirmedOwner(msg.sender) {
        // ABITRUM
        setChainlinkToken(0xf97f4df75117a78c1A5a0DBb814Af92458539FB4);
        setChainlinkOracle(0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434);
    }

    function requestValue() public onlyOwner returns (bytes32 requestId) {
        Chainlink.Request memory req = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfillValue.selector
        );
        req.add("post", "https://httpbin.org/post");
        req.add(
            "requestData",
            '{"email": "info@translucent.link", "anInteger": 2008}'
        );
        req.add("path", "json,anInteger");
        req.addInt("multiply", 100);
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
