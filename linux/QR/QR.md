vim: nospell:

    $onGH/misc/linux; m4ps 0 1

commands here are generic, see also `$OSAB/QR.md`

    info info
    rhash -a --bsd <somefile>
    rhash --list-hashes => list names of all supported hashes
    rhash --sha256 <file>
    rhash --sha256 *  # to see if files are identical
    wcsf=$(wc -l <samplefile>); echo $wcsf

- Make (software)
- Pipe Viewer

# awesome wm
    modkey+left_mouse_drag = move
    modkey+right_mouse_drag = resize
    modkey+s = awful.hotkeys_popup

- maximized (horizontally or vertically) are indicated by (horizontal or vertical) double arrow, and break tiling
- on top clients are indicated by a caret

# bc
    an arbitrary precision calculator language
    bc -q

command: `scale=n  => results to n decimal places`

## limitations
- `^` only accepts integer powers
- can be inaccurate

# CopyQ
    copyq tab  # lists them
    ctrl+home -> move_to_top

# datetime
    strftime

## cal
    cal       " this month
    cal (command)
    cal -3    " last month, this, next
    cal -n 18 " all 18 months from now
    cal -w    " week numbers
    cal -y    " year

## date
    date '+%F %a %H:%M'
    date +%y%m%d-%H%M%S
    date +%j-%H%M
    date +%s; sleep 1; date +%s
    date +%Y%m%d
    date +%y%m%d-%H%M
    date -d @<unixTimeToConvert>
    date -R
    date -r <fileToGetDateOf>

date(1)

# Emacs
    ctrl-x > ctrl-c => quit
    emacs -mm &  # maximized
    emacs -nw  # in terminal

## view movements
    alt-v => scroll up
    ctrl-l => centre text in view
    ctrl-v => scroll down

# encoding
    gem env
    gem list
    gem update
    npm -g list
    npm -g up[date]
    npm config get prefix

# fcron
    fcrontab -l
    systemctl status fcron.service

# file manage
    cp -r <sourceDir> .
    fuseiso <ISO_image> <mountDirectory>
    ls -l
    mkdir -p  # --parents = make parent directories as needed (no error if existing)
    readlink <symlinkTarget>

- install(1)
- ls(1)
- rm(1)

## compressed
    7z x <pw'd_zip>
    tar -xvf tar.gz.tar

## Dolphin
    F4        -> Konsole  attached below
    Shift+F4  -> Konsole  in a new window

## grepping
    grep -P '[\p{Devanagari}]' **/*.md  # finds Devanagari characters

GNU Grep Manual

## investigations
    diff -qrN dir1/ dir2/
    echo `find . -type d | wc -l`-1 | bc  # counts all subdirectories

### file counts
    isutf8 **/* | wc -l  # non UTF-8 files (fails when too many)
    ls **/* | wc -l      # all of the files

### find
    find $PWD -name <file>  # gets full path
    find . -maxdepth 1 -mindepth 1 -type f -name "*"  # those in working directory
    find . -name "*" -type f ! -path '*/.git/*'
    find . -name '*.txt' ! -name 'build*'  # excluding build*
    find . -newer oldFile
    find . -path 'exclude*these*paths' -prune -o -name '<filename>' -print
    find . -type f -exec du -h {} + | sort -r -h > sizes.txt
    find . -type l -ls  # list all symlinks in a directory tree

find(1)

### sizes
    diskonaut -h
    du -sh  # size of current directory
    du --max-depth=1 -h <directory>
    dust  # graphical size representation

#### listed
    du -ah . | grep -v "/$" | sort -rh | head -44  # recursive list of largest 44 files
    du -h --max-depth=1  # for a quick list of folder sizes
    du -sh  # gets size of current directory
    du -sh <glob>
    ls -1Rhs | sed -e "s/^ *//" | grep "^[0-9]" | sort -hr | head -n50  # neat recursive list of largest

du(1)

#### ncdu
    ? -> help
    g -> rotate through % graph none
    n -> order by name
    s -> order by size

### stat
    stat -c '%a %n' *  # show octal permissions

stat(1)

### tree
    tree -d [-L n]  # directories only, do depth n
    tree -f
    tree -fi

tree(1)

## rm with Pipe Viewer
1. `find <directory> | wc -l  # gets the <filecount>`
2. `sudo rm -rv <directory> | pv -l -s <filecount> > /dev/null  # shows progress for rm`

## rsnapshot
    ncdu --exclude *rsnapshot
    rsnapshot configtest
    sudo rsnapshot du  # can takes many hours...
    systemctl list-unit-files | grep rsnapshot

