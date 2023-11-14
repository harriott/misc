vim: nospell:

    $misc/CrossPlatform/QR; m4ps 0 1

    curl ifconfig.co/city
    curl ifconfig.co/country
    ssh-keygen -lv -f ssh_host_rsa_key.pub  # shows fingerprint & ASCII art

- GPS Coordinates <https://www.gps-coordinates.net>
- Webmasters

# browsing
    $CrPl/networking/browsers/browsers.txt
    carbonyl http://harriott.github.io

# email
trashinbox

## Thunderbird
    $CrPl/networking/Thunderbird/builds.txt
    PS> C:\MozillaThunderbird\thunderbird.exe -addressbook
    thunderbird -addressbook

`$DJH/TP-default-release/compatibility.ini` for LastVersion

### internal commands
    alt+e > e (= Settings) > Config Editor... (= Advanced Preferences)
    ctrl+Shft+B (= Address Book)
    Menu > File > Compact Folders
    right-click on folder > Properties > Repair Folder

#### Keyboard Shortcuts
- `ctrl+r`  **R**eply (to sender only)
- `ctrl+shft+b`  Address **B**ook (like Bookmarks in Firefox)
- `ctrl+shft+f`  **F**ind in folder
- `ctrl+u`  view email source
- `m` toggles message read/unread
- `(Shift+)j`  (not) junk
- `s` toggles starring
- `f`/`p` goes to next/previous message

mozillamessaging

#### Tools
    alt+t > a (= Add-ons Manager)
    alt+t > e (= Edit) > a a (= Account Settings)
    alt+t > Manually sort folders

#### View
    alt+v > s (= Sort by) > h (= Unthreaded)

##### body
    b (= Message Body As) >
      h (= Original HTML)
      p (= Plain Text)  - can then export & Delete inline images

### run safely
    $OSAB/jo/wm/TS/thunderbird_safely.sh
    $machine\T91\runSafely.ps1

### tbkeys-lite Main key bindings
    j: cmd:cmd_nextMsg
    k: cmd:cmd_previousMsg
    o: cmd:cmd_openMessage
    f: cmd:cmd_forward
    #: cmd:cmd_delete
    r: cmd:cmd_reply
    a: cmd:cmd_replyall
    x: cmd:cmd_archive
    c: func:MsgNewMessage
    u: tbkeys:closeMessageAndRefresh

### To
    jharr@ftml.net, trohib@gmail.com
    <jharr@ftml.net>, <trohib@gmail.com>
    Joseph HARRIOTT <jharr@ftml.net>, Joseph HARRIOTT <trohib@gmail.com>

# GitHub
    gh config list
    git diff upstream/master...HEAD

`~/.ssh/known_hosts`: `AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa`

# radio-active
    pkill radio; radio -K  # quit & kill instances
    radio --last  # run playing last station
    radio --list  # list favourites
    radio --remove  # launch favourite removal dialog
    radio -S bbc  # search for BBC stations
    radio -S fip

## in-player commands
- `f` = add to favourites
- `q`, `ctrl+c` = quit
- `t` = track info

# WhatsApp group members
    Firefox > Inspect (Q) > Copy > Inner HTML
    Google Chrome > right-click > Inspect > ...

# wttr.in
    curl wttr.in/London
    curl wttr.in/Newcastle

# YouTube
file formats

## shortcuts
- `0 .. 9`  jump 0% .. 90%
- `c`  toggle captions
- `f`  toggle full screen
- `j/l`  seek 10s backwards or forwards
- `m`  toggle mute
- `when paused: ./,`  skip to next/previous frame

Keyboard shortcuts for YouTube

# yt-dlp
    i yt-dlp
    yt-dlp -F <videoURL>
    yt-dlp -f "[height<=?720]" <videoURL>
    yt-dlp -f best <videoURL>
    yt-dlp -f ba <videoURL>  # bestaudio (= best*[vcodec=none])
    yt-dlp --version

