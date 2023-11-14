import std/json

# creds.json is where your Matrix authentication is stored.
# to do: add auth token login and make my code actually work
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