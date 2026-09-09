vim: nospell:

    $misc/CP/QR; m4ps 0 1

syntax of this long file is ensured in `$vfv/filetype.vim`

    $ITmore/CP/fonts-SE595756-fontcharlist
    fzf -h
    fzf --version

- regular expressions
- Software Engineering Stack Exchange

# audio
    exiftool -ver  # https://sno.phy.queensu.ca/~phil/exiftool/
    spectroterm -h

## AAC
- Advanced Audio Coding
- `.3gp`, `.m4a`, `.m4b`, `.m4p`, `.m4r`, `.m4v`, `.mp4`

## text-to-speech
    espeak "Hello World!"

### French
    espeak -v fr "Votre texte à lire..."
    espeak -v fr+f2 "Bonjour tout le monde"

# AV
    $ITref/HW/audio/BT_headphones/JBLTune720BT

## mediainfo
    mediainfo --Inform='Video;%FrameCount%' $the_file
    mediainfo --Output='General;%Duration%' <avfile>  # milliseconds

## mpv
    $ITcop/forMSWin/AV > mpv-*/doc
    mpv <audio.ogg>
    mpv --list-options
    $misc/CP/mpv.conf

- can play omv's
- mpv.io

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
    s        => screenshot
    v        => toggle subtitle
    j/J      => cycle subtitles tracks
    ?        => toggle some help

#### OSD
    delete => show progress bar
    o    => show progress bar
    O    => show time/total

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
- `/`,`9`,`wheel_down` -2
- `*`,`0`,`wheel_up` +2

### not in PS
    mpv -h  # --help
    mpv -V  # --version

## OBS Studio Settings
- `Alt+f` (= `File`) > `s` (= `Settings`) > `Output` > `Recording`
    - `Audio Encoder`
        - `AAC (Default)`
        - `Opus` (= `libopus`) supposedly better, but less devices can play
    - `Recording Path` > `/home/jo`
    - `Recording Quality`
        - `High Quality, Medium File Size` I've been using for a few years
        - `Same as stream` - turns off `Audio Encoder` settings
    - `Video Encoder` > `Software (x264 low CPU usage preset, increases file size)`

## OpenShot
crossfades are created in overlaps

### Export
- `ctrl+e` = `Export`
- `ctrl+p` = `Choose Profile`
- `ctrl+shift+s` = `Save Project As`

#### Quality
- `Low` is small and blurry
- `Med` is comes out around 10x bigger
- `High` is 4x bigger again, but good

### Nikon CoolPix P7700 VGA 640x480
    Target > AVI (mpeg4)
    Video Profile > VGA Widescreen NTSC (854x480)

### Preferences
- `ctrl+shift+p` (= `Edit > Preferences`)
- need to `Restart` `OpenShot` when changed

### Profiles
`*assets` folders can be deleted

#### Choose Profile
    ctrl+p

- `HD 720p 30 fps (1280x720)` the default
- `HD 1080p 30 fps (1920x1080)`
- `VGA NTSC (640x480)` 29.97fps

### projects
    $ITcore/OpenShot
    pkill openshot  # when it's struggling to find project files...

fix `path` in the `*.osp`

## VLC Player
- `a`  cycle through aspect ratios
- `b`  to rotate through audio tracks
- `f`  toggle fullscreen
- `j`/`k`  decrease/increase audio delay
- `v`  cycle through subtitles
- `ctrl+j` codec info
- `ctrl+p` Preferences
- `ctrl+q` Quit

### seeks En
- 3s: `shift+left/right`
- 10s: `alt+left/right`
- 1m: `ctrl+left/right`

### seeks Fr
- 3s: `shift+left/right`
- 10s: `alt+left/right`
- 1m: `ctrl+left/right`
- 5m: `altGr+left/right`

### speed
- `-`  slow down by .1x
- `+`  speed up by .1x for each press
- `=`  returns speed to normal

