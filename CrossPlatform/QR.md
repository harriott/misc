vim: nospell:

    $onGH/misc/CrossPlatform; m4ps 0 1

- `HP ENVY 5532 > Wireless Settings > Settings > Advanced > IP Settings > OK > Manual` allows tweaking of printer's address
- regular expressions
- Stack Exchange Network
- syntax of this file is ensured in `$vimfiles/filetype.vim`

# colours
- Closest Named Web Colors
- Shades of black
- web colors

# documenting
    LibreOffice Calc > alt+o p (= Format > Page Style) > Page
    pdf-crop-margins pdf.pdf  # silently makes  pdf-cropped.pdf

## eBook
`Foliate` - mouse to top for settings

### Calibre
    ~/CalibreLibrary

E-book viewer `<esc>` brings up the controls

## LaTeX
    $Drpbx/JH/dts-tex.txt
    :s/μ/\\mu{}/g
    xc

### commands
    \begin{figure}[h] \includegraphics[width=0.5\textwidth]{image} \end{figure}
    \newenvironment{<envName>}[<n>][<default>]{<beginEnv>}{<endEnv>}
    \pagebreak
    \pagestyle{empty}  % no headers or footers from here
    \renewcommand{\arraystretch}{1.5}  % tabular (default 1.0)
    \section*{ unnumbered section }
    \stepcounter{section} % increase section number by 1
    \tableofcontents*  % ToC without itself listed therein
    \textbf{...}
    \textit{...}
    \textsubscript{}
    \textsuperscript{}
    \the\length  % prints that length
    \today
    \usepackage[dvipsnames]{xcolor}
    \usepackage{soul}  % Hyphenation for letterspacing, underlining, and more
    \usepackage{titlesec}  % incompatible with memoir
    \vfill

#### horizontal spaces in text or math mode
    \enspace =>.5em
    \quad => 1em
    \qquad => 2em

#### font sizes
    \tiny
    \scriptsize
    \footnotesize
    \small
    \normalsize
    \large
    \Large
    \LARGE
    \huge
    \Huge

#### geometry
    hmargin={<left margin>,<right margin>}
    vmargin={<top margin>,<bottom margin>}
    top=20mm

#### indents
    \noindent
    \setlength{\parindent}{0pt}
    \leftskip=1cm ... \leftskip=0cm
    \rightskip=1cm ... \rightskip=0cm

#### multicols
    \usepackage{multicol}
    ...
    \begin{document}
    \begin{multicols}{3}
    ...
    \end{multicols}

### engines
    pdflatex --version

#### MiKTeX
    initexmf --report
    miktex --version
    miktex --verbose fndb refresh

##### FNDB
    initexmf --update-fndb
    MiKTeX Console > Tasks > Refresh file name database

after filename changes in `$tex`

##### MiKTeX Package Manager
    C:\Users\troin\AppData\Local\MiKTeX\miktex\log\mpmcli.log
    mpm --list > "$ITstack\MSWin\MiKTeX\$Cn-packages-$(Get-Date -f yyMMdd-hhmm).txt"
    miktex --verbose packages check-update
    miktex packages list | measure | select -expand Count

### fonts - Indic
    FreeFont

`Lohit` used by Wikipedia

### package - blindtext
    \blinddocument
    \Blinddocument
    \blindtext
    \Blindtext[5]
    \usepackage[bible]{blindtext}

### package - Memoir
    \defaultlists
    \documentclass[20pt,a4paper,article,extrafontsizes]{memoir}
    \tightlists

#### sectioning
    \chapterstyle{article}

##### lower level headings
    \setaftersubsecskip{0em}  % text follows heading inline
    \the\setaftersubsecskip
    afterskip
    beforeskip

##### default fonts
- sec: `\Large\bfseries`
- subsec: `\large\bfseries`
- subsubsec: `\bfseries`

#### simple footer
    \usepackage{currfile}
      \makeevenfoot{plain}{}{\cg {\currfilename}}{}
       \makeoddfoot{plain}{}{\cg {\currfilename}}{}

might require `[article]`

### package - pdfpages
    \includepdf[options]{<pdf>}

doesn't respect `geometry` margins, so `\includepdfset{offset=<fromInnerEdge> <fromTop>}`

