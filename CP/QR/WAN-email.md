vim: nospell:

 email
`HTML` messages can include `.gif`, `.jpeg`, `.png`

# Thunderbird
    $cITCP/WAN/email-Thunderbird/builds.txt

- `Ctrl+k` global database search is done with `Gloda` which indexes for search terms
    - case-insensitive
    - minimum term length is 3 characters
        - `12.3.456.789` will index only for `456` & `789`
    - `only_wild_at_end*`, and porter stemming (`find` `finds` `finding` all are equal) is used
    - terms are delimited with punctuation or spaces
- `Ctrl+Shift+k` Quick Filter search is limited to the current message list
    - icons left (`Pin`) & right (eg `Attachment`) can limit further
    - once a term is entered, get (persistent) toggles for `Sender`, `Recipients`, `Subject`, `Body`
- `received message view > Autres > Personnaliser... > Style du bouton > Icônes`

## attachments
delete: `right-click on email selection > Attachment Extractor > Delete attachments > OK, wait until next OK signals it's done`

## Deleted
- `Gmail`: immediately propagated
- `Zourit`: wasn't propagated - fix was to temporarily move 160 messages into process folder

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

## profile
- `$JHThb/compatibility.ini` for LastVersion
- `$JHThb/ImapMail` contains incomprehensible `*.msf` files alongside mbox files with same basename. The latter are vast and chock-full of complex formatting. Deleted messages are simply marked and not removed until compaction. `*.sbd` are subfolders.

### sqlite files
    fd -tf -e db . $JHThb -x du -h
    fd -tf -e sqlite . $JHThb -x du -h

#### dumps
    sqlite3 $JHThb/abook.db .dump > $jtCP/WAN/Thunderbird/db_dumps/abook.sql
    sqlite3 $JHThb/abook.v2.db .dump > $jtCP/WAN/Thunderbird/db_dumps/abook_v2.sql
    sqlite3 $JHThb/abook.v3.db .dump > $jtCP/WAN/Thunderbird/db_dumps/abook_v3.sql
    sqlite3 $JHThb/cert9.db .dump > $jtCP/WAN/Thunderbird/db_dumps/cert9.sql
    sqlite3 $JHThb/content-prefs.sqlite .dump > $jtCP/WAN/Thunderbird/db_dumps/content-prefs.sql
    sqlite3 $JHThb/cookies.db .dump > $jtCP/WAN/Thunderbird/db_dumps/cookies.sql
    sqlite3 $JHThb/key4.db .dump > $jtCP/WAN/Thunderbird/db_dumps/key4.sql
    sqlite3 $JHThb/impab.v3.db .dump > $jtCP/WAN/Thunderbird/db_dumps/impab_v3.sql
    sqlite3 $JHThb/openpgp.sqlite .dump > $jtCP/WAN/Thunderbird/db_dumps/openpgp.sql
    sqlite3 $JHThb/places.sqlite .dump > $jtCP/WAN/Thunderbird/db_dumps/places.sql

##### global-messages-db - *_content
    sqlite3 $JHThb/global-messages-db.sqlite '.dump conversationsText_content' > $jtCP/WAN/Thunderbird/db_dumps/global-messages-db-conversationsText_content.sql  # message subject lines
    sqlite3 $JHThb/global-messages-db.sqlite '.dump messagesText_content' > $jtCP/WAN/Thunderbird/db_dumps/global-messages-db-messagesText_content.sql  # message contents

partially intelligible, can't correlate them

##### global-messages-db - full dump
    sqlite3 $JHThb/global-messages-db.sqlite .dump > $jtCP/WAN/Thunderbird/db_dumps/global-messages-db.sql

over 200k lines, so not finding a sufficiently large `redrawtime`

## run safely
    $OSAB/nodes-jo/wm/TS/thunderbird_safely.sh
    $machine\T91\runSafely.ps1

# Zimbra Modern Web App - Raccourcis - toutes les applications
- All Applications
- `m` Move items
- `c`/`nm` Rédiger
- `gc` Calendrier
- `gm` Mail
- `go` Préférences

# Zimbra Modern Web App - Preferences / Préférences
- `Général > Type de client`
    - `Évolué (Ajax)` doesn't seem to work in Firefox
    - `Standard (HTML)`
- `Raccourcis` / `Zimbra Keyboard Shortcuts`

