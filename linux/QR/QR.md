vim: nospell:

    $misc/linux/QR; m4ps 0 1

commands here are generic, except for those under the Ubuntu heading, see also `$OSAB/QR.md`

    dotnet --list-runtimes
    dotnet --list-sdks
    info info
    wcsf=$(wc -l <samplefile>); echo $wcsf
    $ITscr/unix-like/usr_lib_X11_rgb.txt  # colours
    $misc/GRs/DCGRs.sh
    $OSL/bashrc-generic

Pipe Viewer

# audio - ALSA
    alsamixer -V all
    speaker-test -c 2
    sudo alsactl store

# audio - cmus
    cmus_notify -h

C* Music Player

## commands
    7        settings

    ^c       echo Type :quit<enter> to exit cmus.
    ^l       refresh
    space    win-toggle => mark
    e        win-add-q

    P        win-mv-before
    p        win-mv-after

    b        player-next
    x        player-play (from start)
    v        player-stop
    z        player-prev

    h, left  seek -5s
    l, right seek +5s
    ,        seek -1m
    .        seek +1m

    ^r       toggle repeat_current
    C        toggle continue
    r        toggle repeat

    -        vol -10%
    + =      vol +10%

## media
- can play: `mka`, `ogg`, `opus`, `wma`
- can't play: `oma`, `omv`, `rmj`

# audio - convert
    for f in *.flac; do ffi "$f" -c:a libvorbis -aq 4 "${f%.*}.ogg" ; done
    for f in *.oma; do ffi "$f" -c:a libvorbis "${f%.*}.ogg" ; done  # default VBR quality 3
    for f in *.rmj; do ffi "$f" -c:a libvorbis -aq 4 "${f%.*}.ogg" ; done
    for f in *.wav; do ffi "$f" -c:a libvorbis -aq 4 "${f%.*}.ogg"; rm "$f"; done
    for f in *; do ffi "$f" -b:a 128K -vn "${f%.*}.mp3" ; done

# audio - gst123
    gst123 -Z .  # play random audio files recursively forever

## control
    left/right -> seek 10 seconds
    down/up -> seek 1 minute
    PgDn/Up -> seek 10 minute
    space -> toggle pause
    +/- -> change volume by 10%
    m -> toggle mute
    n -> next file
    q -> quit
    ? -> help

# audio - MPD
    mpd
    mpd --kill
    pgrep mpd

Music Player Daemon

## vimpc - normal mode
- `-`/`+` decrease/increase volume
- `ZZ` quits completely
- `space` start/stop
- `backspace`/`s` stop playlist

### song
- `f`/`F` scroll to current song
- `E` toggle repeat
- `I` restart the song
- `R` toggle random
- `S` toggle single
- `<`/`>` previous/next song

# audio - playerctl
    playerctl  # quick guide
    playerctl -l  # (--list-all) available players - firefox, mpd
    playerctl metadata  # from the current player
    playerctl pause
    playerctl play
    playerctl play-pause  # toggles
    playerctl status
    playerctl stop

# audio - PulseAudio
    pactl -h
    pactl info
    pactl list short
    pgrep -af pulseaudio
    pulseaudio -k  # --kill
    pulsemixer

## libpulse
    pacat --list-file-formats
    pactl list sinks short
    pactl list sources short
    pactl set-sink-mute 0 toggle
    pactl set-sink-volume 0 60%  # master volume to reasonable level
    parecord -d 0 parecord.flac
    parecord -d 1 parecord.flac
    parecord -d 16 parecord.flac
    pavucontrol

# audio - SoX
    rec -c 2 sox.flac  # record in stereo
    soxi <audioFile>  # info, including duration

# bc
    bc -q
    bc <<< 'scale=2; 3 * 2.004 / 1'  # the final redundant division fixes  scale

- "an arbitrary precision calculator language"
- command: `scale=n  => results to n decimal places`

## limitations
- `<circumflex>i` = to power of integer i
- can be inaccurate

# CopyQ
    copyq tab  # lists the tab headings
    copyq tab clipboard read 0  # pastes the first one
    ctrl+home -> move_to_top
    pkill copyq; copyq &

# datetime
    strftime

## cal
    cal           " this month
    cal (command)
    cal -3        " last month, this, next
    cal -n 18     " all 18 months from now
    cal -w[y]     " week numbers
    cal -y        " year

## date
    date '+%F %a %H:%M'
    date +%y%m%d-%H%M%S
    date +%j-%H%M
    date +%s; sleep 1; date +%s
    date +%Y%m%d
    date +%y%m%d-%H%M
    date -d 'now -1 year'
    date -d @<unixTimeToConvert>
    date -R
    date -r <fileToGetDateOf>

- `%j` day of year (001..366)
- date(1)

# documenting
    aspell dicts

## Foliate
- `ctrl-q` = quit
- mouse to bottom for scrollbar
- mouse to top for adjustments

## PDFs
- `Firefox` shows `Document Outline`
- Outline = the hyperref bookmarks that correspond to headings of a LaTeX document

### C5 printing
- `Firefox` can't figure it's portrait
- `LibreOffice Writer` gets it right
- Ubuntu's `qpdfview` gets it almost right

### qpdfview
    F6 = View > Docks > Outline (such as the headings of a LaTeX document)
    F8 = Thumnails

### sizes
    pdfinfo <a_pdf_file>  # A5 = 420x595. See GSview for more sizes.

1 PostScript point = 0.3528 mm

### XpdfReader
    [-f <firstPage>] [-l <lastPage>]
    pdftoppm -png -r 300 <pdf> <basename_for_png_sequence>
    pdftoppm -jpeg -r 300 <pdf> <basename_for_jpeg_sequence>

### Zathura
    zathura --mode=fullscreen a.pdf &

zathura man page

#### commands
    :info

- `<tab>` toggles Outline view
- `f11` toggle fullscreen
- `r` rotate by 90 degrees
- `R` reload document

##### resizing
- `+/-/=` zoom in/out/original
- `a` best-fit mode
- `s` width mode

# Emacs
    ctrl-x > ctrl-c => quit
    emacs -mm &  # maximized
    emacs -nw  # in terminal

## view movements
    alt-v => scroll up
    ctrl-l => centre text in view
    ctrl-v => scroll down

