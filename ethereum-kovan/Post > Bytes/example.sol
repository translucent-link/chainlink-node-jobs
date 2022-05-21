// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

/**
 * @notice DO NOT USE THIS CODE IN PRODUCTION. This is an example contract.
 */
contract PostBytes is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    uint256 private constant ORACLE_PAYMENT =
        ((1 * LINK_DIVISIBILITY) / 100) * 5;
    string public stringData;

    event RequestValue(bytes32 indexed requestId, bytes indexed value);

    string constant jobId = "15504b1312d5469fb92cabdc3d46c2ae";

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
        req.add("path", "json,email");
        return sendOperatorRequest(req, ORACLE_PAYMENT);
    }

    function fulfillValue(bytes32 _requestId, bytes memory _value)
        public
        recordChainlinkFulfillment(_requestId)
    {
        emit RequestValue(_requestId, _value);
        stringData = string(_value);
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
