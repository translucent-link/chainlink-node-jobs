// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

contract MultiVariableRequest is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    uint256 private constant ORACLE_PAYMENT = 0;
    uint256 public val1;
    uint256 public val2;

    bytes32 constant jobId = "15a194f8577b4baf9c937f07cb65e33c";

    constructor() ConfirmedOwner(msg.sender) {
        // ethereum-sepolia
        setChainlinkToken(0x779877A7B0D9E8603169DdbD7836e478b4624789);
        setChainlinkOracle(0x2362A262148518Ce69600Cc5a6032aC8391233f5);
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