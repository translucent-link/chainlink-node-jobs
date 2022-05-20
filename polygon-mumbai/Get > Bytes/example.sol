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
    uint256 private constant ORACLE_PAYMENT =
        ((1 * LINK_DIVISIBILITY) / 100) * 5; // 0.05LINK

    string constant jobId = "490d815cbbb74a0db1d17e7aae3deb84"; // MUMBAI

    /**
     * @notice Initialize the link token and target oracle
     * @dev The oracle address must be an Operator contract for multiword response
     */
    constructor() {
        // MUMBAI
        setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
        setChainlinkOracle(0x1314E350Fc5a3896E2d66C43A83D9391E914a004);
    }

    /**
     * @notice Request variable bytes from the oracle
     */
    function requestBytes(string memory _url, string memory _path) public {
        Chainlink.Request memory req = buildChainlinkRequest(
            stringToBytes32(jobId),
            address(this),
            this.fulfillBytes.selector
        );
        req.add("get", _url);
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
