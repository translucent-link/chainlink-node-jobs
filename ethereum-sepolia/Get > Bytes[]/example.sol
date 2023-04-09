//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

/**
 * @notice DO NOT USE THIS CODE IN PRODUCTION. This is an example contract.
 */
contract GetArray is ChainlinkClient {
    using Chainlink for Chainlink.Request;

    bytes[] public arrayOfBytes;
    uint256 private constant ORACLE_PAYMENT = 0;

    bytes32 constant jobId = "b25b7d28184a4f4d8dd33009bbeda4e1";

    constructor() {
        // ethereum-sepolia
        setChainlinkToken(0x779877A7B0D9E8603169DdbD7836e478b4624789);
        setChainlinkOracle(0x2362A262148518Ce69600Cc5a6032aC8391233f5);
    }

    /**
     * @notice Request variable bytes[] from the oracle
     */
    function requestBytes(string memory _url, string memory _path) public {
        Chainlink.Request memory req = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfillArray.selector
        );
        req.add("get", _url);
        req.add("path", _path);
        sendOperatorRequest(req, ORACLE_PAYMENT);
    }

    event RequestFulfilled(bytes32 indexed requestId, bytes[] indexed data);

    function fulfillArray(
        bytes32 requestId,
        bytes[] memory _arrayOfBytes
    ) public recordChainlinkFulfillment(requestId) {
        emit RequestFulfilled(requestId, _arrayOfBytes);
        arrayOfBytes = _arrayOfBytes;
    }
}
