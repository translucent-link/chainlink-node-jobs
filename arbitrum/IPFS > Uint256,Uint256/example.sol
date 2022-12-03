// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

contract MultiVariableRequest is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    uint256 private constant ORACLE_PAYMENT = 100000000000000000;
    uint256 public val1;
    uint256 public val2;

    bytes32 constant jobId = "15a194f8577b4baf9c937f07cb65e33c";

    constructor() ConfirmedOwner(msg.sender) {
        // Arbitrum
        setChainlinkToken(0xf97f4df75117a78c1A5a0DBb814Af92458539FB4);
        setChainlinkOracle(0x78075387A6ef71FE0F036f22f1Dc6Ea68C9c3FA1);
    }

    function requestValues(
        string memory _cid,
        string memory _path1,
        string memory _path2,
        int256 _multiply1,
        int256 _multiply2
    ) public onlyOwner {
        Chainlink.Request memory req = buildChainlinkRequest(
            stringToBytes32(jobId),
            address(this),
            this.fulfillValues.selector
        );
        req.add("cid", _cid);
        req.add("path1", _path1);
        req.add("path2", _path2);
        req.addInt("multiply1", _multiply1);
        req.addInt("multiply2", _multiply2);
        sendOperatorRequest(req, ORACLE_PAYMENT);
    }

    event RequestFulfilledValues(
        bytes32 requestId,
        uint256 indexed val1,
        uint256 indexed val2
    );

    function fulfillValues(
        bytes32 requestId,
        uint256 _val1,
        uint256 _val2
    ) public recordChainlinkFulfillment(requestId) {
        emit RequestFulfilledValues(requestId, _val1, _val2);
        val1 = _val1;
        val2 = _val2;
    }
}