# Emacs
    sl C:\Users\troin\AppData\Roaming\.emacs.d
    emacs $TeNo/TN/Emacs/org/org.org &

## commands
- `C-*`  calc-dispatch
- `C-g`  keyboard-quit
- `C-x C-c`  quit
- `M-w`  copy
- `M-x calendar`
- `M-x display-time-world`  times around the world
- `M-x kill-emacs`  force quit
- `W`  browse-url-of-dired-file

### buffers
- `C-x b`  switch buffer
- `C-x C-b`  list buffers
- `C-x k`  kill buffer
- `M-x minimap-mode`

### calendar
- `C-@`  set mark
- `M-=`  days to or from mark
- `q`  quit

#### diary
- `d`  diary-view-entries
- `m`  diary-mark-entries
- `s`  diary-show-all-entries
- `u`  calendar-unmark

#### info
- `a`  holidays
- `M-x`  sunrise/sunset
- `p c`  ISO date
- `p d`  day of year
- `p f`  date in French
- `p o`  mb with date in various forms
- `S`  sunrise/sunset for point

#### movements
- `.`  today
- `< or >`  left or right
- `C-x [ or ]`  previous or next year
- `M { or }`  back or forward 1m
- `n C-n`  move ahead n weeks

#### Dashboard
- `b`  Bookmarks
- `r`  Recent Files
- `return`  open
- `tab / shift-tab`  next / previous item

### directories files
- `C-x C-r`  recentf-open-files
- `M-#`  sr-speedbar-toggle

#### Dired
- `C-x d (= M-x dired)`  dired
- `Dired+: (`  toggle details

##### Dired
- `?`
- `C-x C-f`  find-file
- `g`  reload
- `q`  quit
- `W`  browse-url-of-dired-file

#### files
- `C-x C-r`  recentf-open-files
- `C-x C-s`  save-some-buffers

#### VC Directory Mode
- `C-x v d`  vc-directory
- `C-x v v`  vc-next-action

