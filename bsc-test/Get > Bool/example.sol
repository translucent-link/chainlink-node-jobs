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

    uint256 private constant ORACLE_PAYMENT =
        ((1 * LINK_DIVISIBILITY) / 100) * 5;
    bool public value;

    event RequestValue(bytes32 indexed requestId, uint256 indexed value);

    string constant jobId = "a75ebb6e5a7b492fbfb67ab240100a95"; // BSC Test

    constructor() ConfirmedOwner(msg.sender) {
        // BSC Test
        setChainlinkToken(0x84b9B910527Ad5C03A9Ca831909E21e236EA7b06);
        setChainlinkOracle(0x4246103C6fF2e3eC839751156b518d066aab5e5A);
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
        return sendChainlinkRequest(req, ORACLE_PAYMENT);
    }

    function fulfillValue(bytes32 _requestId, bool _value)
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
