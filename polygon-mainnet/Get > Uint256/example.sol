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

    uint256 private constant ORACLE_PAYMENT = (LINK_DIVISIBILITY / 10) * 1; // 0.1LINK

    uint256 public value;

    event RequestValue(bytes32 indexed requestId, uint256 indexed value);

    string constant jobId = "7599d3c8f31e4ce78ad2b790cbcfc673";

    constructor() ConfirmedOwner(msg.sender) {
        // POLYGON MAINNET
        setChainlinkToken(0xb0897686c545045aFc77CF20eC7A532E3120E0F1);
        setChainlinkOracle(0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434);
    }

    function requestValue(
        string memory _url,
        int256 _multiply,
        string memory _path
    ) public onlyOwner returns (bytes32 requestId) {
        Chainlink.Request memory req = buildChainlinkRequest(
            stringToBytes32(jobId),
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
