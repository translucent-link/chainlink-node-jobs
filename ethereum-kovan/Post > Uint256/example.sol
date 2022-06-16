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

    string constant jobId = "fc2ecbc2f58f45c4868d3959850df8c3";

    constructor() ConfirmedOwner(msg.sender) {
        // KOVAN
        setChainlinkToken(0xa36085F69e2889c224210F603D836748e7dC0088);
        setChainlinkOracle(0xf71775b3640D7034466e0321E35c5CFB78fd212F);
    }

    function requestValue() public onlyOwner returns (bytes32 requestId) {
        Chainlink.Request memory req = buildChainlinkRequest(
            stringToBytes32(jobId),
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