/usr/bin/rsnapshot sync: completed successfully

## rsync
    output info

- log: `>  = the item is received`
- rsync: `-l  = --links  = copy symlinks as symlinks`

## symlinks
    [[ -L $s ]] && echo 'symlink exists'
    readlink $s  # returns target

# get at root on tty2
    Ctrl+Alt+F2 > root + pw

# GNU Privacy Guard
    echo "...seems to be working..." | gpg -ase -r jo | gpg  # tests key ( makes empty file secret.out)
    gpg --full-gen-key

fingerprint: `xxxx xxxx xxxx xxxx xxxx  xxxx xxxx xxxx xxxx xxxx`

## keybox
    gpg --delete-key <anID>
    gpg --import my_private_key.asc
    gpg --import my_public_key.asc
    gpg -ao private.asc --export-secret-keys jh
    kbxutil ~/.gnupg/pubring.kbx | moar  # for a more detailed exploration

# imagey
    colorpicker --one-shot --preview
    for i in *.bmp; do convert $i ${i%.*}.jpg; done
    for i in *.jpeg; do convert $i jpg/${i%.*}.jpg; done  # gets them into subfolder jpg
    gphoto2 --auto-detect  # list detected cameras
    gphoto2 -DR  # delete all files in all folders
    gphoto2 -l  # list folders
    gphoto2 -L  # list files
    gphoto2 -P  # get all files
    gpicview  # opens first image in directory (no thumbnails)
    exiftool <image>
    exiftool -Orientation *
    exiv2 <image>

## feh
    feh -F  # fullscreen
    feh -l  # list image specifications

- can open `webp`
- can't animate a `gif`

### in-image
    d => toggle_filenames

#### size
```
* => 100%
/ => fit the window size
up/down => zoom in/out
```

## nomacs
    ctrl+k => keyboard Shortcuts
    ctrl+r => resize
    ctrl+Shift+p > Close on ESC

- can only fill page for printing
- can't open `webp`

### keybindings
    alt+m => Metadata Info
    ctrl+s => save dialogue
    f => toggles selected panes
    F1 => credits
    F10 => frameless
    m => useful Exif info, it it's there

#### Alt
    Alt A > Exposure > Gamma
    Alt A > Tiny Planet

#### not having cropped
    Ctrl+w => next tab
    Ctrl+w => close tab

#### panels
    f => hide all
    i => File Info Panel
    mouse right-click to find them

## Pinta
- can't send to printer...
- shows precise cursor position in pixels

## pqiv
    pqiv -i <animateGif> &  # opens the animated gif without the obtrusive info box
    pqiv --auto-montage-mode * &  # flat recursive view of all imagies

pqiv(1)

### commands
    esc/q => quit
    f => toggle full screen
    i => toggle info box
    s => toggle slideshow

#### montage mode
    g => goto
    m => montage mode

#### navigating
    mouse
    backspace/space => previous/next

## scanimage
    scanimage -A  => --all-options => lists all available options
    scanimage -h
    scanimage -L  => --list-devices

## [n]sxiv
- can't animate a gif
- can't send to printer
- Simple X Image Viewer

### commands
    b => toggle infobar
    q => quit
    Return => toggle thumbnails/image

## Vimiv
    O => switch focus
    o => toggle the library
    w => write changes

    vimiv &

can't open a gif

### tagged file list manipulation
    :tag_remove tagname
    :tag_write tagname
    cat ~/.local/share/vimiv/Tags/tagname | while read i; do mv $i .; done
    rm -r ~/.local/share/vimiv/Tags/tagname

### thumbnails
    +/- => size
    t => toggle

# lsof
    [sudo] lsof -i

list open files

# multimedia
    ffprobe -i <avfile> -show_format -v quiet | sed -n 's/duration=//p'  # fractional seconds

## audio
    pavucontrol

### convert
    for f in *.flac; do ffmhb -i "$f" -c:a libvorbis -aq 4 "${f%.*}.ogg" ; done
    for f in *.oma; do ffmhb -i "$f" -c:a libvorbis "${f%.*}.ogg" ; done  # default VBR quality 3
    for f in *; do ffmhb -i "$f" -b:a 128K -vn "${f%.*}.mp3" ; done

### cmus
    cmus_notify -h

- C* Music Player
- can't play oma's omv's