# encoding
    delta <file1> <file2>
    git diff <file1> <file2>
    ~\.pyenv

Make (software)

## Git
    :Man git

### Git - configurations
    $ fd -HI -tf ^config$ | xargs rg -l 'remote = gh'  # ripgrep
    $ find . -wholename '*.git'
    $ find . -wholename '*.git/config' > gitconfig-all.txt
    $ find . -wholename '*.gitignore' > gitignore-all.txt
    $ find . -wholename '*.git/config' | wc -l
    $ grep -rl --include "config" harriott . > gitconfig-harriott.txt

#### gitconfig
    r ~/.ssh

`$machBld/jo/gitconfig` inludes `$misc/CP/gitconfig`

## TeX
    pdfjam --help

### TeX Live
    /etc/texmf/web2c/fmtutil.cnf
    sudo tlmgr -gui
    sudo tlmgr update -all -dry-run

#### tests
    pdflatex sample2e.tex
    tex --version

#### texmf.cnf
    $ABjo/texmf.cnf

defines variables for `kpathsea`

# Fcitx Clipboard
- `fcitx5-configtool & > Addons > Clipboard > Configure > Trigger Key` defaults to `ctrl+;`
- works in `Firefox`, `WezTerm`

# fcron
    fcrontab -l
    systemctl status fcron.service

# file contents
    cat
    diff <file1> <file2>
    enca -l surfaces
    tac
    shuf
    sk --ansi -i -c 'rg --color=always --line-number "{}"'
    sort -ro <file> <file>  # reverse sort in place
    wc -l <file>  # counts lines

- sharkdp/bat
- `uniq -c` (`--count`) prefix lines by counts

## awk
    awk -i inplace -F, '{print $3,$2,$1}' OFS='┊' toReorder.csv
    awk '{print $1}' ORS='\t' <file_with_column_to_print_tsv>
    v=variable; awk -v var="$v" 'BEGIN {print var}'
    za $cIThul/gawk.pdf

- `-F` = `--field-separator`
- `-i` = `--include`
- GAWK(1)
- GNU Awk
- `gsub(/old/,"new"[,target])` returns the number of substitutions made
- no backreferences

### built-in variables
- `FILENAME` name of the current input-file
- `FS` input field separator character (default = any space and tab characters)
- `NR` number of input records
- `NF` number of fields in an input record
- `OFMT` format for numeric output (default = `%.6g`)
- `OFS` output field separator (default = <space>)
- `ORS` output record separator (default = <newline>)
- `RS` record separator (default = newline)

### octal codes
- `\047` = '
- `\057` = /

### input field separation
- `F,`
- `F'\t'`

#### csv
- `F,`
- `-vFPAT='([^,]*)|("[^"]+")'` f1,"f2a, f2b",f3

### numbers
    awk -F, '{ if ( $1+0 > 2025 ) print $1 }" <first_column_could_be_year.csv> # only those > 2025
    awk '{ print ($1 % 2 == 0) ? "even" : "odd" }' numbers.txt
    awk '{printf("%06.2f\n", $1)}' <<< -9.111111

- `$1 ~ /^[0-9]+$/` checks if first field is an integer

## dos2unix
    dos2unix -i *
    fd -tf -x dos2unix -ic  # list files that would be converted

`-e` (=`--add-eol`) not on `WSL Ubuntu`

## file
    fd -Itf -x file

- "CRLF line terminators"
- Vim fileencoding utf8 reported as ASCII

## grepping
    grep -c '^PatternAtStartOfLine' <file>  # returns count of occurances
    grep -P '[\p{Devanagari}]' **/*.md  # finds Devanagari characters
    if grep -q '‡' <file_that_may_contain_‡>; then o ‡; fi

- `-A num` (`--after-context=num`)
- `-i` (`--ignore-case`)
- `-E` (`--extended-regexp`)
- `-F` (interpret patterns as `--fixed-strings`, not regex)
- `-o` (`--only-matching`)
- `-q` (`--quiet`, `--silent`) no standard out
- GNU Grep Manual

### igrep
    ig

#### commands
- `?` toggle help
- `f5` toggle search pattern
- `<enter>` edit the file on the line
- `<esc>`/`q` quit

##### context view
- `s`  toggle horizontal
- `v`  toggle vertical
- `-`/`+` decrease/increase size

## sed
    $cIThul/sed
    :Man sed
    echo "blia blib bou blf" | sed -E 's/bl(ia|f)//g'
    sed --version
    sed 5q <file> prints first 5 lines

- `-E`/`-r` (`--regexp-extended`) extended regular expressions
- GNU sed
- stream editor

### bracket expressions
    echo ' a' | sed 's/[^[:space:]]/!/'
    echo '20230516' | sed -r 's/(20[0-9][0-9])([0-9][0-9])/\1-\2-/' # 2023-05-16
    echo 'gray, grey' | sed 's/gr[ae]y/blue/g'

#### character classes
- `[:alpha:]`=`[:lower:]`+`[:upper:]`=`[A-Za-z]`
- `[:alnum:]` alphanumerics (`[:alpha:]`+`[:digit:]` = `[0-9A-Za-z]`)
- `[:digit:]`: could `echo '12' | sed 's/[[:digit:]]//'`, but `echo '12' | sed 's/[0-9]//'` is more compact

### make changes
    echo -e '1\n2\n3' | sed $'s/.*/\t&/g'  # inserting tabs
    echo "don't forget that" | sed 's/\x27/\"/'
    echo "é" | sed 's/é/e/'
    echo "Oo" | sed 's/o/a/Ig'  # case insensitive
    echo "THIS is a test!" | sed 's/.*/\L&/; s/[a-z]*/\u&/g'  # title case
    sed -i $'s/\t/tab_gone/g' <file_with_tabs>
    sed -i '/<regex>/!d' <filetoreduce>  # removes lines that don't match
    sed -i '/match/,+2d' <file>  # removes matched line and 2 after
    sed -i '0~2 a\\' <fileToAddBlankLineAfterEach2ndLine>
    sed -i 's/\r//' <file_to_remove_CRLF_from>
    sed G <file>  # outputs <file> with blank lines added
    sed -e '0,/first/ s/first/this_first_only/' -i <file_to_make_just_one_single_change_to>

