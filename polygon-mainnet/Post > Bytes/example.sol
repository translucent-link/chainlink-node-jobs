// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

/**
 * @notice DO NOT USE THIS CODE IN PRODUCTION. This is an example contract.
 */
contract PostBytes is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    uint256 private constant ORACLE_PAYMENT = (LINK_DIVISIBILITY / 100) * 7; // 0.07LINK

    string public stringData;

    event RequestValue(bytes32 indexed requestId, bytes indexed value);

    string constant jobId = "15504b1312d5469fb92cabdc3d46c2ae";

    constructor() ConfirmedOwner(msg.sender) {
        // RINKEBY
        setChainlinkToken(0x01BE23585060835E02B77ef475b0Cc51aA1e0709);
        setChainlinkOracle(0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434);
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