#### commands
    ,        seek -1m
    .        seek +1m
    7        settings
    ^C       echo Type :quit<enter> to exit cmus.
    ^L       refresh
    ^R       toggle repeat_current
    space    win-toggle => mark
    C        toggle continue
    P        win-mv-before
    b        player-next
    e        win-add-q
    h, left  seek -5
    l, right seek +5
    p        win-mv-after
    r        toggle repeat
    v        player-stop
    z        player-prev

### gst123
    gst123 -Z .  # play random audio files recursively forever

#### control
    left/right -> seek 10 seconds
    down/up -> seek 1 minute
    PgDn/Up -> seek 10 minute
    space -> toggle pause
    +/- -> change volume by 10%
    m -> toggle mute
    n -> next file
    q -> quit
    ? -> help

### libpulse
    pacat --list-file-formats
    pactl list sinks short
    pactl list sources short
    pactl set-sink-volume 0 60%  # master volume to reasonable level
    parecord -d 0 a.flac

### SoX
    rec -c 2 a.flac  # record in stereo
    soxi <audioFile>  # info, including duration

## mediainfo
    mediainfo <avfile> | grep Encoded
    mediainfo --Inform='Video;%FrameCount%' $the_file
    mediainfo --Output='General;%Duration%' <avfile>  # milliseconds

## mpv
    mpv av://v4l2:/dev/video0
    mpv --start=-2 <avfile>  # starts 2 seconds from end

can play omv's

