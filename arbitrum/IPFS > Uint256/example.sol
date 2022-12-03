// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

/**
 * @notice DO NOT USE THIS CODE IN PRODUCTION. This is an example contract.
 */
contract IpfsUint256 is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    uint256 private constant ORACLE_PAYMENT = 100000000000000000;
    uint256 public value;

    event RequestVal1ue(bytes32 indexed requestId, uint256 indexed value);

    bytes32 constant jobId = "4ef8208335f443ce9dc2829fe9215579";

    constructor() ConfirmedOwner(msg.sender) {
        // Arbitrum
        setChainlinkToken(0xf97f4df75117a78c1A5a0DBb814Af92458539FB4);
        setChainlinkOracle(0x78075387A6ef71FE0F036f22f1Dc6Ea68C9c3FA1);
    }

    function requestValue(
        string memory _cid,
        int256 _multiply,
        string memory _path
    ) public onlyOwner returns (bytes32 requestId) {
        Chainlink.Request memory req = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfillValue.selector
        );
        req.add("cid", _cid);
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
}
