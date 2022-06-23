# chainlink-node-jobs

Contains jobspecs, example client contracts and supporting documentation for all our public Chainlink jobs.

## Jobs
We currently make available the following public jobs:

* Get > Uint256 - retrieve uint256, e.g. fetch the current ETH price.
* Get > Uint256, Uint256 - retrieve two uint256, e.g. fetch the high and low price of the day
* Get > Uint256[] - retrieve a list of uint256, e.g. fetch a series of prices
* Get > Bytes - retrieve a variable length string
* Post > Uint256 - send a payload to an API and retrieve a uint256
* Post > Bytes - send a payload to an API and retrieve a string

## Networks
Our public jobs are currently available on the following networks:

* Ethernet Rinkeby
* Ethernet Kovan
* Ethernet Goerli
* Polygon Mumbai
* Polygon Mainnet
* BSC Test