# BBCode
    $vfv/ftplugin/bbcode.vim
    [b]bolded[/b]
    [code]some_code[/code]
    [h]heading[/h]
    [ins]inserted[/ins]
    [quote]quote[/quote]
    [url=https://en.wikipedia.org]English Wikipedia[/url]

# colours
- Closest Named Web Colors
- CSS Colors
- Shades of black
- web colors
- X11 color names

# documenting
    $ITref/CP/documenting/asciidoc.adoc

## ebook
    7z x document.epub

### Calibre
    ~/CalibreLibrary

E-book viewer

#### keyboard shortcuts
- `<esc>`/`<right_click>` brings up the controls
- `Ctrl+Q` Quit calibre

## LaTeX
    $ITref/CP/documenting/TeX/LaTeX/learn-latex.tex
    $Drpbx/search/dts-tex.ffl  # for my files
    $ITmore/CP/TeX/LaTeX/  # for example code
    :s/μ/\\mu{}/g
    albatross -a a256 ┊ # coloured output
    albatross -b 0 ┊ # no box
    arara
    xc

### commands
    \begin{itemize}
      \tightlist
      \item stuff
    \end{itemize}

    \documentclass[a5paper]{article} % smallest
    \documentclass[12pt,twoside,a4paper]{article}
    \listfiles  in preamble gets package versions in  .log
    \newenvironment{<envName>}[<n>][<default>]{<beginEnv>}{<endEnv>}
    \overfullrule=2mm  % adds a black bar to locate an overfull hbox
    \tableofcontents*  % ToC without itself listed therein
    \textsubscript{}
    \textsuperscript{}
    \the\length  % prints that length
    \title{your title} ... \begin{document} ... \maketitle
    \today
    \usepackage{<package>}

#### figure environment
> LaTeX Warning: 'h' float specifier changed to 'ht'.

    \begin{figure}[h] ... \end{figure}

- `h` place (approximately) here
- `t` place at top of page

#### horizontal - alignements
    \centred{\rule{9cm}{0.4pt}}  % horizontal line
    \centering
    {\raggedleft{SomeText}\par}

#### horizontal - indents
    \noindent
    \setlength{\parindent}{0pt}
    \setlength{\parindent}{-3em}  % starts left of margin
    \leftskip=1cm ... \leftskip=0cm
    \rightskip=1cm ... \rightskip=0cm

#### horizontal - spaces in text or math mode
    \enspace =>.5em
    \quad => 1em
    \qquad => 2em

#### sections
    \section*{ unnumbered section }
    \setcounter{secnumdepth}{3} % = default. 0 turns numbering off.
    \stepcounter{section} % increase section number by 1

`titlesec`: `\titleformat{\section}{\normalfont\Large\bfseries}{\thesection}{1em}{}`

#### vertical
    \vfill
    \vspace{-1cm}

##### parskip
    \parskip=5pt  % slightly more than usual from here on
    \the\parskip

    \newlength{\defaultparskip} \setlength{\defaultparskip}{\parskip} \setlength{\parskip}{5pt}
    ...
    \setlength{\parskip}{\defaultparskip} % back to normal

#### fonts & glyphs
    \textnumero

style `\textnormal`

##### Indic
    FreeFont

`Lohit` used by Wikipedia

##### styles
    \textit{...}

`\textbf{...}` = `{\bfseries ...}` = bold
`\texttt{...}` = `{\ttfamily ...}` = monospaced

##### sizes
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

#### maths environments
    \longrightarrow
    \rightarrow

#### page
    \pagebreak
    \pagestyle{empty}  % no headers or footers from here (can be in the preamble)
    \thepage

##### columns
    \documentclass[...twocolumn...]{<class>}
    ...
    \setlength{\columnsep}{1cm}
    ...
    \onecolumn  % triggers newpage
    ...
    \twocolumn  % triggers newpage

###### multicols
    \usepackage{multicol}
    ...
    \begin{document}
    \begin{multicols}{3}
    ...
    \end{multicols}

#### special characters
- `-`, `--`, `---`
- `\#`, `\$`, `\%`, `\&`, `\_`, `\{`, `\}`
- `\^{}` because `\^a` rends â
- `\~{}` because `\^n` rends ñ
- `\textbackslash{}` because `\\`

### distro - MiKTeX
    initexmf --report
    miktex --version

#### FNDB
    initexmf --update-fndb
    miktex --verbose fndb refresh
    MiKTeX Console > Tasks > Refresh file name database

after filename changes in `$tex`

#### MiKTeX Package Manager
    C:\Users\troin\AppData\Local\MiKTeX\miktex\log\mpmcli.log
    mpm --list > "$ITcore\MSWin\MiKTeX\$Cn-packages-$(Get-Date -f yyMMdd-hhmm).txt"
    miktex --verbose packages check-update
    miktex packages list | measure | select -expand Count

### distro - TeX Live
    fmtutil --all
    fmtutil --help

### engines
    pdflatex --version
    pdflatex <path>/<texfile>  # outputs compilation results in  <path>/

### lengths
- `1cm` = `28.4pt`
- `1pt` = `.35146mm`
- `em` ~ width of M
- `ex` ~ height of x

### tables
    $ITmCP/TeX/LaTeX/Memoir/tabular_in_twocolumn.tex

#### tabular environment
    \multicolumn{num_cols}{alignment}{contents}
    \renewcommand{\arraystretch}{1.5}  % tabular (default 1.0)

```
\begin{tabular}{c|l|r}
  \hline
  centred & left & right \\
\end{tabular}
```

#### multirow
    \multirow{<num_rows>}{<width>}{<contents>} % * for default width
    \usepackage{multirow}

## LibreOffice
    r ~/.config/libreoffice/4/user/

- `$cITCP/documenting/LibreOffice/` for `Buildup.txt` & `scratch.odt`
- `alt+f12` = `Outils`/`Tools > Options`
    - `Apparence`
- `alt+t > e` = `Tools > Extensions` (= `ctrl+alt+e`)
- `ctrl+5` = `View > Sidebar` toggle
- `ctrl+alt+e` = `Tools > Extension Manager...`
- `shift+ctrl+S` = `Fichier > Enregistre sous` / `File > Save As...`
    - `Document texte ODF XML plat (*.fodt)`
    - (only if changes to `.ods` already saved) select `Text CSV (.csv)`

### AZERTY
- `alt+o > l` = `Modules complémentaires et thèmes`
- `alt-t` (= `Format`) `> p` (= `Style de page...` = `alt+P`)

### Calc
    fd -H ods

- open a `.csv` and numbers get prefixed with apostrophe, so
    1. select the range
    1. `ctrl+h`
        1. Find: `.+`
        1. Replace: `$0`
        1. other options: Current selection only, Regular expressions
        1. `Replace All`

### Draw
- curve: `left-click > [shift] move > left-click > move > double-left-click`
- `F2` (= `Insert > Text Box`)

### page style
- `alt+o` (= `Format`) `> p` (= `Page style...`)
    - `Page` is where can set borders
- `alt+t` (= `Format`) `> p` (= `Style de page...`)
- No icon for the toolbars...

### porting
    \user\config
    ~\AppData\Roaming\LibreOffice\4\user\registrymodifications.xcu

### Writer
`alt+v t x` = `View > Toolbars > Text Object` which doesn't persist...

#### margins
right-click on a hyperlink for `Remove Hyperlink`

##### margins
1. save as `*.fodt`
2. open that `*.fodt` in a `Vim` variant
    1. `/orientation` - there might be more than one
    2. `:s!2cm!4cm!g`
    3. `:w`
3. back in `Writer`, `alt+f` (= `Fichier`) > `r` (= `Recharger`)

## PDFs
    pdf-crop-margins pdf.pdf  # silently makes  pdf-cropped.pdf

- `pdftl`
- use Google Chrome to break out just some pages into a reduced copy

### pdfimages
    pdfimages -h
    pdfimages [-j/-png] pdfNam3.pdf imageName  # pulls out images (default ppm) separated (if there are any)

from `poppler-utils`

### PDFtk
    pdftk in.pdf burst  # breaks into individual pages
    pdftk in*.pdf cat output out.pdf  # concatenate a sequence of PDFs
    pdftk secure.pdf input_pw <password> output normal.pdf

can't focus on pages

### fix rotations
    pdftk leftRotated.pdf cat 1-endeast output horizontal.pdf
    pdftk leftRotated-rightRotated.pdf cat 1east 2west output horizontal.pdf

## spelling
    dict -D
    typos -h
    typos -*  # in a directory
    typos --files

### Hunspell
    hunspell -h
    hunspell -D
    hunspell -l <file>
    nuspell -D

## Unicode
- finding characters
- Wingdings

# Emacs - commands
    $misc/CP/Emacs/init.el

- `C-*`  calc-dispatch
- `C-g`  keyboard-quit
- `C-x C-c`  quit
- `M` = `Alt` on Windows keyboards
- `M-w`  copy
- `M-x display-time-world`  times around the world
- `M-x kill-emacs`  force quit
- `W`  browse-url-of-dired-file

## buffers
- `C-x b`  switch buffer
- `C-x C-b`  list buffers
- `C-x k`  kill buffer
- `M-x minimap-mode`

## calendar
- `C-@`  set mark
- `M-=`  days to or from mark
- `M-x calendar`
- `q`  quit

### diary
- `d`  diary-view-entries
- `m`  diary-mark-entries
- `s`  diary-show-all-entries
- `u`  calendar-unmark

### info
- `a`  holidays
- `M-x`  sunrise/sunset
- `p c`  ISO date
- `p d`  day of year
- `p f`  date in French
- `p o`  mb with date in various forms
- `S`  sunrise/sunset for point

### movements
- `.`  today
- `< or >`  left or right
- `C-x [ or ]`  previous or next year
- `M { or }`  back or forward 1m
- `n C-n`  move ahead n weeks

### Dashboard
- `b`  Bookmarks
- `r`  Recent Files
- `return`  open
- `tab / shift-tab`  next / previous item

## directories files
- `C-x C-r`  recentf-open-files
- `M-#`  sr-speedbar-toggle

### Dired
- `C-x d (= M-x dired)`  dired
- `Dired+: (`  toggle details

#### Dired
- `?`
- `C-x C-f`  find-file
- `g`  reload
- `q`  quit
- `W`  browse-url-of-dired-file

### files
- `C-x C-r`  recentf-open-files
- `C-x C-s`  save-some-buffers

### VC Directory Mode
- `C-x v d`  vc-directory
- `C-x v v`  vc-next-action

## elisp
    (blah blah blah)  ; comment
    (face-remap-add-relative 'default :family "Arial" :height 140)
    (font-family-list)

- `C-u C-x C-e`  evaluate expression and insert result at point
- `M-:`  M-x eval-expression

## help
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

## fonts in GUI
- `C-u C-x <equals>`  details of face under cursor
- `M-: (face-attribute 'default :font)`
- `M-: (print (font-family-list))`
- `M-x customize > Faces`
- `M-x describe-face`
- `M-x describe-font`  narrowable list of ISO font names
- `M-x menu-set-font`  interactive Pick a font popup
- `M-x set-frame-font`  narrowable list of ISO font names
- `M-x variable-pitch-mode`  toggles it

### size
- `C-mouse wheel`
- `C-x C-+/-/0`  grow/shrink/reset font

## minibuffer
- `C-h v command-history`
- `C-x ESC ESC`  repeat-complex-command
- `M-x list-command-history`

## modes
    C-h v minor-mode-list

### Markdown Mode
- `S-tab`  rotate buffer visibility
- `tab`  rotate subtree visibility

### Org-mode
- `C-c C-n/p`  next/previous heading
- `C-c C-x C-v`  org-toggle-inline-images
- `S-tab`  rotate buffer visibility
- `tab`  rotate subtree visibility

## movements
- `C-b C-f`  back/forward character
- `C-a/e`  start/end of line
- `C-n/p`  next/previous line
- `C-v M-v`  next previous screen
- `M-b M-f`  back/forward word
- `M-< M->`  start end of buffer

## packages
    M-x describe-package <package>

### straight.el
- can deleted `~/.emacs.d/straight/*` - it'll be rebuilt
- can deleted `build` - it'll be rebuilt from `repos`
- no built in documentation

### list-packages
    M-x list-packages
    M-x package-list-packages

#### commands
- `//`  clear filter
- `/k` = `package-menu-filter-by-keyword`
- `/N <regex>`  filter
- `/u` = `package-menu-filter-upgradable`
- `RET`  help for package
- `U` = `package-menu-mark-upgrades` - mark available upgrades
- `x`  do upgrades

### Paradox
    M-x paradox-list-packages

#### commands
- `h`  help
- `v`  visit homepage

## text
- `C-@ or C-SPC`  mark
- `C-_`  undo
- `C-k`  kill-line
- `C-x h`  mark entire buffer
- `M-y`  yank-pop

### search & replace
- `C-r`  isearch-backward
- `C-s`  isearch-repeat-forward
- `M-%`  query-replace
- `M-s o (= M-x occur) > regex`  buffer shows lines containing regex

## windows
- `C-x 0`  delete-window
- `C-x 1`  delete-other-windows
- `C-x o`  other-window

# Emacs - Evil
- `$nDrGRs/emacs/emacs-evil-evil/evil-maps.el`
- `C-z`  toggles it

# Emacs - reference sheets
    $DWp/pn/unix-like/linux/gnu_project/emacs/emacs.dw

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

# file contents - ripgrep
    o $RIPGREP_CONFIG_PATH
    rg -- ---@ $DWp
    rg -h  # -help
    rg -V  # --version

## nodes
- `--no-ignore`
- `--one-file-system` don't cross file system boundaries
- `-.` (= `--hidden`)
- `-d NUM` (= `--max-depth=n`) `0` limits to given paths
- `-L` (= `--follow`) symlinks
- `-u (= `--unrestricted) = `--no-ignore`
- `-uu` = `--no-ignore -.`
- `-uuu` = `--binary --no-ignore -.`

### file types
    rg --type-list  # $vfv/syntax/rgtl.vim
    rg <options> <pattern> [<path>]

- `.dw` not known
- no group for gitconfigs
- `-t<type>` (= `--type=<type>`
- `-T<type>` (= `--type-not=<type>`

### globs
- `-g` (= `--glob=<glob>`) `'!dir/dir'`
- `--iglob=<glob>` (like using `--glob-case-insensitive`)

## output
- `-A n` (= `--after-context=n`)
- `-B n` (= `--before-context=n`)
- `-C n` (= `--context=n`)
- `--field-match-separator=':::'` - avoiding the often ambiguous :
- `--files-without-match`
- `-l` (= `--files-with-matches`)
- `-m n` (= `--max-count=n`) matches/file
- `-N` (= `--no-line-number`)
- `-r <replacement>` (= `--replace=<replacement>`) in output
- `-v` (= `--invert-match`) prints lines that don't match
- `--sort=<by>` `modified`, `none`, `path`
- `--sortr=<by>` descending
- `--trim` leading whitespace

## regex
- Crate
- `-i` (= `--ignore-case`)
- `-U` (= `--multiline`) searching across multiple lines
    - `--multiline-dotall`  . matches line terminators
- `-w` (= `--word-regexp`) use word boundaries
- `-x` (`--line-regexp`) = `^search$`

### case
- `-i` (= `--ignore-case`)
- `-s` (= `--case-sensitive`) default
- `-S` (= `--smart-case`)

## searches
    rg '<someText>|<otherText>'  # searches recursively in files
    rg '\.emacs\.d'
    rg --no-ignore 'sometext'  # allows searching into gitignored places
    rg -i <case-insensitive>
    rg -tconfig  # search in *.config's
    rg -thtml -tcss <webish>
    rg -tmd '[\p{Devanagari}]'  # finds Devanagari characters
    rg -tmd '\$Sig'
    rg -tmd '\{TNW}'
    rg -ttxt grow
    rg -uu <someText>  # ignores ignore files, and searches in hidden stuff
    rg <someText> **/*.ext
    rg 'url = ' **\*.git\config

in JH: `$Drpbx/search/searches.md`

# file contents - toolong
    tl $TeNo/md-JH-Private/Private.md

no refresh

# file manage
    openssl sha3-256 <file>
    zoxide -h  # --help
    zoxide -V  # --version
    zoxide edit  # <esc>

- `felix`: `ZZ` quits
- `PeaZip`: `Ctrl+l` = `Extract all`

## archive
    ouch help

### 7-Zip
    7z  # help
    7z x <pw'd_zip>

    7z.exe a -mx0 -p"password" passworded.zip node_to_pw_zip

#### compression
- `-mx0` none (copy)
- `-mx9` ultra

### comic book
- `.cb7`, `.cbr`, `.cbt`, `.cbz`
- `Yazi` decompresses them to folder

## fd
    $Drpbx/search/searches.md
    fd ' \(2\)'  # as created by  Insync
    fd 'Chris Rea'
    fd [flags/options] [<pattern>] [<path>...]
    fd -H Ruby $home

- case insensitive until a capital is included
- in JH: `$Drpbx/search/searches.md`
- recursive by default
- sharkdp/fd
- Ubuntu: `fdfind -V`

### man
- `--xdev` (= `--mount` = `--one-file-system`)
- `-a` (=`--absolute-path`)
- `-d1` = depth 1 (current dir)
- `-e <ext>` (= `--extension`)
- `-E` (= `--exclude`) `<unquoted_glob>`
- `-p`, `--full-path` full path (instead of name only)
- `-H` (`--hidden`)
- `-I` = `--no-ignore` = don't respect `.(fd|git)ignore`
- `-i`, `--ignore-case` (default: smart case)
- `-L` follow links into symlinked directories
- `-td` type dir
- `-te` type empty file
- `-tf` type file
- `-tl` type symlink
- `-tx` type executable
- `-u` (not listed in `-h`) = `--unrestricted` = `-HI`

#### exec
- `-x` (= `--exec`) <cmd> for each search result
- `-X` (= `--exec-batch`) <cmd> all search results at once
- `{}` path of the search result
- `{.}` without the file extension

### recent changes
    fd --changed-within 3h
    fd -H --changed-within 9m
    fd -tf --changed-within 2d

### symlinks
    fd --max-depth 1 -Hl -tl
    fd -H -tl  # only found targets, broken ones with red background
    fd -Hl -tl  # show supposed link source

## lf file manager
    lf -help
    lf -version
    $HADL/lf/lfrc

by gokcehan

### commands
- `c` (`clear` paths in buffer)
- `c-l` (`redraw`)
- `c-r` (`reload`) refresh
- `d` (`cut`)
- `gh` (`cd ~`)
- `i` open in pager
- `p` (`paste`)
- `r` (`rename`)
- `y` (`copy`)
- `zh` (`set hidden!`) toggles

## lnav
- `f`/`F` next/previous file
- `f1` LNAV(1)
- `q` quit

## The Platinum Searcher
    pt
    pt /version
    pt Solange .

## Recoll
    recoll -h
    recoll -q innovate &
    recoll -v
    recollindex -h
    recollindex -z  # rebuild the index

## sharkdp/bat
    bat --list-themes
    bat -h

## superfile
    spf

### internal commands
- `:` command execution bar
- `?` help
- `f` toggle preview window
- `m` metadata toggle focus
- `n` new file panel
- `o` sort options
- `p` processes toggle focus
- `s` sidebar toggle focus
- `w` close file panel
- `<tab>` switch to file panel

## Vifm help
- can't quit to current directory
- VIFM(1)

### commands
- `cw`  rename
- `p`  copy here
- `P`  move here
- `tab`  switch pane
- `yy`  yank file
- `ZQ`  `:quit!`
- `ZZ`  `:quit`
- `<space>`/`<tab>` switches pane

## Yazi
    yazi --debug

- `.` = `hidden toggle`
- `enter`/`o` = `open`
- `a` = `create` directory/ or file
- `d` = `remove` to trash
- `r` = `rename` selected files
- `z` = `plugin fzf`
- `Z` = `plugin zoxide`

### searching
- `c-s` = `escape --search`
- `s` = `search --via=fd`
- `S` = `search --via=rg`

# GnuPG
    <key-id> can be the short key id = the last 8 characters, or part of the email
    echo "encrypt me this" | gpg -ase -r 13F327EF -o gpg.asc
    gpg --delete-key <key-id>
    gpg --refresh-keys  # from keyservers - useful if I've updated on another machine
    gpg --send-keys <key-id>  # then can never be deleted from the keyserver
    gpg --verify file.asc [file]

GNU Privacy Guard

## 13F327EF
- my currently active key
- passphrase in `$TeNo/md-JH-Private/Private.md`

### in $Enc/Secure1/GnuPG/13F327EF
    gpg --list-packets sprbMbArch-ob8-private.asc
    gpg --show-keys sprbMbArch-ob8-public.asc

## command options
`-s` (`--sign`) sign a message

### options for output
`-o <file>` (`--output <file>`) write output

#### format
- `-a` (`--armor`) ASCII armored
- default is binary OpenPGP

## edit a key
    gpg --edit-key <key-id>

### commands
    expire > 2y

- `key n` can get at `ssb` (= subkey)
- `n` can get at `sec` (= primary key)

## export / import
    gpg -ao backup.asc --export-secret-keys --export-options backup <id>  # incudes trust
    gpg -ao private.asc --export-secret-keys <id>
        gpg --import private.asc > passphrase  # also bring in public key
    gpg -ao public.asc --export <id>

## gpg-agent
    $OSL/nodes/gpg-agent.conf
    gpg-agent -h

## help
    gpg --dump-options
    gpg --version
    gpg -h

The GNU Privacy Handbook

## key servers
    gpg --search-keys <key-id>  # enter number of key imports it (or just Enter to quit)

- <https://keys.openpgp.org/>
- Hockeypuck OpenPGP keyserver <https://keyserver.ubuntu.com>
- MIT PGP Public Key Server <http://pgp.mit.edu/>

## show stuff
    gpg --export-ownertrust  # shows trust settings
    gpg --fingerprint jh  # neater fingerprint output
    gpg --list-sigs  # --list-keys --with-sig-list
    gpg -k [<key-id>]  # --list-keys
    gpg -K  # --list-secret-keys

# HW
    duf (--all)  # storage devices info

## keyboard
    y $ITref/HW/cbh-keyboards

dead keys circumflex/diaresis (between `P` & `$`): press before letter to be decorated

## for paper - Epson EcoTank ET-5170 - feed tray
    "$ITref/HW/forPaper EpsonEcoTankET5170"

- downside is printed
- landscape top is to right
- portrait top is to back of printer

## for paper - HP ENVY 5532
- place DL envelopes with the open side to the left
- printed pages come out head first (= upside down, printed face up)

## for paper - HP Envy Inspire 7220e
- 300gsm loses 5mm from during feed in, occasionally jams, pulls right end in more causing 2mm tilt
- landscape top is to right
- Paper jams cause a reprint from the beginning of a series!

## screens
Sony Xperia 10 II: 1080x2520 = 21:9

### widescreen 16:9
- 1920x1080

## Sony WH-CH520
    za $ITref/HW/audio/SonyWHCH520/print.pdf

- 5s press of `Power/Bluetooth` button resets into pairing, Passkey `0000`
- (p110) Resetting the headset: plug in 5V power & press `vol+` & `vol-`
- (p110) Initializing the headset to restore factory settings: 10s press of `power` & `vol-`

# imagey
    $ITcop/CP/svg-flags-flat-png
    fd -utf -e bmp -e gif -e jpeg -e jpg -e png -e svg -e tiff -e webp > images.fetl
    mmdc --version
    qrtool encode "https://harriott.github.io" > $Jwk/IT/going_faster.png
    qrtool -h

- 72 dpi = 18.3 dots per mm
- COLOR TOOLS <http://html-color-codes.info/>
- HEIF (High Efficiency Image File Format): `.avci`, `.avcs`, `.avif`, `.avifs`, `.heic`, `.heics`, `.heif`, `.heifs`
- JPEG compression: `.jfif` `.jif` `.jpe` `.jpeg` `.jpg`
- OpenEXR: `.exr`

## aspect ratios
- `1.3∙:1` =`4:3`
- `1.7∙:1` =`16:9` = `widescreen`

## GIMP fr
`Alt+i` (= `Image`) > `n` (= `Transformer`)
    - `a` (= `Rotation 90° sens anti-horaire`)
    - `h` (= `Rotation 90° sens horaire`)

## GIMP gb
`t` (= `Tools` > `Text`) can then select a rectangle for a text layer

### crop
    shift+c

`Fixed Aspect ratio > 700:333` (as for `Mastodon` header image) triggers a selection box of that ratio

### export
    ctrl+shift+e

`alt+f` (= `File`) > `x` (= `Export As...`)

### paint tools
- `alt+t p` (= `Tools` > `Paint Tools`)
- `n` (= `Tools` > `Paint Tools` > `Pencil`)
- `p` (= `Tools` > `Paint Tools` > `Paintbrush`)

#### straight line
- `mouse click` for starting point then `shift` previews a new straight line, next `mouse click` draws it
- need to clear a remaining text layer

## ImageMagick
    identify -format '%w %h %f \n' *  # images listed by size
    montage <left> <right> -geometry +9+9 -tile 2x1 <lr>
    montage <upper> <lower> -geometry +0+0 -tile 1x2 <ul>

imagemagick.org/Color

### gravity
    magick -list gravity

`-gravity northwest`  the default

### magick
    -background <color>
    -bordercolor white -border 90x90
    -draw 'text xpixels,ypixels "label"'
    -fill blue -draw 'rectangle x1,y1 x2,y2'  - the coordinates are diagonal opposites
    -font Arcon
    -gravity center
    -size 640x480

    magick -flatten img.png img-white.png
    magick -list format  # all of them
    magick -pointsize 72 label:inch_high  inch_high.gif
    magick -size 100x100 plasma: plasma1.jpg
    magick -size 100x100 xc:wheat -annotate +20+10 '100x100mm' 100x100.png
    magick -size 1000x1000 xc:azure -pointsize 60 -annotate +500+500 'annotate_normal' -annotate 90x90+500+500 'annotate_90x90' -annotate 270x270+500+500 'annotate_270x270' 1000x1000+rotatedTexts.png
    magick -version
    magick <image> -background azure -gravity south -splice 0x80 <SBordered>
    magick rose: -background blue -splice 20x10+40+30 splice.gif
    magick wizard: wizard.png  # makes it

    label:"some text"

can convert from `heic`, `WebP`

### resize
    magick <image> -resize wxh! <image_forced>  # anisotropic resize (ignore original aspect ratio)
    magick <image> -resize xh <width_automagically_scaled_to_height>

## MyPaint
- `ctrl+s` = `File > Save`
- `d` = `Brush > Decrease Brush Size`
- `f` = `Brush > Increase Brush Size`
- `z` = undo
- `Save` pads out right & bottom images that aren't up to 1024x512...

## Oculante
- can't send to printer
- nice looping through folder
- no crop
- `q` to exit

## resolutions
    resolution |              name |    FFmpeg | aspect ratio
       480x270 |                   |           |         16:9
       640x360 |                   |           |         16:9
       640x480 |                   | sntsc/vga
       800x450 |                   |           |         16:9
       852x480 |                   |      wvga
       854x480 |             FWVGA |           |         16:9
       960x540 |                   |       qhd |         16:9
      1280x720 |              720p |     hd720 |         16:9
      1366x768 |                   |      wxga |         16:9
      1600x900 |               HD+ |      wxga |         16:9
     1920x1080 |     1080p Full HD |    hd1080 |         16:9
     1920×1200 |                   |           |        16:10
     1920×1440 |                   |           |          4:3
     2560x1440 |                   |           |         16:9

## XnView MP
- `Enter` toggles Explorer
- `F12` = `Tools > Settings...`
- "Multi-Platform"
- no easy invert

# sqlite3
    sqlite3 <db.db>
    sqlite3 -help
    sqlite3 -version
    sqlite3 some.db .dump > some.sql  # which can then be grepped

## internal commands
    .exit
    .help
    .quit

# Stack Exchange Network
- `@petersmith` = Peter Smith
- CommonMark Implementations
- `highlight.js`

# system
    btm
    fastfetch -c neofetch.jsonc
    fastfetch -h

# terminal - Alacritty
    alacritty -V

- `Ctrl+Shift+b` = `SearchBackward`, then `Esc`
- `Ctrl+Shift+space` = `ToggleViMode`

## font
- `Ctrl+-` = `DecreaseFontSize`
- `Ctrl+0` = `ResetFontSize`
- `Ctrl+=` = `IncreaseFontSize`

## scroll
- `Shift+PageDown/Up` = `ScrollPageDown/Up`
- `Shift+End/Home` = `ScrollToBottom/Top`

# terminal - Chafa
    chafa -h  # --help
    chafa --version
    chafa <image>

# terminal - glow
    glow -v

in a directory, `glow` for navigating in & out of md's

# terminal - kitty
    kitten choose-fonts
    kitten icat <image>

# terminal - less
greenwoodsoftware

## commands
    /pattern
    ?pattern

- `h` help
- `n`/`N` next/previous

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

# terminal - mcat
    mcat -h
    mcat ls  # shows image thumbnails

can show first page of a PDF

# terminal - rainbow
    cat $ITsto/diskUsage.build | rainbow
    rainbow some atrociously long text
    whereis rainbow

# terminal - tdf
    $AjB/bashrc-wm
    tdf -h

in an image-capable terminal, `tdf <pdf>`

# terminal - WezTerm
    wezterm -h
    wezterm -V

`wezterm -n` (`--skip-config`)

## key assignents
- `alt+enter` = `ToggleFullScreen`
- `ctrl -/+` = `DecreaseFontSize`/`IncreaseFontSize`
- `shift PageDown` = `ScrollByPage=1`
- `shift PageUp` = `ScrollByPage=-1`

### copy/paste
- `ctrl shift c` = `CopyTo="Clipboard"`
- `ctrl shift v` = `CopyFrom="Clipboard"`
- `ctrl shift x` = `ActivateCopyMode`
- mouse select

### panes
- `ctrl alt "` = `SplitVertical...` down
- `ctrl alt %` = `SplitHorizontal...` right
- `ctrl alt shift arrow` = resize pane
- `ctrl shift arrow` = move to pane
- `ctrl shift z` = `TogglePaneZoomState` get `[Z]` prefixed in window title

### tabs
- `ctrl PageDown` = `ActivateTabRelative=-1`
- `ctrl PageUp` = `ActivateTabRelative=1`
- `ctrl shift t` = `SpawnTab="CurrentPaneDomain"`
- `ctrl shift tab` = `ActivateTabRelative=-1`
- `ctrl tab` = `ActivateTabRelative=1`

## panes
- `wezterm cli move-pane-to-new-tab` defaults to current pane
- `wezterm cli spawn --cwd $PWD --new-window` spawn using cwd

# text wrangling
    ! " # $ % & ' ( ) * + , - . /
    ----10--------20--------30--------40--------50--------60--------70--------80--------90-------10
    ----10--------20--------30--------40--------50--------60--------70--------80--------90-------100-------110-------120-------130-------140-------150-------160
    ansifilter <file_to_strip_of_ANSI_terminal_escape_codes>
    textidote -h

- ASCII Table
- carriage return (U+000D) returns the cursor to the left of the line (usually just before line feed on MSWin)
- `chmln.sd`
- finding characters
- Tree-sitter CLI: `tree-sitter -h` (`--help`)

## Vim
    $HOME/_viminfo
    ----10--------20--------30--------40--------50--------60--------70--------80--------90-------10
    echo $MYVIMRC
    gci -r tags -force | where { ! $_.PSIsContainer } | select -expandProperty fullname > tags-Win10.txt
    [g]vim .  # will open netrw on current directory
    nvim -v  # --version
    vim -u NONE  # skip all initialisations

`^M` carriage return

### gVim
    gvim -O <textfile0> <textfile1>  # opens them in a vertical split
    gvim -S <savedSession>

#### window size
    gvim -geometry 200x55
    PS> gvim -c "set columns=217 lines=54"  # maximum on a 1600x900 screen with rhs taskbar

# WAN
    curl -h
    curl ifconfig.co/city
    curl ifconfig.co/country
    librespeed-cli -h
    librespeed-cli --secure
    ssh-keygen -lv -f ssh_host_rsa_key.pub  # shows fingerprint & ASCII art
    trashinbox
    whois 1.1.1.1
    whois 8.8.8.8


- GPS Coordinates <https://www.gps-coordinates.net>
- RustDesk: ID is persistent, 6-letter pw renews on each launch
- Webmasters

## aria2
    aria2c -h

### input file
    aria2c -i zips

if aborted, `for f in *; do sed -i "/$f/d" zips; done`

## browsing
    $cITCP/WAN/browsers/browsers.txt

`KeePassXC` "Getting Started Guide"

### Browsh
    browsh https://www.brow.sh

- better page layout than `w3m`
- `ctrl+q` quits
- doesn't work from `Neovide`
- only one connection through Firefox allowed

### Carbonyl
    carbonyl -h
    carbonyl http://harriott.github.io

- arrow keys & mouse
- `ctrl+c` to exit
- images are crudely represented

### chromium-based - Google Chrome
    chrome://apps/
    chrome://flags
    chrome://on-device-internals
    chrome://plugins/
    chrome://settings/cookies > See all site data and permissions

- `about:gpu` -> `chrome:gpu`
- `chrome://system > extensions > Expand` a list of Extensions
- `Ctrl+h` (= `chrome://history`)
- `Ctrl+Shift+o` (= `Bookmarks`) `> Organise > Export`
- `Ctrl+Shft+r` hard refresh, overriding the cache
- `Ctrl+u` view page source in new tab
- no way to stop autoplay of videos

#### text size - gb
- `Ctrl+0` reset
- `Ctrl+-` smaller
- `Ctrl++` bigger

#### text size - fr
- `Ctrl+à` reset
- `Ctrl+)` smaller, but not working on Arch
- `Ctrl+=` bigger

### chromium-based - Microsoft Edge
    edge://favorites/
    edge://history/all
    edge://settings/profiles

- `Importer les données du navigateur maintenant`
- `mouse hover over an image > ctr ctrl` = `right-click > magnify`

### Firefox
fr: `clique droit sur un onglet > Ajouter un vue scindée`

#### gb
    about:config > caret
    about:addons
    about:preferences#general
    about:preferences#privacy > Cookies and Site Data
    about:preferences#sync
    about:processes
    about:profiles
    ctrl+p > Destination > Save to PDF > Save

- `alt+e` (= `Edit`) `> n` (= `Settings`) `> Privacy & Security > Cookies and Site Data > Manage Data...`
- `Ctrl+Shft+a` (= `Add-ons and themes`)
- `Ctrl+Shft+b` (= `toggle Bookmarks Toolbar`)
- `Ctrl+Shft+o` (= `Library`)
- `Ctrl+Shft+r` hard refresh, overriding the cache
- `F12` (= `Web Developer Tools`)

### lynx
    lynx http://invisible-island.net/lynx

- `?`/`h` help screen
- `qq` quits

### Vivaldi
- `alt+p` (= `Settings`) `> Search > [ Google up to top and Set as Default , DuckDuckGo next, Wikipedia third ]`
- `ctrl+b` (= `Manage Bookmarks`)

## cloud storage - Dropbox Shared folder MSWin - desktop.ini
    ls -force -s desktop.ini | %{ ii (Split-Path $_.FullName -Parent) }

they're immediately recreated if Deleted

## cloud storage - rclone
    $misc/CP/rclone.md
    rclone config file  # shows path
    rclone ls <far> # detailed recursive
    rclone lsd <far> # top-level directories
    rclone lsf <far> # top-level nodes
    rclone sync -cinPvv <near> <far> # detailed check

- `-c` (`--checksum`) & size
- `-i` (`--interactive`) gets a question for each file
- `-n` (`--dry-run`)
- `-P` (`--progress`)

## GitHub
`$HOME/.ssh/known_hosts`: `AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa`

<https://github.com/github/linguist/blob/master/lib/linguist/languages.yml>

### CLI
    gh --version
    gh -?
    gh api -X PUT /notifications  # cleared my ghost notifications
    gh auth status
    gh browse  # opens the repository root in web browser
    gh config list
    gh extension list
    gh repo list  # handy list of your repositories
    gh repo view  # in a repository, returns the README
    gh status  # of me on other's repositories
    git diff upstream/master...HEAD

#### gh s
    gh s -E -u @me
    gh s yarnpkg/berry

`Enter` quits, printing that URL

## Google Sheets
    wget https://docs.google.com/spreadsheets/d/DOCID/export?format=tsv&gid=SHEETID

`Share > General access > Restricted` change to `Anyone with the link`

## radio-active
    radio --last  # run playing last station
    radio --list  # list favourites
    radio --remove  # launch favourite removal dialog
    radio -S bbc  # search for BBC stations
    radio -S fip

### in-player commands
- `f` = add to favourites
- `q`, `ctrl+c` = quit
- `t` = track info

## WhatsApp
    Settings > Chats > Enter is send

- control of `disappearing messages` only by administrators: `Group info > Group permissions > Edit group settings > off`
- controle des `messages éphémères` seul par les administrateurs: `Infos du groupe > Autorisations du groupe > Modifier les paramètres du groupe > éteint`

### group members
    Firefox: Inspect (Q) > Copy > Inner HTML
    Google Chrome: right-click > Inspect > ...
    Microsoft Edge: alt+f > l > o

## wikitext
```
<code>inline monospaced</code>
```

<https://en.wikipedia.org/wiki/Help:Wikitext>

## wttr.in
    curl wttr.in/London
    curl wttr.in/Newcastle

## YouTube
file formats

### shortcuts
- `0 .. 9`  jump 0% .. 90%
- `c`  toggle captions
- `f`  toggle full screen
- `j/l`  seek 10s backwards or forwards
- `m`  toggle mute
- `when paused: ./,`  skip to next/previous frame

Keyboard shortcuts for YouTube

## yt-dlp
    yt-dlp --dump-json video_ID_or_URL | jq --raw-output ".chapters[].title"

desideratus

### Linux
    $AjB/bashrc-wm
    yt-dlp -f best <videoURL>
    yt-dlp --cookies-from-browser Firefox -S "height:720" https://youtu.be/xxxxxxxxxxx  # if age-restricted
    yt-dlp -f ba <videoURL>  # bestaudio (= best*[vcodec=none])
    yt-dlp -h
    yt-dlp --version

### MSWin10
    $MSn\PS\Profile.ps1
    y --version

# web serving - Caddy
    $jtIT/WAN/WebDesign/Caddy
    caddy  # help
    caddy version
    localhost:2019  # default for the API

## Caddyfile
- `caddy adapt` outputs JSON from a Caddyfile
- `caddy fmt -d` (`--diff`)
- `caddy fmt -h` (`--help`)
- `caddy fmt -w` (`--overwrite`) corrects to tabs

- no leading or trailing empty lines

## serve
    caddy reload
    caddy stop
    pgrep caddy
    pkill caddy

`caddy start` prefer over `caddy run &`