### interactive control
    ./,      => framewise steps forward/backward
    A        => cycle aspect ratio
    alt+0    => halve video window size
    alt+1    => full video window size
    alt+2    => double video window size
    ctrl +/- => +/-100 ms audio delay
    f        => toggle fullscreen
    hash     => cycle audio tracks
    i/I      => statistics (doesn't include date)
    o/O      => show progress
    s        => screenshot
    v        => toggle subtitle
    j/J      => cycle subtitles tracks

#### playback speed
    BACKSPACE -> reset
    [ and ] -> decrease/increase by 10%
    { and } -> halve/double

#### seeks
    one frame   ./,
    1 seconds   shift left/right
    5 seconds   left/right (or shift up/down)
    10 seconds  mouse wheel up/down
    1 minute    up/down
    10 minutes  shift+pgup/pgdwn

#### volume
- `/` `9` decrease
- `*` `0` increase

# networking
    bluetoothctl -- devices
    sudo iptraf-ng  # ncurses network statistic monitoring utility
    sudo lshw -c network
    sudo lsof -i -P -n | grep LISTEN  # to see the listening ports

## devices
    ip link
    networkctl list

## email
    neomutt -v
    notmuch search '"the Pennines"' # finds exactly that
    notmuch search tag:attachment | wc -l
    notmuch search tag:fm | wc -l
    notmuch search tag:gmail | wc -l
    notmuch search tag:trohib | wc -l
    thunderbird -addressbook

### firewall
    sudo iptables -L

#### Firewalld
    sudo firewall-config
    sudo systemctl start firewalld
    sudo systemctl stop firewalld
    sudo systemctl status firewalld
    sudo systemctl restart firewalld

##### firewall-cmd
    sudo firewall-cmd --info-zone=home
    sudo firewall-cmd --info-zone=public
    sudo firewall-cmd --panic-on
    sudo firewall-cmd --state

#### iptables
    sudo iptables -nvL
    sudo systemctl status iptables.service

### hostname
    hostname
    hostnamectl
    uname -n  # hostname

### ip
    ip a  # ip address show
    ip l  # lists ethernet devices
    ip r  # ip route show - compactly shows my internal ip address

### iwd
    man iwd
    sudo ls /var/lib/iwd
    systemctl status iwd.service

#### iwctl
    man iwctl
    iwctl device list  # shows MAC address
    iwctl known-networks list
    iwctl station wlan0 get-networks  # shows if  wlan0  is connected to one

requires a `DHCP` client to get an IP address

### NetworkManager
    nmcli device  # list of networking devices
    nmcli device wifi list | cat  # paged list of SSIDs, with those IN-USE starred
    nmcli device wifi connect <SSID> password <password>

#### saved connections
    nmcli connection delete <SSID>  # can help
    nmcli connection show | cat  # reports UUIDs and colourizes the active device
    nmcli connection up uuid <UUID>

### NordVPN
    nordvpn cities United_Kingdom
    nordvpn cities United_States
    nordvpn countries
    nordvpn rate x  # 1 (poor) to 5 (excellent)
    nordvpn set technology nordlynx
    nordvpn settings
    nordvpn status
    pgrep nordvpn
    sudo pkill -9 -f nordvpn  # doesn't logout

#### account
    nordvpn connect UK
    nordvpn connect US
    nordvpn disconnect
    nordvpn login
    nordvpn logout
    nordvpn rate 5
    nordvpn status | xcol United

### ss
    bm ss
    ss --tcp --listening
    ss -tulw  # listening on TCP, UDP, RAW sockets

### ssh
    $HOME/.ssh/authorized_keys
    ssh localhost
    sudo systemctl restart sshd.service
    sudo systemctl status sshd.service

#### session commands
    ~? => supported escape sequences

##### exit
    exit
    ~.

# one-line of command output
    echo $(ls)
    ls | xargs
    xargs < <file>  # cat alternative

# pass
    pass
    pass help
    pass init
    pass ls

pass(1)

# PDFs
    Outline = the hyperref bookmarks that correspond to headings of a LaTeX document

`Firefox` shows `Document Outline`

## C5 printing
- `Firefox` can't figure it's portrait
- `LibreOffice Writer` gets it right
- Ubuntu's `qpdfview` gets it almost right

## pdftk
    pdftk in.pdf burst  # breaks into individual pages
    pdftk in*.pdf cat output out.pdf  # concatenate a sequence of PDFs
    pdftk secure.pdf input_pw <password> output normal.pdf

### fix rotations
    pdftk leftRotated.pdf cat 1-endeast output horizontal.pdf
    pdftk leftRotated-rightRotated.pdf cat 1east 2west output horizontal.pdf

## qpdfview
    F6 = View > Docks > Outline (such as the headings of a LaTeX document)
    F8 = Thumnails

## sizes
    pdfinfo <a_pdf_file>  # A5 = 420x595. See GSview for more sizes.

1 PostScript point = 0.3528 mm

## XpdfReader
    [-f <firstPage>] [-l <lastPage>]
    pdfimages -h
    pdfimages -png pdfNam3.pdf pngName  # pulls out images separated (if there are any)
    pdftoppm -png -r 300 <pdf> <basename_for_ppm_sequence>
    pdftoppm -jpg -r 300 <pdf> <basename_for_ppm_sequence>

## Zathura
    <tab> => toggles Outline view
    +/-/= => zoom in/out/original
    r     => rotate by 90 degrees
    R     => reload document

zathura man page

# processes
    lsof -i
    niceness: -19 = lowest priority, 20 = highest
    sudo iotop -o
    xprop  # WM_CLASS(STRING) = "instance", "class"

## kill
    kill -9 **<tab>  # fzf
    pkill zoom

## list
    ps -efjH
    pstree

## pgrep
    bm pgrep
    pgrep <aprogram>  # reports it's process id

# sed
    [[:alpha:]] = [[:lower:]] + [[:upper:]] = [A-Za-z]
    sed --version

- replace a string in multiple files
- stream editor

## make changes
    echo "don't forget that" | sed 's/\x27/\"/'
    sed -i '0~2 a\\' <fileToAddBlankLineAfterEach2ndLine>
    sed -i '/<regex>/!d' <filetoreduce>  # removes lines that don't match
    sed -i '1,2d' <file_to_remove_first_two_lines_from>
    sed -i '1s/^/vim: ft=<filetype>:\n\n/' $cslF
    sed G <file>  # outputs <file> with blank lines added
    sed '1i\\newFirstLineText' <fileToPrependTo>

## show file contents
    sed '/pattern/q' <file>  # cat's  <file>  until  pattern
    sed 5q <file> print first 5 lines
    sed -e '' <file>  # mimics cat
    sed -n '/<regex>/p' <file>  # prints only the matching lines
    sed -n '2,$p' <file>  # prints from the 2nd line

# shell
- `dc` desk calculator (reverse-Polish)
- `echo $SHELL` reveals flavour
- `fc` "fix command"

## Bash
    /etc/profile
    <somecommand> | xcol <keyword1> <keyword2> ... # for highlighting
    bash --version
    echo "$floatingpointnumber-$another" | bc  # FP math
    echo "$PS1"
    echo $PWD
    echo $SHELL
    echo $?  # 0 if command succeeded
    env | grep SHELL
    exit 0  # to quit script
    printf command
    read -p "hit Enter"
    scriptDir=$(dirname "${BASH_SOURCE[0]}")
    shopt
    shopt dotglob  # reports back its status
    shopt -u nullglob  # incase  t=$'\?'; echo $t
    xdg-open $cITh/unix-like/linux/bash.pdf
    ~/Arch/bash_history

command substitution `$(...)`

### aliases
    alias
    compgen -A alias | awk '{print}' ORS=' : '  # compact list
    unalias

### conditionals
    [ "$a" ] && echo $a
    [ -z "$a" ] && echo zero_string; [ -n "$a" ] && echo string
    [ true ] && echo y
    c=1; [[ $c == 1 ]] && echo "true"
    if <condition1>; then <action1>; elif <condition2>; then <action2>; fi

### file manage
    for f in *; do mv $f ${f:2}; done
    man -h ls
    mkdir -p <aDirectoryPath>  # won't overwrite if it already exists
    pushd ~/some_path; pushd /another_path; popd; popd

#### tests
    [ -d "$d" ] && echo "directory $d is there"
    [ -s "nohup.out" ] && echo non-zero file size
    [[ -d "$d" && ! -L "$d" ]] && echo "It's a directory and not a symbolic link"
    rm a b; touch a; sleep 1; touch b; ls -t; [ a -ot b ] && echo older

### functions
    "$@" = "$1" "$2" ...
    export -f <usefulfunction>  # allows it to be used in a script
    unset -f <function>

#### lists
    compgen -A function | awk '{print}' ORS=' : '
    declare -F  # lists all declare -f possibilities

#### show code
    declare -f <function_name>  # shows its contents
    type <function_name>

### job control
    ctrl+c
    fg %n
    jobs -l  # then  kill %n

jobs(1p)

### Login shell?
    echo $0  # "-bash" = login shell, "bash" = non-login shell
    shopt login_shell

### loops
    for f in **/*; do echo $f; done
    for i in {0..9..2}; do echo $i; done

### managing commands
    echo $?  # exit code of last command
    eval $Command
    vi mode: v  => edit a command in $EDITOR

#### execute last command
    !!
    sudo !!

#### redirecting
```
<somecommand> 2>&1 | tee stdout+stderr.log
<somecommand> > /dev/null 2>&1
```

##### key
    1 = stdout file descriptor
    2 = stderr file descriptor
    >& = redirect to a file descriptor
    1>&2 = 2>&1

### set
    echo $-  # current options
    set -e  # terminate on a fail
    set -v  # show code lines as they're used
    set -x : show commands and arguments

#### unset
    var1=1; var2=2
    echo $var1 $var2
    unset var1 var2

### sudo
    su -  # login shell

substitute user identity

### trap
    trap - debug  # turn off debug
    trap read debug  # puts a read request after each executable line

### variables
    $undefined && echo 'Eh! $undefined true!'
    (( $1 == 1 || $1 == 2 )) && echo "number 1 or 2"
    empty=''; [[ -z $empty ]] && echo empty
    export  # lists environment variables
    if (( ! $n == 1 )); then echo 'not 1'; fi
    set  # lists all variables

#### arrays
    array=(element1 element2 element3)
    echo ${#array[@]}  # length
    firstElement=${array[0]}
    mapfile -t GreekArray < <(printf "Alpha\nBeta\nGamma"); echo ${GreekArray[@]}

don't export them

##### list
    echo ${array[@]}
    for item in "${array[@]}"; do echo "$item"; done

#### integers
    i=0; echo $((i+=1))

##### comparison
    if [ "$a" -ge "$b" ]
    if [ "$a" -gt "$b" ]
    if [ "$a" -le "$b" ]
    if [ "$a" -lt "$b" ]
    if [ "$a" -ne "$b" ]

#### strings
    [[ $t =~ (y|n) ]] && echo 'good answer'
    o lkj | rev | cut -c 2- | rev
    o ljk | sed 's/.$//'
    qs=$'quote\'*star'; o "$qs"
    s=12345; echo $s | awk '{print substr($1,length($1)-2) }'
    s=12345; echo $s | cut -c $((${#s}-2))-

case conversions: `var=vAlUe; o ${var^^}; o "${var,,}"`

##### parameter expansion
    file=a.b.c; echo ${file##*.}; echo ${file%.*}

    ${string/substring/firstMatchReplacement}
    ${string//substring/allMatchesReplacement}
    ${string/#substringAtStart/replacement}
    ${string/%substringAtEnd/replacement}
    ${string:position:length}

    a=12345; a=${a:2}; echo $a
    b="a(b(c(d"; o ${b##*\(}
    t=lkj; echo ${t:0:${#t}-1}

    name=polish.ostrich.racing.champion; o ${name#*.}; o ${name##*.}; o ${name%%.*}; o ${name%.*}

# sound
    pactl set-sink-mute 0 toggle
    pulsemixer

## ALSA
    alsamixer -V all
    speaker-test -c 2
    sudo alsactl store

# system
    cat /etc/hostname
    clamscan -r  # shows Loading & Compiling
    clamscan -r 2>&1 | tee clamscan.log
    gtk-launch --version
    halt -p
    i hier  # detailed description of the filesystem hierarchy
    notify-send -u critical "test of critical notification"
    notify-send -t 5000 -u low "Hello World"
    openbox --reconfigure
    passwd jo  # then re-login
    ps $(pgrep Xorg)  # shows which tty X is on
    swapon --show
    uname -a  # unix name, includes linux version number
    w  # list users and load on system
    whereis <executable>
    xset q  # shows a variety of IO settings

- lsmod(8) show what kernel modules are currently loaded
- maximum 255 bytes per filename & 4096 per path

## CPU-X
    cpu-x -h
    cpu-x -N
    Openbox Menu > System > CPU-X

## directory sizes as root
    du -shx
    ncdu -x

## Dunst
    dunstctl close-all
    dunstctl history-pop
    dunstify -u critical "Read this now!"

## groups
    /etc/group  # to see them all
    gpasswd [-a <user> <group_to_add_to>]
    groups jo
    sudo groupadd <group_to_create>
    sudo groupdel <group_to_delete>

## monitoring
    glances
    gtop
    htop
    last reboot
    saidar -c

## systemd
    systemctl halt
    systemctl reboot
    systemctl suspend

### info
    systemctl  # list running Systemd units
    systemctl --failed
    systemctl --no-pager
    systemctl is-enabled <service>
    systemctl list-timers
    systemctl list-unit-files
    systemd-analyze blame  # time taken for boot processes

## users
    id -u
    su -
    who  # lists users active on terminals
    whoami

# term
    Ctrl+s  pause output to screen
    Ctrl+q  resume output to screen
    sudo fgconsole
    tput colors

tput(1)

## terminal line settings
    stty - a

### flow control
    [-]ixon = the setting
    ctrl-q = XON
    ctrl-s = XOFF

## size
    stty size  # lines columns

### set (not in tmux)
    printf '\033[8;40;100t'
    resize -s 90 150

## tmux
    bind  --> alias for  bind-key
    C-a z --> toggle zoom
    C-a < --> display-menu
    C-a > --> display-menu
    if [ $TERM == 'screen-256color' ]; then echo "you're in tmux"; fi
    pgrep tmux -l
    set synchronize-panes
    tmux kill-server
    tmux kill-session -a  # kills all but current session
    tmux send ls enter  # ls  in the currently active pane
    tmux show-options -s

### buffers
    C-a ]     --> paste-buffer -p
    C-a # --> list-buffers
    C-a = --> choose-buffer -Z

### copy mode
    C-a [     --> copy-mode
    C-a e --> easycopy
    C-a P (C-p) --> quickopen (abspath, URL)
    Enter --> quits
    Pg Up/Dn
    S --> copytk mode
    s --> easymotion

#### copytk mode
    j --> easymotion forward
    k --> easymotion backward
    n --> easymotion lines
    s --> easymotion

### panes
    C-a q     --> display-panes
    C-a { / } --> swap-pane -U / -D
    C-a Space --> next-layout (of 5 defaults)
    :join-pane -s 2 -t 1  # move w2 as a pane to w1

### sessions
    :choose-tree -> put a pane into tree mode, can kill and select

    tmux a                  # attach
    tmux a -t myname        # attach to session myname
    tmux detach
    tmux kill-server; tmux  # good for resetting
    tmux ls                 # list sessions
    tmux lsk -Na            # includes my rebinds

## urxvt
    urxvt --help

- `$TERM` is set to `rxvt-unicode-256color`
- `rxvt-unicode`
- `URxvt.url-launcher`

# tr
    tr '\n' ' ' < <in> [> <out>]  # replace newlines with spaces

tr (Unix)

# vim
    $HOME/.viminfo
    find . -type f -name tags
    e -la /usr/bin/vim
    file "$(command -v vim)"

# windows
    xrdb -query -all  # shows loaded X resources

awesomewm: floating window: `winkey+left_mouse_drag`

## Plasma
    Ctrl+Alt+Shift+Del -> exit KDE without saving
    Ctrl+Alt+Del       -> logout screen
    Ctrl+Alt+T         -> Konsole
    Win+PageUp/Down    -> maximises or returns to normal a window