- `&` whole matched pattern
- replace a string in multiple files

#### delete lines
    sed -i '1,4d' <file>
    sed -i '2d' <file>

#### prepend
    sed '1i\nNewFirstLineText' <fileToPrependTo>
    sed -i '1s/^/vim: ft=<filetype>:\n\n/' <file_to_prepend_vim_modeline>

### show file contents
    sed '/pattern/q' <file>  # cat's  <file>  until  pattern
    sed 5q <file> print first 5 lines
    sed -e '' <file>  # mimics cat
    sed -n '/<regex>/p' <file>  # prints only the matching lines
    sed -n '2,$p' <file>  # prints from the 2nd line

# file manage
    $cGRs/unix/ranger-ranger
    $OSL/bashrc-console-fm
    fuseiso <ISO_image> <mountDirectory>
    mkdir -p  # --parents = make parent directories as needed (no error if existing)
    sudo chown -R <user>:<group> <dir> # --recursive

- `chmod 600 file` - owner can read and write
- `chmod 644 file` - owner can change it, everyone else can read it
- `chmod 660 file` - owner can read and write, and group members
- `chmod 666 file` - all can read and write
- `chmod 700 file` - owner can read, write and execute
- `chmod 711 file` - `drwx--x--x`
- `chmod 755 file` - `drwxr-xr-x`
- `chmod 777 file` - all can read, write and execute
- FILE(1)
- install(1)
- rm(1)

## compressed
    :Man gzip

`7-Zip`: `for z in *.zip; do 7z x $z; done`

### tar
    :Man tar
    tar -xvf tar.gz.tar
    tar -xzf archive.tar.gz [-C <target_directory>]

- `--gunzip` (or `--ungzip`)
- `-v` (`--verbose`)
- `-z` (`--gzip`)

## cp
    cp -r <sourceDir> .

`-L`, `--dereference`

## digests
    md5sum -c <md5file>
    rhash -a --bsd <somefile>
    rhash --list-hashes => list names of all supported hashes
    rhash --sha256 <file>
    rhash --sha256 *  # to see if files are identical

## Dolphin
    F4        -> Konsole  attached below
    Shift+F4  -> Konsole  in a new window

## fd
    fd -tl -HL -X rm  # removes dead links
    fd -tf stderr.txt -X rm

## find
    find $PWD -name <file>  # gets full path
    find -cmin -5
    find -regex ".*a.*\|.*b.*"
    find . -maxdepth 1 -mindepth 1 -type f -name "*"  # those in working directory
    find . -name "*" -type f ! -path '*/.git/*'
    find . -name '*.txt' ! -name 'build*'  # excluding build*
    find . -newer oldFile
    find . -path '*exclude_path*' -prune -o -name 'partial_filename*' -print
    find . -type f -exec du -h {} + | sort -hr > descendingSizes.txt
    find . -xtype l -delete  # quickly removes broken symlinks

find(1)

## GIO
    gio help
    gio version

(Gnome Input/Output)

## investigations
    diff --no-dereference -qr dir1 dir2
    find . -name '.?*'  #  recursively list hidden files
    stat -c '%a %n' *  # show octal permissions

### counts
    echo `find . -type d | wc -l`-1 | bc  # counts all subdirectories
    find . -name "*" -type f -path '*/.git/*' | wc
    for d in $(fd -d1 -td); do find "$d" | o "$(wc -l) : $d"; done  # files in directories
    for n in *; do find "$n" | echo "$n"; done
    isutf8 **/* | wc -l  # non UTF-8 files (fails when too many)

#### by extension
    find . -type f | sed 's/.*\.//' | sort | uniq -c
    ls -ar | rev | cut -d'.' -f1 | rev | sort | uniq -c | sort -r

#### including hidden
    find . | wc -l  # very fast in $Drpbx
    ls **/* | wc -l  # all of the files

### mlocate
    locate .asc | grep '\.asc$'
    locate -c <target>  # --count
    locate -h

### sizes
    diskonaut -h
    dust  # graphical size representation

#### listed
    ls -1Rhs | sed -e "s/^ *//" | grep "^[0-9]" | sort -hr | head -n50  # neat recursive list of largest

##### du
    du -ah . | grep -v "/$" | sort -rh | head -44  # recursive list of largest 44 files
    du -h --max-depth=0 <directory>
    du -h --max-depth=1  # for a quick list of folder sizes
    du -hs  # size of current directory
    du -hs <glob>
    du -s **/.git

du(1)

#### ncdu
    ncdu [<directory>]

##### commands
- `?` -> help
- `g` -> rotate through % graph none
- `n` -> order by name
- `s` -> order by size

### symlinks
    [[ -L $s ]] && echo 'symlink exists'
    find . -type l -ls  # recursively list all symlinks with their references
    readlink $s  # returns referenced node

### tree
    tree -a  # include hidden
    tree -d [-L n]  # directories only, maximum Level (= depth) n
    tree -f  # print path
    tree -fi  # print path without indentation lines

tree(1)

## ln
- `-s` (`--symbolic`) not hard
- ln(1)

## ls
    dircolors  # LS_COLORS=...
    dircolors --help
    dircolors --version
    dircolors -p  # --print-database
    ls -l

- `-d` (= `--directory`)
- ls(1)

## rm with Pipe Viewer
1. `find <directory> | wc -l  # gets the <filecount>`
2. `sudo rm -rv <directory> | pv -l -s <filecount> > /dev/null  # shows progress for rm`

## rsnapshot
    ncdu --exclude *rsnapshot
    rsnapshot configtest
    sudo rsnapshot du  # can takes many hours...
    systemctl list-unit-files | grep rsnapshot

> /usr/bin/rsnapshot sync: completed successfully

## rsync
    rsync -irtv --delete $TeNo/ $Drpbx/Play1/TextNotes
    rsync -inrtv --delete --progress path1/large_file_dir1/ path2/large_file_dir2

output info: `YXcstpoguax`

### options
    --exclude=PATTERN

