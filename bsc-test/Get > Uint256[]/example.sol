//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

/**
 * @notice DO NOT USE THIS CODE IN PRODUCTION. This is an example contract.
 */
contract GetArray is ChainlinkClient {
    using Chainlink for Chainlink.Request;

    uint256[] public arrayOfNumbers;
    uint256 private constant ORACLE_PAYMENT =
        ((1 * LINK_DIVISIBILITY) / 100) * 5;

    string constant jobId = "a56c23c069b446a5bfd3b5fc91383991"; // BSC Test

    constructor() {
        // BSC Test
        setChainlinkToken(0x84b9B910527Ad5C03A9Ca831909E21e236EA7b06);
        setChainlinkOracle(0x4246103C6fF2e3eC839751156b518d066aab5e5A);
    }

    /**
     * @notice Request variable bytes from the oracle
     */
    function requestBytes(string memory _url, string memory _path) public {
        Chainlink.Request memory req = buildChainlinkRequest(
            stringToBytes32(jobId),
            address(this),
            this.fulfillArray.selector
        );
        req.add("get", _url);
        req.add("path", _path);
        sendOperatorRequest(req, ORACLE_PAYMENT);
    }

    event RequestFulfilled(bytes32 indexed requestId, uint256[] indexed data);

    function fulfillArray(bytes32 requestId, uint256[] memory _arrayOfNumbers)
        public
        recordChainlinkFulfillment(requestId)
    {
        emit RequestFulfilled(requestId, _arrayOfNumbers);
        arrayOfNumbers = _arrayOfNumbers;
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
