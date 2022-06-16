# Post > Bytes

This job retrieves a variable-length string after posting to an internet-facing JSON API.

## Contract Address & JobID
  
Contract: [0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434](https://mumbai.polygonscan.com/address/0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434)

JobID: 15504b1312d5469fb92cabdc3d46c2ae

## Parameters

The job requires the following parameters to be specified:

* `post` - internet-facing URL to post the `requestData` to
* `requestData` - the JSON-string payload that will be sent to the URL
* `path` - comma-separated JSON path used to extract the string value

Note: use commas not dots for JSON paths.

## Price

0.07 LINK

## Example

If you set the following parameters

* post : https://httpbin.org/post
* requestData: `"{\"email\": \"info@translucent.link\", \"anInteger\": 2008}"`
* path : json,email

Note: use commas not dots for JSON paths.

You will receive a JSON response that may look like this:

    {
        "args": {},
        "data": "{\"email\": \"info@translucent.link\", \"anInteger\": 2008}",
        "files": {},
        "form": {},
        "headers": {
            "Accept": "*/*",
            "Accept-Encoding": "gzip, deflate, br",
            "Content-Length": "53",
            "Content-Type": "text/plain",
            "Host": "httpbin.org",
            "Postman-Token": "fd36b43e-fc40-45c9-8050-2c01d8b03d09",
            "User-Agent": "PostmanRuntime/7.29.0",
            "X-Amzn-Trace-Id": "Root=1-6288c9cd-42ae35b57cab267656b82236"
        },
        "json": {
            "anInteger": 2008,
            "email": "info@translucent.link"
        },
        "origin": "84.71.9.112",
        "url": "https://httpbin.org/post"
    }

The job populated with the example parameters above would return with: `info@translucent.link`

See [example.sol](example.sol) for an example client contract.

## Troubleshooting

1. Please make sure you load your client contract, e.g. example.sol, with enough LINK, otherwise you'll get a "Gas estimation failed" error.
2. The contract address and jobId mentioned above are specific to the network and won't work on other networks.
3. Please find us in our [Discord](https://discord.gg/JxKT6R9Xpz) if you're stuck and needing help. 