- `-h` (`--help`)
- `-i` (`--itemize-changes`)
- `-l` (`--links`) copy symlinks as symlinks (so no "skipping non-regular file" if the symlink's reference exists)
- `-L` (`--copy-links`) transform symlink into referent file/dir
- `-n` (`--dry-run`)
- `-r` (`--recursive`)
- `-t` (`--times`) keep modification times
- `-v` (`--verbose`)
- `-V` (`--version`)

#### for system files
- `-A` (`--acls`) keep ACLs, implies `-p`
- `-a` (`--archive` = `-Dgloprt`) handles symlinks with no reference
    - `-D` (`--devices --specials`)
        - `--devices` keep device files
        - `--specials` keep special files
    - `-g` (`--group`)
    - `-o` (`--owner`) if super-user
    - `-p` (`--perms`) keep permissions
- `-X` (`--xattrs`) keep extended attributes

## zoxide
    declare -f z
    zoxide -h

# Flatpak
    du -sh /var/lib/flatpak/.removed
    flatpak list
    flatpak remotes  # list added repositories
    flatpak uninstall <pkg>
    sudo flatpak list
    sudo flatpak repair  # Erasing .removed
    sudo flatpak update

# get at root on tty2
    Ctrl+Alt+F2 > root + pw

# GNU Privacy Guard
    echo "encrypt me this" | gpg -ase -r jharr
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
    for i in *.bmp; do convert $i ${i%.*}.jpg; done  # no spaces in names
    for i in *.jpeg; do convert $i jpg/${i%.*}.jpg; done  # gets them into subfolder jpg
    gphoto2 --auto-detect  # list detected cameras
    gphoto2 -DR  # delete all files in all folders
    gphoto2 -l  # list folders
    gphoto2 -L  # list files
    gphoto2 -P  # get all files
    gpicview  # opens first image in directory (no thumbnails)
    exiftool <image>
    exiftool -Orientation *  # reports
    exiv2 <image>

## feh
    feh -F  # fullscreen
    feh -l [*] # [recursively] list image specifications

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

## ImageMagick
    convert -flatten transparent.png white_background.png
    convert -list
    convert -list gravity
    convert <colourimage> -colorspace Gray <grayimage>
    convert <people> -paint 9 <people-oil>
    convert <positive> -negate <negative>
    for i in $(ls); do convert -resize 10% $i r$i; done
    for i in $(ls); do convert -resize 15% $i r$i; done
    for i in $(ls); do convert -resize 25% $i r$i; done
    for i in $(ls); do convert -resize 50% $i r$i; done

## nomacs
    nomacs -h
    nomacs -v

- can only fill page for printing
- can't open `webp`
- PrintPreview-PageSetup-Landscape

### keybindings
    ctrl+k => keyboard Shortcuts
    ctrl+r => resize
    ctrl+s => save dialogue
    ctrl+shift+p > Close on ESC
    f => toggles selected panes
    F1 => credits
    F10 => frameless

#### Alt
    Alt A > Exposure > Gamma
    Alt A > Tiny Planet

#### not having cropped
    Ctrl+w => next tab
    Ctrl+w => close tab

#### Panels
    alt+m => Metadata Info
    i => File Info
    f => hide all
    m => Metadata Ribbon
    mouse right-click to find them

## Pinta
- attempts to shows cursor position in pixels, but underestimates - use GIMP
- `backspace` (= `Edit > Erase Selection`)
- can't send to printer...
- `Rectangle Select > Cut > Paint Bucket` to replace an area with a solid colour fill

## pqiv
    pqiv -i <animateGif> &  # opens the animated gif without the obtrusive info box
    pqiv --auto-montage-mode * &  # flat recursive view of all imagies
    pqiv --show-bindings

- changes aren't saved
- plays mp4's
- powerful quick image viewer
- recursive
- shows size in status bar tab

### commands
    esc/q => quit
    f => toggle full screen
    h => flip horizontally
    i => toggle info box
    j => file selection dialogue
    m => toggle montage
    n => negative
    s => toggle slideshow
        c-r => toggle shuffle
    <space> <backspace> => next previous

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

No refresh of directories...

### nsxiv
    i nsxiv
    nsxiv -c  # --clean-cache
    tree ~/.cache/nsxiv

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
    mediainfo <avfile> | grep Encoded

## mpv
    mpv av://v4l2:/dev/video0
    mpv --start=-2 <avfile>  # starts 2 seconds from end

# networking
    arp-scan -lx  # lists subnet hosts
    bluetoothctl -- devices
    sudo iptraf-ng  # ncurses network statistic monitoring utility
    sudo lshw -c network
    sudo lsof -i -P -n | grep LISTEN  # to see the listening ports

## devices
    arp-scan --localnet  # reports MAC addresses on network
    ip link
    networkctl list

## hostname
    hostname
    hostnamectl
    uname -n  # hostname

## iproute2
    ip a  # ip address show
    ip l  # lists machine's ethernet devices
    ip neigh  # subnet hosts
    ip r  # ip route show - compactly shows my internal ip address

## iwd
    man iwd
    sudo ls /var/lib/iwd  # reports internet source
    systemctl status iwd.service

### iwctl
    man iwctl
    iwctl device list  # shows MAC address
    iwctl known-networks list
    iwctl station wlan0 get-networks  # shows if  wlan0  is connected to one

requires a `DHCP` client to get an IP address

## NetworkManager
    nmcli device  # list of networking devices
    nmcli device wifi list | cat  # paged list of SSIDs, with those IN-USE starred
    nmcli device wifi connect <SSID> password <pw>

### saved connections
    nmcli connection delete <SSID>  # can help
    nmcli connection show | cat  # reports UUIDs and colourizes the active device
    nmcli connection up uuid <UUID>

## NordVPN
    nordvpn cities United_Kingdom
    nordvpn cities United_States
    nordvpn countries
    nordvpn rate x  # 1 (poor) to 5 (excellent)
    nordvpn set technology nordlynx
    nordvpn settings
    nordvpn status
    pgrep nordvpn
    sudo pkill -9 -f nordvpn  # doesn't logout

### account
    nordvpn connect CA
    nordvpn connect UK
    nordvpn connect US
    nordvpn disconnect
    nordvpn login
    nordvpn logout
    nordvpn rate 5
    nordvpn status | xcol United

## ss
    bm ss
    ss --tcp --listening
    ss -tulw  # listening on TCP, UDP, RAW sockets

## ssh
    $HOME/.ssh/authorized_keys
    ssh localhost
    sudo systemctl restart sshd.service
    sudo systemctl status sshd.service

### session commands
    ~? => supported escape sequences

#### exit
    exit
    ~.
# npm
    which npm

## cspell
    cspell trace "colour"  # shows which dictionary it's in
    cspell check <filename>
    cspell lint --help

## ffmpeg-concat
- `-d <transition_duration>` default `500`
- `-o <out_file>` default `out.mp4`
- `-t <transition_name>` default `fade`

## npx
    ls ~/.npm/_npx/*/node_modules
    rm -r ~/.npm/_npx/

# one-line of command output
    echo $(ls)
    ls | xargs
    xargs < <file>  # cat alternative

# pass
    pass  # pass ls
    pass help
    pass init <gpg-id>  # creates  ~/.password-store/.gpg-id
    pass add [-f] <node> > <pw> # insert --force
    pass insert <node> > <pw>
    pass <node>
    pass mv <node_old> <node_new>
    pass rm [-f] [-r] <node>  # [--force] [--recursive]

pass(1)

# processes
    lsof -i
    pidof init  # process id of  init, which is always 1
    sudo iotop -o
    xprop  # WM_CLASS(STRING) = "instance", "class"

niceness: `-20` = highest priority, `19` = lowest

## kill
    kill -9 **<tab>  # fzf
    pkill zoom

## list
    ps -ef | grep yt-dlp
    ps -efjH
    pstree -C age

## pgrep
    i pgrep
    pgrep <aprogram>  # reports it's process id

# shell
- `dc` desk calculator (reverse-Polish)
- `echo $SHELL` reveals flavour
- `fc` "fix command"

## Bash
    $misc/linux/QR/script.sh
    $culLB/Scratch0.sh
    /etc/profile
    <somecommand> | xcol <keyword1> <keyword2> ... # for highlighting
    bash --help
    bash --version
    echo "$floatingpointnumber-$another" | bc  # FP math
    echo "$PS1"
    echo $PWD
    echo $SHELL
    env | grep SHELL
    exit 0  # to quit script
    printf command
    read -p "hit Enter"; echo hello
    read a b; echo $a $b
    shopt
    shopt dotglob  # reports back its status
    shopt -u nullglob  # incase  t=$'\?'; echo $t
    xdg-open $cIThul/linux/bash.pdf
    za $ITscr/unix-like/linux/bash.pdf
    ~/.bash_history

```bash
case 'one' in
  one) echo 1;;
  two) echo 2;;
esac
```

- BASH(1)
- command substitution `$(...)`

### aliases
    alias
    compgen -A alias | awk '{print}' ORS=' : '; echo  # compact list
    unalias

### clear screen (saving scrollback)
    clear -x  # erase the all lines not in scrollback
    ctrl+l => scroll the current line to the top
    tput reset

### conditionals
    [ "$a" ] && echo $a
    [ -z "$a" ] && echo zero_string; [ -n "$a" ] && echo string
    [ true ] && echo y
    [ "y" ] && echo y
    c=1; [[ $c == 1 ]] && echo "true"
    if <condition1>; then <action1>; elif ... else ... fi
    if [ "$a" ]; then echo '$a is defined'; fi
    t="y"; if [ $t ]; then echo $t; fi

#### =~
    [[ "hello" =~ "ll" ]] && o ll
    v=value; [[ ! $v =~ val ]] && echo val

### echo
    echo "~ stays ~ in double quotes, it's unexpanded to $HOME"

`-n` no trailing newline

#### backslash escapes
    echo -e "\\t" word_after_tab
    echo -e '\t' word_after_tab
    echo $'aa\'bb'

`-E`  # (default) no interpretation

### file manage
    echo */  # lists directories
    echo <file>
    for f in *; do mv $f ${f:2}; done
    man -h ls
    mktemp temp-XXX  # can add more X's, touch's a randomised filename
    pushd ~/some_path; pushd /another_path; popd; popd

#### find
    find . -maxdepth 1 -mindepth 1 -type d -name "*"  # those in working directory
    find -iname \*.flv -o -iname \*.mp4 -o -iname \*.ogv
    find -type f -name "[[:upper:]]*"  # files beginning with capital letter

`-iregex <pattern>` = case insensitive `-regex`

#### tests
    [ -d "$d" ] && echo "directory $d is there"
    [ -f "$f" ] && echo "file $f is there"
    [ -s "nohup.out" ] && echo non-zero file size
    [[ -d "$d" && ! -L "$d" ]] && echo "It's a directory and not a symbolic link"
    rm a b; touch a; sleep 1; touch b; ls -t; [ a -ot b ] && echo older

### functions
    "$@" = "$1" "$2" ...
    export -f <usefulfunction>  # allows it to be used in a script
    unset -f <function>

#### lists
    compgen -A function | awk '{print}' ORS=' : '; echo
    declare -F  # lists all declare -f possibilities

#### show code
    declare -f <function_name>  # shows its contents
    type <function_name>

### Internal Field Separator - set
    IFS=this
    unset IFS
    savedIFS=$IFS; ...; IFS=$savedIFS

### Internal Field Separator - test
    cat -et <<<"$IFS"
    echo "hello$IFS"."there"

### job control
    ctrl+c
    fg %n
    jobs -l  # then  kill %n

jobs(1p)

### Login shell?
    echo $0  # "-bash" = login shell, "bash" = non-login shell
    shopt login_shell

### loops
    break  # breaks out of loop
    continue  # to next iteration of loop
    for d in */; do echo $d; done
    for d in /mnt/*; do echo $d; done
    for f in **/*; do echo $f; done
    for i in {0..9..2}; do echo $i; done
    for i in bee fly wasp; do echo $i; done
    s=2; e=4; for (( c=$s; c<=$e; c++ )); do echo $c; done
    select f in apple pear grape; do echo "you chose $f"; done
    while read line; do echo "$line"; done <file_to_use_line_by_line

### managing commands
    o $?  # exit code of last command, 0 if command succeeded
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

`find ... 2> /dev/null` suppresses stderr stream

##### key
    1 = stdout file descriptor
    2 = stderr file descriptor
    >& = redirect to a file descriptor
    1>&2 = 2>&1

### online code check
- <https://explainshell.com/>
- ShellCheck <https://www.shellcheck.net/>

### $PATH
    echo "${PATH//:/$'\n'}"
    echo "$PATH" | tr ':' '\n'

### set
    echo $-  # current options
    set -e  # terminate on a fail
    set -v  # show code lines as they're used
    set -x : show commands and arguments

#### unset
    var1=1; var2=2
    echo $var1 $var2
    unset var1 var2

### su[do]
    su -  # login shell

substitute user identity

### trap
    trap - debug  # turn off debug
    trap read debug  # puts a read request after each executable line

### variables
    echo $((2*2))
    export  # lists environment variables
    set  # lists all variables

#### arrays
    a=(1 2 3); ((a[0]++)); ((a[1]+=2)); a+=(4); echo ${a[@]}
    a=(1 2 3); echo ${a[-1]}  # last element
    a=(1 2 3); b=("${a[@]}"); b+=("${a[@]}"); echo ${b[@]}
    echo 'a b c' > l; s=$(<l); a=(${s//'\n'/,}); echo ${a[@]} # so l is a file containing a space-separated list
    echo ${#array[@]}  # number of elements
    firstElement=${array[0]}
    mapfile -t found < <(find .)
    mapfile -t GreekArray < <(printf "Alpha\nBeta\nGamma"); echo ${GreekArray[@]}
    string='My string'; [[ $string =~ "My" ]] && echo success

don't export them

##### list
    echo ${array[@]}
    for ((index=0; index<${#array[@]}; ++index)); do echo "$index" "${array[index]}"; done
    for item in "${array[@]}"; do echo; echo "$item"; done
    printf '%s\n' "${array[@]}" | grep 'match'

#### integers
    (( $1 == 1 || $1 == 2 )) && echo "number 1 or 2"
    ((i-=2)) # decrements $i by 2
    i=0; echo $((i+=1))
    n=2; if ! (( $n == 1 )); then echo 'not 1'; fi
    n=1; printf "%03d\n" $n
    n=08; (( 10#$n > 7 )) && o base10  # because 08 is an impossible octal

##### comparison
    if [ "$a" -ge 2 ]
    if [ "$a" -gt 2 ]
    if [ "$a" -le 2 ]
    if [ "$a" -lt 2 ]
    if [ "$a" -ne 2 ]

##### (( > ))
    (( 1 > 0 )) && o 1
    if (( 1 > 0 )); then echo greater; fi
    if (( 1 >= 0 )); then echo greater; fi

#### empty or undefined
    $undefined && echo 'Eh! $undefined true!'
    empty=''; [ -z $empty ] && echo empty

#### strings
    [[ $t =~ (y|n) ]] && echo 'good answer'
    [ 'y' == 'n' ] || echo 'nope'
    n=''; n=n; [[ -n $n ]] && echo $n
    o lkj | rev | cut -c 2- | rev
    o ljk | sed 's/.$//'
    qs=$'quote\'*star'; o "$qs"
    s=12345; echo $s | awk '{print substr($1,length($1)-2) }'
    s=12345; echo $s | cut -c $((${#s}-2))-
    s=yes; s+=no; o $s
    s+=new; o $s
    ${x}and$y

case conversions: `var=vAlUe; o ${var^^}; o "${var,,}"`

##### parameter expansion
    file=a.b.c; echo ${file##*.}; echo ${file%.*}

    s='strong string'; o ${s//str/p} # all matches
    ${string/substring/firstMatchReplacement}
    ${string/#substringAtStart/replacement}
    ${string/%substringAtEnd/replacement}
    ${string:position:length}
    a=12345; echo ${a:2}; echo ${a:1:2}; echo ${a:2:1}
    b="a(b(c(d"; o ${b##*\(}
    s=12345; echo ${s::-2}
    t=lkj; echo ${t:0:${#t}-1}

    name=polish.ostrich.racing.champion; o ${name#*.}; o ${name##*.}; o ${name%%.*}; o ${name%.*}
    u=.git.git.git; o ${u%.git}

## flow control
- `ctrl+q` continue
    - `ctrl+s` stop

# sort
    sort -o <file> <file>  # in-place

- `-h` (`--human-numeric-sort`)
- `-n` (`--numeric-sort`)
- `-r` (`--reverse`)
- `-o` (`--output=FILE`)
- `-u` (`--unique`)
- `--help`
- `--version`

# system
    cat /etc/hostname
    clamscan -r  # shows Loading & Compiling
    clamscan -r 2>&1 | tee clamscan.log
    gtk-launch --version
    halt -p
    i hier  # detailed description of the filesystem hierarchy
    killall -SIGUSR1 conky  # brings it back up
    locale
    openbox --reconfigure
    passwd jo  # then re-login
    ps $(pgrep Xorg)  # shows which tty X is on
    swapon --show
    w  # list users and load on system
    whereis <executable>
    xrdb -query -all  # shows loaded X resources
    xset q  # shows a variety of IO settings

- awesomewm: floating window: `winkey+left_mouse_drag`
- lsmod(8) show what kernel modules are currently loaded
- maximum 255 bytes per filename & 4096 per path

## awesome wm
- maximized (horizontally or vertically) are indicated by (horizontal or vertical) double arrow, and break tiling
-`modkey+left_mouse_drag` move
-`modkey+right_mouse_drag` resize
-`modkey+s` awful.hotkeys_popup
- on top clients are indicated by a caret

## CPU-X
    cpu-x -h
    cpu-x -N
    Openbox Menu > System > CPU-X

## directory sizes as root
    du -shx
    ncdu -x  # --one-file-system

## etckeeper
    /etc/.gitignore
    /etc/etckeeper/etckeeper.conf
    sudo ls /etc/.git

## groups
    /etc/group  # all of them

```bash
gpasswd [-a <user> <group_to_add_to>]
groups jo
sudo groupadd <group_to_create>
sudo groupdel <group_to_delete>
```

## GRUB
    grub-install --version

(GRand Unified Bootloader)

## kernel parameters
    sysctl -a  # display all kernel parameters
    systeroid -A  # list all parameters
    systeroid -T  # list parameters in a tree

## monitoring
    atop
    free -h
    glances
    gtop
    htop
    iostat -dm -p sda2 3
    last reboot
    saidar -c

### dool
    dool --help
    dool -dD sda  # --disk
    dool -n  # --net
    dool -s  # --swap
    i dool

## notification - Dunst
    dunstctl close-all
    dunstctl history-pop  # repeat for previous messages
    dunstify -?
    dunstify -u critical "Read this now!"

## notification - notify-send
    notify-send 'test of notify-send'
    notify-send -u critical "test of critical notification"
    notify-send -t 5000 -u low "Hello World"

## Plasma
    Ctrl+Alt+Shift+Del -> exit KDE without saving
    Ctrl+Alt+Del       -> logout screen
    Ctrl+Alt+T         -> Konsole
    Win+PageUp/Down    -> maximises or returns to normal a window

## Qt
    qmake -query QT_VERSION

`qmake -v` also reports `Qt` version

## systemd
    systemctl halt
    systemctl reboot
    systemctl suspend
    systemd-analyze --system unit-paths
    systemd-analyze --user unit-paths

### info
    systemctl --failed
    systemctl --user --no-pager  # list running Systemd units
    systemctl --version
    systemctl is-enabled <service>
    systemctl list-timers
    systemctl list-unit-files --no-pager
    systemd-analyze blame  # time taken for boot processes

## uname
`uname -a` (= `--all`) handy line of system info

### --kernel-release
    [[ $(uname -r) =~ 'arch' ]] && echo 'Arch Linux'
    [[ $(uname -r) =~ 'microsoft' ]] && echo 'WSL2'

## users
    echo $EUID
    id -u
    su -
    who  # lists users active on terminals
    whoami

## Xfce
    xfce4-panel -r  # reloads
    xfce4-settings-manager &

- `GTK`
- `Terminal` (`xfce4-terminal`)
    - `ctrl+shift+c` = copy
    - `ctrl+shift+v` = paste

### Clipman
- `~/.cache/xfce4/clipman/textsrc` semicolon-separated list
- clickable `Panel` icon

### keyboard shortcuts
- `Ctrl+Alt+D` = minimize all
- `Ctrl+Alt+Del` = `xfce4-session-logout`
- `Ctrl+Alt+Escape` = `xkill` (right-click abandons)
- `Ctrl+Alt+L` = `xflock4`
- `HomePage` = `XF86HomePage` = `exo-open --launch WebBrowser`
- `Shift+Ctrl+Esc` = `xfce4-taskmanager`
- `Super+e` = `thunar`

#### windows
- `Applications > Settings > Window Manager`
    - `Alt+F9` = minimise
    - `Alt+F10` = toggle maximise
    - `F11` = full screen
    - `super+1` = move to left monitor
    - `super+2` = move to right monitor

### Thunar
    ~/.config/Thunar
    ~/.config/xfce4/xfconf/xfce-perchannel-xml/thunar.xml

### Xfce Notify Daemon
    systemctl --user status xfce4-notifyd
    xfce4-notifyd-config &

# term
    sudo fgconsole  # reports tty number

- `^\` = `SIGQUIT`
- `^c` = `SIGINT`
- `^q` resume output to screen
- `^s` pause output to screen
- w(1)

## Alacritty
    alacritty -h  # --help
    alacritty -V  # --version

- `Ctrl+Shift+b` = `SearchBackward`, then `Esc`
- `Ctrl+Shift+space` = `ToggleViMode`

### font
- `Ctrl+-` = `DecreaseFontSize`
- `Ctrl+0` = `ResetFontSize`
- `Ctrl+=` = `IncreaseFontSize`

### scroll
- `Shift+PageDown/Up` = `ScrollPageDown/Up`
- `Shift+End/Home` = `ScrollToBottom/Top`

## size
    stty size  # lines columns

### set (not in tmux)
    printf '\033[8;40;100t'
    resize -s 90 150

## terminal line settings
    stty - a

### flow control
    [-]ixon = the setting
    ctrl-q = XON
    ctrl-s = XOFF

## tmux
    if [ $TERM == 'screen-256color' ]; then echo "you're in tmux"; fi
    pgrep tmux -l

### $ tmux ...
    tmux a               # attach
    tmux a -t myname     # attach to session myname
    tmux detach
    tmux kill-server     # good for resetting
    tmux kill-session -a # kills all but current session
    tmux list-keys | grep '~'
    tmux list-keys | mo
    tmux ls              # list sessions
    tmux lsk -Na         # includes my rebinds
    tmux send ls enter  # (send-keys) ls  in the currently active pane
    tmux show -g prefix  # (show-options)
    tmux show -s   # server

### internal commands
    :bind  # alias for  bind-key
    :choose-tree  # put a pane into tree mode, can kill and select
    :join-pane -s 2 -t 1  # move w2 as a pane to w1
    :joinp -s 2 [-t 1 ]  # join-pane, joining pane in window 2 [to that in window 1]
    :set synchronize-panes  # (set-option)

### key binds
    $OSL/nodes/terminal-tmux/tmux.conf
    C-a :  # command prompt
    C-a ?  # list-keys -Na
    C-a [  # copy-mode
    C-a <  # display-menu
    C-a >  # display-menu
    C-a ~  # show-messages (q to quit)
    C-a t  # time (q to quit)

- `a-m` begins `set mouse`
- `c-a c-s` begins `easycopy` (`tmux-copy-toolkit`)
- `send-keys` can't decode a Bash environment variable

#### buffers
    C-a ]  # paste-buffer -p
    C-a #  # list-buffers
    C-a =  # choose-buffer -Z

#### copy mode
    C-a [  # copy-mode
    C-a e  # easycopy
    C-a P (C-p)  # quickopen (abspath, URL)
    Enter  # quits
    Pg Up/Dn
    S  # copytk mode
    s  # easymotion

##### copytk mode
    j  # easymotion forward
    k  # easymotion backward
    n  # easymotion lines
    s  # easymotion

#### session window pane
    M-PgDn/PgUp  # (= C-a (/) ) previous/next session

##### panes
    C-a C-o  # Rotate through the panes
    C-a M-1  # switch to even-horizontal layout
    C-a M-2  # switch to even-vertical layout
    C-a M-3  # switch to main-horizontal layout
    C-a M-4  # switch to main-vertical layout
    C-a M+arrow  # resize by 5
    C-a q  # show numbers
    C-a {  # swap-pane -U
    C-a }  # swap-pane -D
    C-a z  # toggle zoom
    C-a q  # display-panes
    C-a { / }  # swap-pane -U / -D
    C-a Space  # next-layout (of 5 defaults)

##### windows
    C-a w  # choose window from a list
    M-n  # (= C-a n ) select window n

## tput
    tput colors
    tput cuu 2; tput el  # move back a line and clear it

tput(1)

## urxvt
    urxvt --help

- `$TERM` is set to `rxvt-unicode-256color`
- `rxvt-unicode`
- `URxvt.url-launcher`

# tr
    tr '\n' '~' < <in> | sed 's/~/  /g' [> <out>]  # replace newlines with double spaces

tr (Unix)

# Ubuntu
    lsb_release -a
    ods2tsv list.ods > list.tsv
    sensible-browser https://manpages.ubuntu.com/manpages/jammy/man1/sensible-browser.1.html
    sudo updatedb

`sed -i` will change `fileformat` to `dos`

## packages
    apt-cache search .

https://packages.ubuntu.com/

### manage
    apt-cache -h
    apt-cache showpkg <package>  # report includes dependencies and reverse dependencies
    apt-get download <package>  # to current directory
    dpkg -l
    dpkg-deb -x <package> <directory>  # --extract
    sudo apt install <package1> <package2> ...
    sudo apt remove <package1> <package2> ...

- `sudo apt update` [the package index]
- `sudo ls /etc/apt/sources.list.d/` repositories

### upgrade packages
    sudo apt autoremove
    sudo apt upgrade
    sudo apt-get clean
    sudo apt-get dist-upgrade  # better, riskier

## Pro
    pro security-status
    pro status
    sudo pro attach <FPT>

# vim
    $HOME/.viminfo
    e -la /usr/bin/vim
    find . -type f -name tags
    file "$(command -v vim)"
    gvim &
    neovide &

# WAN
    if wget -q --spider google.com; then echo online; fi
    pkill radio; radio -K  # quit & kill instances of  radio-active

## Chawan
    cha -V
    cha https://en.wikipedia.org
    mancha cha

### key bindings
- `alt+i` toggle images
- `q` quits
- `v` toggles select
- `y` yank to clipboard
- vim-like

## email
    thunderbird -addressbook

### clm
    $AjB/bashrc-clm
    mbsync -v

#### msmtp
    msmtp --version

"an SMTP client"

#### neomutt
    neomutt -D  # dump settings
    neomutt -h  # help
    neomutt -v  # version
    rm -r ~/.cache/mutt/*
    sidebar_format

#### notmuch
    notmuch config get database.path

##### search
    nmse ...
    notmuch --help
    notmuch --version
    notmuch search '"the Pennines"' # finds exactly that
    notmuch search tag:attachment | wc -l
    notmuch search tag:cz | wc -l
    notmuch search tag:fm | wc -l
    notmuch search tag:gmail | wc -l
    notmuch search tag:trohib | wc -l
    notmuch search tag:zou | wc -l
    notmuch search tag:zou and tag:inbox | wc -l

- NOTMUCH-SEARCH-TERMS(7)
- seems to not find emails that're included in subsequent ones

## firewall
    sudo iptables -L

### Firewalld
    sudo firewall-config
    sudo systemctl start firewalld
    sudo systemctl stop firewalld
    sudo systemctl status firewalld
    sudo systemctl restart firewalld

#### firewall-cmd
    sudo firewall-cmd --info-zone=home
    sudo firewall-cmd --info-zone=public
    sudo firewall-cmd --panic-on
    sudo firewall-cmd --state

### iptables
    sudo iptables -nvL
    sudo systemctl status iptables.service

## GNU Wget
    :Man wget
    wget -kr -A.zip https://url-to-webpage-with-pdfs/  # works from that page
    wget -r -A.pdf http://url-to-webpage-with-pdfs/  # works recursively from root page

- `-E` (`--adjust-extension`)
- `-O file` (`--output-document=file`)

## rdrview
    i rdrview
    rdrview http://harriott.github.io -M

## transmission-cli
    http://localhost:9091/transmission/web/
    transmission-daemon --dump-settings
    transmission-remote -a some.iso.torrent
    transmission-remote -l

## w3m
    w3m http://harriott.github.io  # showing images
    w3m https://man.archlinux.org/man/w3m.1.en

### keymaps
- `H` Current keymap file
- `M` (= `EXTERN`) opens page in default browser
- `o` (= `OPTIONS`) Option Setting Panel
    1. `[shift-]tab` to option then `Enter`
    1. `tab` to `[OK]` then `Enter` to end
- `Q` (= `EXIT`)
- `r` (= `VERSION`)
- `R` (= `RELOAD`)

#### movements
- `+` ` ` (= `NEXT_PAGE`)
- `-` `b` (= `PREV_PAGE`)
- `[`, `]` (= `LINK_BEGIN`, `LINK_END`) start, end of page
- `g` (= `BEGIN`) start of page
- `w` (= `NEXT_WORD`)
- `W` (= `PREV_WORD`)
- `z` (= `CENTER_V`) centres on current line
- vim-like

#### navigation
`B` (= `BACK`)

##### URLs
- `c` (= `PEEK`) reveals the url
- `e` (= `PEEK_IMG`) reveals the url
- `U` (= `GOTO`) presents dialogue on current url (`ctrl-u` clears that url)
- `u` (= `PEEK_LINK`)
- `v` (= `VIEW`) toggles HTML view

#### page contents
- `I` (= `VIEW_IMAGE`)
- `S` (= `SAVE_SCREEN`) requests name for file to save to (line breaks are kept)
- `/` (= `SEARCH`) centres on found
- `tab`, `shift+tab` jump to next, previous link

#### tabs
- `ctrl+q` (= `CLOSE_TAB`)
- `s` (= `SELECT_MENU`) to move tabs
- `T` (= `NEW_TAB`) re-opens current tab, new
- `{` (= `PREV_TAB`)
- `}` (= `NEXT_TAB`)