### elisp
    (blah blah blah)  ; comment
    (face-remap-add-relative 'default :family "Arial" :height 140)
    (font-family-list)

- `C-u C-x C-e`  evaluate expression and insert result at point
- `M-:`  M-x eval-expression

### help
- `C-h b`  describe-bindings
- `C-h i`  info
- `C-h f`  describe-function
- `C-h k`  describe-key
- `C-h m`  describe-mode
- `C-h p`  finder-by-keyword
- `C-h r`  info-emacs-manual
- `C-h v`  describe-variable
- `C-h a`  apropos-command
- `C-h w`  where-is
- `M-x help m`

variables: `system-type`, `window-system`

### fonts
- `C-u C-x <equals>`  details of face under cursor
- `M-: (face-attribute 'default :font)`
- `M-: (print (font-family-list))`
- `M-x customize > Faces`
- `M-x describe-face`
- `M-x describe-font`  narrowable list of ISO font names
- `M-x menu-set-font`  interactive Pick a font popup
- `M-x set-frame-font`  narrowable list of ISO font names
- `M-x variable-pitch-mode`  toggles it

#### size
- `C-mouse wheel`
- `C-x C-+/-/0`  grow/shrink/reset font

### minibuffer
- `C-h v command-history`
- `C-x ESC ESC`  repeat-complex-command
- `M-x list-command-history`

### modes
    C-h v minor-mode-list

#### Markdown Mode
- `S-tab`  rotate buffer visibility
- `tab`  rotate subtree visibility

#### Org-mode
- `C-c C-n/p`  next/previous heading
- `C-c C-x C-v`  org-toggle-inline-images
- `S-tab`  rotate buffer visibility
- `tab`  rotate subtree visibility

### movements
- `C-b C-f`  back/forward character
- `C-a/e`  start/end of line
- `C-n/p`  next/previous line
- `C-v M-v`  next previous screen
- `M-b M-f`  back/forward word
- `M-< M->`  start end of buffer

### packages
    M-x describe-package <package>

no built in documentation for `straight.el`

#### list-packages
    M-x list-packages
    M-x package-list-packages

##### commands
- `//`  clear filter
- `/k` = `package-menu-filter-by-keyword`
- `/N <regex>`  filter
- `/u` = `package-menu-filter-upgradable`
- `RET`  help for package
- `U` = `package-menu-mark-upgrades` - mark available upgrades
- `x`  do upgrades

#### Paradox
    M-x paradox-list-packages

##### commands
- `h`  help
- `v`  visit homepage

### search & replace
- `C-r`  isearch-backward
- `C-s`  isearch-repeat-forward
- `M-%`  query-replace
- `M-s o (= M-x occur) > regex`  buffer shows lines containing regex

### text
- `C-@ or C-SPC`  mark
- `C-_`  undo
- `C-k`  kill-line
- `C-x h`  mark entire buffer
- `M-y`  yank-pop

### windows
- `C-x 0`  delete-window
- `C-x 1`  delete-other-windows
- `C-x o`  other-window

## Evil
- `$GHrUse/emacs/emacs-evil-evil/evil-maps.el`
- `C-z`  toggles it

# Emacs reference sheets
- <http://www.rgrjr.com/emacs/emacs_cheat.html>
- <https://www.emacswiki.org/emacs/Reference_Sheet_by_Aaron_Hawley>

# Emacs - Spacemacs
- `c-x c-c`  quit
- `sp b b`  list buffers
- `sp b d`  kill the current buffer
- `sp b n`  switch to next buffer (avoiding special buffers)
- `sp b p`  switch to previous buffer (avoiding special buffers)
- `sp b Y`  copy whole buffer
- `sp f e e`  ~/.spacemacs.env

Spacemacs documentation

# encoding
    yj -ty <file.toml >file.yml

- <http://daringfireball.net/projects/markdown/syntax>
- `*.oma` = Sony OpenMG

## Bluefish
    alt+e (= Edit) > s (= Preferences...)
    bluefish -v

## ffmpeg
    -vf crop=iw:ih-80:0:0
    ffmhb -i <video> -vf 'scale=iw/2:ih/2' <same_video_with_half_the_frame_size>
    ffmhb -i <video> -vframes 1 frame.jpg  # extracts a single frame
    ffmpeg -version | xcol --enable-libvorbis

- `-filter:a afftdn=nr=90:nf=-20` removes white noise
- `-r ntsc` = 29.97 fps (= 30000/1001)
- `-t` length of output
- `-vf crop=width:height:x:y` height=depth below y

### concatenation protocol
    ffmhb -i "concat:1.mpg|2.mpg|3.mpg" -c copy o.mpg

convert mp4's first to MPEG-2 transport streams (`ffmhb -i 1.mp4 -c copy 1.ts`) and concatenate them back to an mp4

### ffprobe
    ffprobe -v error -show_format -show_streams <videoFile>
    man ffprobe

### transpose
- `0`  90° counter clockwise and vertical flip (default)
- `1`  90° clockwise
- `2`  90° counter clockwise
- `3`  90° clockwise and vertical flip

## Git
    gh repo clone
    git -P <command>  # --no-pager
    git branch -a  # lists local & remote branches
    git branch -m <new_name_of_branch>
    git clone https://github.com/... [target_directory] --depth=n  # clones only to commit depth n
    git grep <caseSensitiveText>
    git init -b gh
    git push gh +master  # force push to remote
    git rev-parse --show-toplevel  # print the top level directory of the current repository
    git show <pathToFile>  # highlights the changes
    git submodule
    git version

- GitLab Markdown
- <https://github.com/github/linguist/blob/master/lib/linguist/languages.yml>
- <https://ndpsoftware.com/git-cheatsheet.html>

### commits
    git checkout <commit>  # go back to the commit (hash or tag)
    git checkout master  # return to current state of project
    git grep Log $(git rev-list --all) -- '*.ps1'  # searches all  ps1  files in all commits for "Log"
    git log -- *pdf  # shows if any PDF's have been inadvertently included
    git log --follow *spacemacs*
    git log --follow '*cmusq.vim'
    git log --follow *Colette*
    git log -3 --pretty="format:%C(auto)%h %as" -- */syntax/sh.vim  # last 3 dates of change
    git log -S <string>
    git reset HEAD~1  # throw away last commit, keeping changes for a better one
    gitk &  # GUI showing files in each commit

### configurations
    find . -wholename '*.git'
    find . -wholename '*.git/config' > gitconfig-all.txt
    find . -wholename '*.gitignore' > gitignore-all.txt
    find . -wholename '*.git/config' | wc -l
    gci -r .git | select fullname
    gci -r .gitignore | select fullname
    git remote -v
    git remote rename origin gh
    grep -rl --include "config" harriott . > gitconfig-harriott.txt

#### lf
- `autocrlf = input`  warning: CRLF will be replaced by LF
- `eol = lf`

#### settings for MSWin
    fgrep -rl --include "config" 'harriott' | xargs fgrep -rl 'symlinks'
    grep -rl --include "config" ignorecase . | wc -l
    grep -rl --include "config" symlinks . | wc -l

#### gitconfig
    $machine\troin\gitconfig
    git config -l
    git hist
    git lg

##### linux
    r ~/.ssh

`$machBld/jo/gitconfig` inludes `$onGH/misc/CrossPlatform/gitconfig`

### the index
    git checkout-index -f <somefile>  # overwrite from the index's copy
    git ls-files
    git reset  # clears all staged files
    git rm --cached -r .  # empties the index

#### damaged
    del .git\index
    git reset

### tig
Tig Manual

#### commands
- `t`  tree view
- `j/k/-/space/home/end`  movements

## Go
    go env
    go version

## Java
    java -version
    PS> where.exe java

## npm
    npm prefix -g
    npm up -g  # upgrade
    npm -g list
    npm --version
    which npm
    wikit mooji -b

### ffmpeg-concat
- `-d <transition_duration>` default `500`
- `-o <out_file>` default `out.mp4`
- `-t <transition_name>` default `fade`

### cspell
    cspell trace "colour"  # shows which dictionary it's in
    cspell check <filename>
    cspell lint --help

## Pandoc
`--fail-if-warnings`  exit with error status if there are any warnings

### verbose
    [makePDF] Source:
    ...
    \end{document}

## Perl
    echo "my_string" | perl -pe 's/my/your/g'
    echo 'hello  there' | perl -pe 's/ +/ /'
    echo hello | perl -nle 'print uc'
    for ...  # = foreach ...
    perl -de 0  # debug
    perl -e 'print reverse <>' <file_to_reverse>
    perl -le 'print a..z'

### Commant Prompt
    set TERM=dumb  # allows Perl stuff to run without Terminal Size warnings

### inform
    perl -h  # summary of options
    perl -v
    perldoc -f <function>
    perldoc perldoc
    perldoc perlmodlib  # bundled modules
    perldoc perlrun
    where.exe perl

#### @INC
    perl -e 'print join qq/\n/, @INC'
    perl -le '$,="\n"; print @INC'

#### modules
    cpanm <moduleName>  # gets it

##### list
    cpan -l > $machine\troin\cpanList.txt
    instmodsh  # followed by l

### PS
    perl -e 'print \"Hello World\"'
    perl -e "print qq(Hello, world!)"
    perl -i -ne 'printf q(%04d %s), $., $_' <file_needing_linenumbers>
    perl -ne 'printf' <file_to_print>

### regex
- `*`  0 or more times
- `+`  1 or more times
- `\d`  `[0-9]`
- `\n`  newline
- `\s`  space, tab, newline
- `\w`  alphanumeric or _
- `a{m,n}`  between m & n a's

<https://jkorpela.fi/perl/regexp.html>

### say
    say scalar @array;  # number of elements
    use feature 'say';

## Python
    o $WORKON_HOME
    pew ls
    pip --version
    pip list --outdated
    python "import sys; print (sys.path)"
    yaml2toml <yaml> <toml>

### MSWin
    C:\Windows\py.exe
    C:\Windows\pyw.exe

#### versions
    PS> .'C:\Program Files\Python310\python.exe' --version
    PS> C:\Users\troin\AppData\Local\Programs\Python\Python310-32\python.exe  # reports "32 bit"
    PS> where.exe python

### pipx
    ~/.local/pipx/venvs
    pipx list
    pipx run pycowsay moo
    pipx uninstall -h
    pipx upgrade-all

### versions
    ~\.pyenv
    pyenv rehash
    python  # reports "64 bit"
    python --version

### virtualenv
    cdvirtualenv  # goto the package directory
    deactivate
    lsvirtualenv  # lists the known environments

#### virtualenvwrapper
    deactivate
    mkvirtualenv <name>  # also activates it
    rmvirtualenv <name>
    which python
    workon  # activate (or list all)

## Ruby
    bundle exec github-pages versions
    bundle install  # recreates Gemfile.lock from Gemfile
    bundle outdated
    bundle show
    bundle update
    gem env
    gem list
    gem update
    ruby -v

## webish
    <a>anchor_link<a>
    js-beautify -f obfuscated.html -o beautiful.html

HTML Element

# file manage
sharkdp/bat

## The Platinum Searcher
    pt
    pt /version
    pt Solange .

## Vifm help
VIFM(1)

### commands
- `cw`  rename
- `p`  copy here
- `tab`  switch pane
- `yy`  yank file
- `ZQ`  `:quit!`
- `ZZ`  `:quit`

# Ghostscript convert pdf to png
    $ gspdfpng
    PS> gsp

# gpg
    <key-id> can be the short key id = the last 8 characters
    gpg --delete-key <key-id>
    gpg --send-keys key-id  # then can never be deleted from the keyserver
    gpg --verify file.asc [file]

## help
    gpg --dump-options
    gpg --version
    gpg -h

## options for output
`-o <file>` (`--output <file>`) write output

### format
- `-a` (`--armor`) ASCII armored
- default is binary OpenPGP

## edit a key
    gpg --edit-key <key-id>

### commands
    expire > 2y

- `key n` can get at `ssb` (= subkey)
- `n` can get at `sec` (= primary key)

## key servers
    gpg --search-keys <key-id>  # enter number of key imports it (or just Enter to quit)

- <https://keys.openpgp.org/>
- Hockeypuck OpenPGP keyserver <https://keyserver.ubuntu.com>
- MIT PGP Public Key Server <http://pgp.mit.edu/>

## show stuff
    gpg --export-ownertrust  # shows trust settings
    gpg --fingerprint jh  # neater fingerprint output
    gpg --list-sigs  # --list-keys --with-sig-list
    gpg -k  # --list-keys
    gpg -k | xcol 13F327EF expired expires jharr sprbMb
    gpg -K  # --list-secret-keys

# imagey
- 72 dpi = 18.3 dots per mm
- COLOR TOOLS <http://html-color-codes.info/>

## ImageMagick
    $CrPl/IMclf-sbMb.txt
    identify -format '%w %h %f \n' *  # images listed by size
    montage <left> <right> -geometry +9+9 -tile 2x1 <lr>
    montage <upper> <lower> -geometry +0+0 -tile 1x2 <ul>

### convert
    convert -flatten img.png img-white.png
    -background <color>
    -border 20x20
    -fill <color>
    -font Arcon
    -gravity center
    -pointsize 48
    -size 640x480
    label:"some text"

- anisotropic resize
- can convert from WebP

#### Bash
    convert -flatten transparent.png white_background.png
    convert -list
    convert -list color
    convert -list gravity
    convert <colourimage> -colorspace Gray <grayimage>
    convert <people> -paint 9 <people-oil>
    convert <positive> -negate <negative>
    for i in $(ls); do convert -resize 10% $i r$i; done
    for i in $(ls); do convert -resize 15% $i r$i; done
    for i in $(ls); do convert -resize 25% $i r$i; done
    for i in $(ls); do convert -resize 50% $i r$i; done

#### Powershell tiff -> jpg recursively convert
    gci -r *.tiff | %{ magick $_ $_'.jpg' }
    gci -r *.tiff | rm

### gravity
    convert -list gravity

`-gravity northwest`  the default

## VLC Player
- `-`  slow down by .1x
- `+`  speed up by .1x for each press
- `=`  returns speed to normal
- `A`  to Change Aspect ratio
- `b`  to rotate through Audio tracks
- `v`  to rotate through Subtitles

# internetworking
    curl ifconfig.co/city
    curl ifconfig.co/country

- <https://www.gps-coordinates.net>
- trashinbox

## GitHub
    gh config list
    git diff upstream/master...HEAD

`~/.ssh/known_hosts`: `AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa`

## ssg
    bundle exec jekyll s  # serve locally

Liquid template language

### Hugo
    hugo mod graph
    hugo mod tidy  # cleans  go.mod  and (re)generates  go.sum
    hugo server --help
    hugo server --navigateToChanged
    hugo server -D

## Thunderbird
    $CrPl/networking/Thunderbird/builds.txt
    C:\MozillaThunderbird\thunderbird.exe -addressbook
    thunderbird -addressbook

`$Drpbx/JH/TP-default-release/compatibility.ini` for LastVersion

### internal commands
    alt+t > a (= Add-ons Manager)
    alt+t > e (= Edit) > a a (= Account Settings)
    alt+t > Manually sort folders
    ctrl+Shft+B (= Address Book)
    Menu > File > Compact Folders
    right-click on folder > Properties > Repair Folder

#### Keyboard Shortcuts
- `Ctrl+R`  **R**eply (to sender only)
- `Ctrl+Shft+B`  Address **B**ook (like Bookmarks in Firefox)
- `Ctrl+Shft+F`  **F**ind in folder
- `m` toggles message read/unread
- `(Shift+)j`  (not) junk
- `s` toggles starring
- `f`/`p` goes to next/previous message

mozillamessaging

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

### View
    alt+v > s (= Sort by) > h (= Unthreaded)

#### body
    b (= Message Body As) >
      h (= Original HTML)
      p (= Plain Text)  - can then export & Delete inline images

## wttr.in
    curl wttr.in/London
    curl wttr.in/Newcastle

## yt-dlp
    i yt-dlp
    yt-dlp -F <videoURL>
    yt-dlp -f "[height<=?720]" <videoURL>
    yt-dlp -f best <videoURL>
    yt-dlp -f ba <videoURL>  # bestaudio (= best*[vcodec=none])
    yt-dlp --version

## YouTube shortcuts
- `0 .. 9`  jump 0% .. 90%
- `c`  toggle captions
- `f`  toggle full screen
- `j/l`  seek 10s backwards or forwards
- `m`  toggle mute
- `when paused: ./,`  skip to next/previous frame

Keyboard shortcuts for YouTube

# less
greenwoodsoftware

## PS>
    less --help

messes up if terminal is resized

## commands
`h`  help

### move
- `b`  back one window
- `space`  forward one window

### search
- `/ ?`  search forward backward
- `n N`  next previous

# OpenShot
crossfades are created in overlaps

## Export
- `ctrl+e` = `Export`
- `ctrl+p` = `Choose Profile`
- `ctrl+shift+s` = `Save Project As`

### Quality
- `Low` is small and blurry
- `Med` is comes out around 10x bigger
- `High` is 4x bigger again, but good

## Nikon CoolPix P7700 VGA 640x480
    Target > AVI (mpeg4)
    Video Profile > VGA Widescreen NTSC (854x480)

## Preferences
    ctrl+shift+p (= Edit > Preferences)

### Default Profile
- defaults to HD 720p 30 fps
- need to `Restart` `OpenShot` when changed

## Profiles
    $core/IT_stack/OpenShot

- `*assets` folders can be deleted

### Choose Profile
    ctrl+p

- `HD 720p 30 fps (1280x720)`
- `HD 1080p 30 fps (1920x1080)`
- `VGA NTSC (640x480)` 29.97fps

## projects
    pkill openshot  # when it's struggling to find project files...

fix `path` in the `*.osp`

# screens
Sony Xperia 10 II: 1080x2520 = 21:9

## widescreen 16:9
- 854x480
- 1280x720 = 720p = "HD Ready"
- 1600x900
- 1920x1080

# Stack Exchange Network
- `@petersmith` = Peter Smith
- CommonMark Implementations
- `highlight.js`

# text-to-speech
    espeak "Hello World!"

## French
    espeak -v fr "Votre texte à lire..."
    espeak -v fr+f2 "Bonjour tout le monde"

# text wrangling
- carriage return (U+000D) returns the cursor to the left of the line (usually just before line feed on MSWin)
- finding characters

## vim
    $HOME/_viminfo
    $ITstack/vimfiles/spell/fr.utf-8.add
    gci -r tags -force | where { ! $_.PSIsContainer } | select -expandProperty fullname > tags-Win10.txt
    [g]vim .  # will open netrw on current directory

`^M`  carriage return

### gVim
    gvim -O <textfile0> <textfile1>  # opens them in a vertical split
    gvim -S <savedSession>

#### window size
    gvim -geometry 200x55
    PS> gvim -c "set columns=217 lines=54"  # maximum on a 1600x900 screen with rhs taskbar

