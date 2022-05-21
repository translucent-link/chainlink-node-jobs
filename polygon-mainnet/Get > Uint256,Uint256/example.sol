// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

contract MultiVariableRequest is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    uint256 private constant ORACLE_PAYMENT = (LINK_DIVISIBILITY / 100) * 7; // 0.07LINK

    uint256 public val1;
    uint256 public val2;

    string constant jobId = "437d298d210c4fff935dcedb97ea8011";

    constructor() ConfirmedOwner(msg.sender) {
        // MUMBAI
        setChainlinkToken(0xb0897686c545045aFc77CF20eC7A532E3120E0F1);
        setChainlinkOracle(0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434);
    }

    function requestValues(
        string memory _url,
        string memory _path1,
        string memory _path2,
        int256 _multiply
    ) public onlyOwner {
        Chainlink.Request memory req = buildChainlinkRequest(
            stringToBytes32(jobId),
            address(this),
            this.fulfillValues.selector
        );
        req.add("get", _url);
        req.add("path1", _path1);
        req.add("path2", _path2);
        req.addInt("multiply", _multiply);
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

    function stringToBytes32(string memory source)
        private
        pure
        returns (bytes32 result)
    {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            // solhint-disable-line no-inline-assembly
            result := mload(add(source, 32))
        }
    }
}
