// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

/**
 * @notice DO NOT USE THIS CODE IN PRODUCTION. This is an example contract.
 */
contract IpfsBool is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    uint256 private constant ORACLE_PAYMENT = 0;
    bool public value;

    event RequestValue(bytes32 indexed requestId, bool indexed value);

    bytes32 constant jobId = "cb8fb6d6a55243838424d91b412daf61";

    constructor() ConfirmedOwner(msg.sender) {
        // Goerli
        setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
        setChainlinkOracle(0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434);
    }

    function requestValue(string memory _cid, string memory _path)
        public
        onlyOwner
        returns (bytes32 requestId)
    {
        Chainlink.Request memory req = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfillValue.selector
        );
        req.add("cid", _cid);
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
}
