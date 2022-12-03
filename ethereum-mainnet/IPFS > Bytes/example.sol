//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

/**
 * @notice DO NOT USE THIS CODE IN PRODUCTION. This is an example contract.
 */
contract GenericLargeResponse is ChainlinkClient {
    using Chainlink for Chainlink.Request;

    // variable bytes returned in a single oracle response
    bytes public data;
    string public stringData;
    uint256 private constant ORACLE_PAYMENT = 1360000000000000000; // 1.36 LINK

    bytes32 constant jobId = "451e324825544887b9f0eedc171d4423";

    /**
     * @notice Initialize the link token and target oracle
     * @dev The oracle address must be an Operator contract for multiword response
     */
    constructor() {
        // Ethereum
        setChainlinkToken(0x514910771AF9Ca656af840dff83E8264EcF986CA);
        setChainlinkOracle(0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434);
    }

    /**
     * @notice Request variable bytes from the oracle
     */
    function requestBytes(string memory _cid, string memory _path) public {
        Chainlink.Request memory req = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfillBytes.selector
        );
        req.add("cid", _cid);
        req.add("path", _path);
        sendOperatorRequest(req, ORACLE_PAYMENT);
    }

    event RequestFulfilled(bytes32 indexed requestId, bytes indexed data);

    /**
     * @notice Fulfillment function for variable bytes
     * @dev This is called by the oracle. recordChainlinkFulfillment must be used.
     */
    function fulfillBytes(bytes32 requestId, bytes memory bytesData)
        public
        recordChainlinkFulfillment(requestId)
    {
        emit RequestFulfilled(requestId, bytesData);
        data = bytesData;
        stringData = string(data);
    }
}
