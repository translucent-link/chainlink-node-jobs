# chainlink-node-jobs

Contains jobspecs, example client contracts and supporting documentation for all our public Chainlink jobs.

## Jobs
We currently make available the following public jobs:

### HTTP Jobs
* Get > Uint256 - retrieve uint256, e.g. fetch the current ETH price.
* Get > Uint256, Uint256 - retrieve two uint256, e.g. fetch the high and low price of the day
* Get > Bytes - retrieve a variable length string
* Post > Uint256 - send a payload to an API and retrieve a uint256
* Post > Bytes - send a payload to an API and retrieve a string
* Get > Bool - retrieve a boolean value
* Get > Uint256[] - retrieve a list of uint256, e.g. fetch a series of prices

### IPFS Jobs
The following jobs all retrieve a piece of JSON data from IPFS by specificying a cid (content identifier).
* IPFS > Uint256 - retrieve uint256, e.g. fetch the current ETH price.
* IPFS > Uint256, Uint256 - retrieve two uint256, e.g. fetch the high and low price of the day
* IPFS > Bytes - retrieve a variable length string
* IPFS > Bool - retrieve a boolean value

## Networks
Our public jobs are currently available on the following networks:

### Mainnets
* Ethernet Mainnet
* Polygon Mainnet
* Arbitrum Mainnet
* Optimism Mainnet

### Testnets
* Ethernet Goerli
* Arbitrum Goerli
