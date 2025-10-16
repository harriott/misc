vim: nospell:

 email
`HTML` messages can include `.gif`, `.jpeg`, `.png`

# Thunderbird
    $ITsCP/WAN/Thunderbird/builds.txt

- `$Thb/compatibility.ini` for LastVersion
- `$Thb/ImapMail` contains incomprehensible `*.msf` files alongside mbox files with same basename. The latter are vast and chock-full of complex formatting. Deleted messages are simply marked and not removed until compaction. `*.sbd` are subfolders.
- `received message view > Autres > Personnaliser... > Style du bouton > Icônes`
- `Ctrl+k` search is done with `Gloda`

## attachments
delete: `right-click on email selection > Attachment Extractor > Delete attachments > OK, wait until next OK signals it's done`

## Deleted
- Gmail: immediately propagated
- Zourit: wasn't propagated - fix was to temporarily move 160 messages into process folder

## internal commands
    right-click on folder > Properties > Repair Folder

### keyboard shortcuts
- `ctrl+shift+b` = `Address Book`
- `f11` = toggle Today Pane
- mozillamessaging

#### messages
- `a` archive
- `ctrl+m/n` new message
- `ctrl+enter` send message
- `ctrl+l` forward
- `ctrl+r` reply (to sender only)
- `ctrl+shft+r` reply to all
- `ctrl+o`/`enter` open in new tab
- `ctrl+p` print
- `ctrl+s` save as file
- `ctrl+u` view source
- `m` toggle message read/unread
- `s` toggle starring

##### attachments
- `ctrl+shift+a` = attach
- `alt+x` = reorder attachments

##### find
- `ctrl+f` = find in message
- `ctrl+g`/`f3` = find next in message
- `ctrl+k` = focus (global) search box (`gloda`)
- `ctrl+shift+f` = `Search Messages`
- `ctrl+shift+g`/`shift+f3` = find previous in message
- `ctrl+shift+k` = focus quick filter

##### junk
- `j`  junk
- `(Shift+)j`  (not) junk

##### next/previous
- `f`/`b`
- `]`/`[`

##### write
- `ctrl+]/[` = increase/decrease indent
- `ctrl+shift+v` = paste without formatting

#### tabs
- `alt+1` = home tab
- `alt+2-8` = tabs 2-8
- `alt+9` = last tab

### keys for Menu Bar
`alt+f` (= `File`) `> f` = `Compact Folders`

#### Affichage
- `alt+a` (= `Affichage`) `> o` (= `Corps de message en`)
    - `h` (= `HTML original`)
    - `x` (= `Texte seul`)

#### Edit
    alt+e

- `e` (= `Settings`) `> Config Editor...` = `Advanced Preferences`
- `f` (= `Find`) `> m` (= `Search Messages`)

#### Tools
    alt+t > alt+a (= Add-ons and Themes)
    alt+t > e (= Edit) > a a (= Account Settings)

`alt+o (= Outils) > m > m (= Paramètres des comptes)` can then drag account folders into order

#### View
- `alt+a` (= `Affichage`)
- `alt+v > l` (= `Layout`) `> f` (= `Folder Pane`) to toggle it
- `alt+v > s` (= `Sort by`) `> h` (= `Unthreaded`)

##### body
- `b` (= `Message Body As`)
    - `h` (= `Original HTML`)
    - `p` (= `Plain Text`)

view as plain text allows deletion of inline images

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

## run addressbook
    PS> C:\MozillaThunderbird\thunderbird.exe -addressbook
    thunderbird -addressbook

## run safely
    $OSAB/nodes-jo/wm/TS/thunderbird_safely.sh
    $machine\T91\runSafely.ps1

