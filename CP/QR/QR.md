vim: nospell:

    $misc/CP/QR; m4ps 0 1

syntax of this long file is ensured in `$vfv/filetype.vim`

    $JHt/IT/CP/fonts-SE595756-fontcharlist
    fzf -h
    fzf --version
    pdf-crop-margins pdf.pdf  # silently makes  pdf-cropped.pdf

- regular expressions
- Software Engineering Stack Exchange

# audio
    exiftool -ver  # https://sno.phy.queensu.ca/~phil/exiftool/

## AAC
- Advanced Audio Coding
- `.3gp`, `.m4a`, `.m4b`, `.m4p`, `.m4r`, `.m4v`, `.mp4`

## text-to-speech
    espeak "Hello World!"

### French
    espeak -v fr "Votre texte à lire..."
    espeak -v fr+f2 "Bonjour tout le monde"

# AV
    $cITcr/HW/audio/BTHeadphones/JBLTune720BT

## mediainfo
    mediainfo --Inform='Video;%FrameCount%' $the_file
    mediainfo --Output='General;%Duration%' <avfile>  # milliseconds

## mpv
    $cITcc/forMSWin/AV/mpv-x86_64-v3-20251207-git-dbd7a90/doc

    mpv <audio.ogg>
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
    o/O    => show time/total

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
    $core/IT_stack/OpenShot

`*assets` folders can be deleted

#### Choose Profile
    ctrl+p

- `HD 720p 30 fps (1280x720)` the default
- `HD 1080p 30 fps (1920x1080)`
- `VGA NTSC (640x480)` 29.97fps

### projects
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

# documenting - ebook
    7z x document.epub

## Calibre
    ~/CalibreLibrary

E-book viewer

### keyboard shortcuts
- `<esc>`/`<right_click>` brings up the controls
- `Ctrl+Q` Quit calibre

# documenting - LaTeX
    $DJH/search/dts-tex.ffl  # for my files
    $JHt/IT/CP/TeX/LaTeX/  # for example code
    :s/μ/\\mu{}/g
    xc

## chngcntr
    \counterwithout{section}{section} % (chngcntr) removes unneeded Chapter number for Sections

functionality included in Memoir

## commands
    \documentclass[a5paper]{article} % smallest
    \listfiles  in preamble gets package versions in  .log
    \newenvironment{<envName>}[<n>][<default>]{<beginEnv>}{<endEnv>}
    \overfullrule=2mm  % adds a black bar to locate an overfull hbox
    \tableofcontents*  % ToC without itself listed therein
    \textsubscript{}
    \textsuperscript{}
    \the\length  % prints that length
    \title{your title} ... \begin{document} ... \maketitle
    \today

### figure environment
> LaTeX Warning: 'h' float specifier changed to 'ht'.

    \begin{figure}[h] ... \end{figure}

- `h` place (approximately) here
- `t` place at top of page

### horizontal - alignements
    \centred{\rule{9cm}{0.4pt}}  % horizontal line
    \centering
    {\raggedleft{SomeText}\par}

### horizontal - indents
    \noindent
    \setlength{\parindent}{0pt}
    \setlength{\parindent}{-3em}  % starts left of margin
    \leftskip=1cm ... \leftskip=0cm
    \rightskip=1cm ... \rightskip=0cm

### horizontal - spaces in text or math mode
    \enspace =>.5em
    \quad => 1em
    \qquad => 2em

### sections
    \section*{ unnumbered section }
    \setcounter{secnumdepth}{3} % default
    \stepcounter{section} % increase section number by 1

`titlesec`: `\titleformat{\section}{\normalfont\Large\bfseries}{\thesection}{1em}{}`

### vertical
    \vfill
    \vspace{-1cm}

## distro - MiKTeX
    initexmf --report
    miktex --version
    miktex --verbose fndb refresh

### FNDB
    initexmf --update-fndb
    MiKTeX Console > Tasks > Refresh file name database

after filename changes in `$tex`

### MiKTeX Package Manager
    C:\Users\troin\AppData\Local\MiKTeX\miktex\log\mpmcli.log
    mpm --list > "$coreIT\MSWin\MiKTeX\$Cn-packages-$(Get-Date -f yyMMdd-hhmm).txt"
    miktex --verbose packages check-update
    miktex packages list | measure | select -expand Count

## distro - Tex Live
    fmtutil --all
    fmtutil --help

## engines
    pdflatex --version
    pdflatex <path>/<texfile>  # outputs compilation results in  <path>/

## fonts & glyphs
    \textnumero

style `\textnormal`

### Indic
    FreeFont

`Lohit` used by Wikipedia

### styles
    \textit{...}

`\textbf{...}` = `{\bfseries ...}` = bold
`\texttt{...}` = `{\ttfamily ...}` = monospaced

### sizes
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

## maths environments
    \longrightarrow
    \rightarrow

## page
    \pagebreak
    \pagestyle{empty}  % no headers or footers from here

### columns
    \documentclass[...twocolumn...]{<class>}
    ...
    \setlength{\columnsep}{1cm}
    ...
    \onecolumn  % triggers newpage
    ...
    \twocolumn  % triggers newpage

#### multicols
    \usepackage{multicol}
    ...
    \begin{document}
    \begin{multicols}{3}
    ...
    \end{multicols}

## special characters
- `-`, `--`, `---`
- `\#`, `\$`, `\%`, `\&`, `\_`, `\{`, `\}`
- `\^{}` because `\^a` rends â
- `\~{}` because `\^n` rends ñ
- `\textbackslash{}` because `\\`

## tables
    $jtCP/TeX/LaTeX/Memoir/tabular_in_twocolumn.tex

### tabular environment
    \multicolumn{num_cols}{alignment}{contents}
    \renewcommand{\arraystretch}{1.5}  % tabular (default 1.0)

```
\begin{tabular}{c|l|r}
  \hline
  centred & left & right \\
\end{tabular}
```

### multirow
    \multirow{<num_rows>}{<width>}{<contents>} % * for default width
    \usepackage{multirow}

# documenting - LibreOffice
    $cITCP/documenting/LibreOffice/Buildup.txt
    r ~/.config/libreoffice/4/user/

- `alt+f12` = `Outils`/`Tools > Options`
    - `Apparence`
- `alt+t > e` = `Tools > Extensions` (= `ctrl+alt+e`)
- `ctrl+5` = `View > Sidebar` toggle
- `ctrl+alt+e` = `Tools > Extension Manager...`
- `shift+ctrl+S` = `Fichier > Enregistre sous` / `File > Save As...`
    - `Document texte ODF XML plat (*.fodt)`
    - (only if changes to `.ods` already saved) select `Text CSV (.csv)`
- open a `.csv` with `Calc` and numbers get prefixed with apostrophe, so
    1. select the range
    1. `ctrl+h`
        1. Find: `.+`
        1. Replace: `$0`
        1. other options: Current selection only, Regular expressions
        1. `Replace All`
- Writer: right-click on a hyperlink for `Remove Hyperlink`

## AZERTY
- `alt+o > l` = `Modules complémentaires et thèmes`
- `alt-t` (= `Format`) `> p` (= `Style de page...` = `alt+P`)

## Draw
- curve: `left-click > [shift] move > left-click > move > double-left-click`
- `F2` (= `Insert > Text Box`)

## page style
- `alt+o` (= `Format`) `> p` (= `Page style...`)
    - `Page` is where can set borders
- `alt+t` (= `Format`) `> p` (= `Style de page...`)
- No icon for the toolbars...

## porting
    \user\config
    ~\AppData\Roaming\LibreOffice\4\user\registrymodifications.xcu

## Writer - margins
1. save as `*.fodt`
2. open that `*.fodt` in a `Vim` variant
    1. `/orientation` - there might be more than one
    2. `:s!2cm!4cm!g`
    3. `:w`
3. back in `Writer`, `alt+f` (= `Fichier`) > `r` (= `Recharger`)

# documenting - PDFs
use Google Chrome to break out just some pages into a reduced copy

## pdfimages
    pdfimages -h
    pdfimages [-j/-png] pdfNam3.pdf imageName  # pulls out images (default ppm) separated (if there are any)

from `poppler-utils`

## PDFtk
    pdftk in.pdf burst  # breaks into individual pages
    pdftk in*.pdf cat output out.pdf  # concatenate a sequence of PDFs
    pdftk secure.pdf input_pw <password> output normal.pdf

## fix rotations
    pdftk leftRotated.pdf cat 1-endeast output horizontal.pdf
    pdftk leftRotated-rightRotated.pdf cat 1east 2west output horizontal.pdf

# documenting - spelling
    dict -D
    typos -h
    typos -*  # in a directory
    typos --files

## Hunspell
    hunspell -h
    hunspell -D
    hunspell -l <file>
    nuspell -D

# documenting - Unicode
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
- `$cGRs/emacs/emacs-evil-evil/evil-maps.el`
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

# encoding
    /* a single-line CSS comment */
    code-minimap $misc/CP/QR/QR.md
    rustc -V  # --version
    wiki/JSON
    yj -ty <file.toml >file.yml
    zig version

- `*.oma` = Sony OpenMG
- `R`: `q("no")`

## Bluefish
    alt+e (= Edit) > s (= Preferences...)
    bluefish -v

## CMake
    cmake -h
    cmake /V

## doku/highlight
    highlight --syntax=bash <script_without_shebang>
    highlight --version
    highlight -h

### supported languages
- <http://www.andre-simon.de/doku/highlight/en/langs.php>
- no `csv`

## FFmpeg
    $cITCP/encoding/x264_fullhelp.txt
    ffi <audio_to_fade> -af 'afade=t=out:st=<seconds_to_start>:d=<seconds_duration>' -t <seconds_to_end> -y <audio_faded_out>  # <seconds_to_start> + <seconds_duration> = <seconds_to_end>
    ffi <video> -vf 'scale=iw/2:ih/2' <same_video_with_half_the_frame_size>
    ffi <video> -vframes 1 frame.jpg  # extracts a single frame
    ffmpeg -version | xcol --enable-libvidstab
    ffmpeg -version | xcol --enable-libvorbis

- concat protocol `ffi 'concat:1.avi|2.avi' -c copy concatenated.avi`
- `-filter:a afftdn=nr=90:nf=-20` removes white noise
- `-r ntsc` = 29.97 fps (= 30000/1001)
- `-t` length of output
- `-vf crop=width:height:x:y` where `height` = depth below y

### concatenation protocol
    ffmhb -i "concat:1.mpg|2.mpg|3.mpg" -c copy o.mpg

convert mp4's first to MPEG-2 transport streams (`ffmhb -i 1.mp4 -c copy 1.ts`) and concatenate them back to an mp4

### codecs
`MPEG` can use `-q:v n` (= `-qscale:v`) where `n` is from `2` (best) to `5` (good) to `31` (worst)

#### libx264
    -c:a copy -crf 18 -preset veryfast -vf 'scale=iw/2:ih/2'

`Advanced Video Coding` (`H.264`, using `x264` encoder)

##### converting to mp4
> -qscale is ignored, -crf is recommended.

`-c:v libx264` seems to not be needed

##### options
- Constant Rate Factor (CRF)
    - `-crf 0` = lossless
    - `-crf 18` = minimum advised, visually perfect
    - `-crf 20` = good compromise
    - `-crf 23` = default
    - `-crf 28` = maximum advised
    - `-crf 51` = worst
    - adding/subtracting 6 halves/doubles the bitrate
- `- preset` speed vs compression
    - `medium` = default
    - `slow`
    - `veryfast` seems fine for `OPPO A76`

### ffprobe
    ffprobe -h  # vast
    ffprobe -v error -show_format -show_streams <videoFile>
    ffprobe -version
    man ffprobe

### transpose
- `0`  90° counter clockwise and vertical flip (default)
- `1`  90° clockwise
- `2`  90° counter clockwise
- `3`  90° clockwise and vertical flip

## Git
    git -P <command>  # --no-pager
    git branch --show-current
    git branch -a  # lists local & remote branches
    git branch -m <new_name_of_branch>
    git grep <caseSensitiveText>
    git init -b gh  # --initial-branch=<branch_name>
    git push gh +master  # force push to remote
    git restore .  # from index into cwd
    git rev-parse --show-toplevel  # print the top level directory of the current repository
    git show <pathToFile>  # highlights the changes
    git status -bs  # --branch --short
    git submodule
    git version
    onefetch -h

- GitLab Markdown
- <https://ndpsoftware.com/git-cheatsheet.html>

### commits
    $vimfiles; git log -3 --pretty="format:%C(auto)%h %as" -- */syntax/sh.vim  # last 3 dates of change
    git log -- *pdf  # shows if any PDF's have been inadvertently included
    git log --follow *spacemacs*
    git log --follow '*cmusq.vim'
    git log --follow *Colette*
    git log -1  # credentials of last commit
    git reset HEAD~1  # throw away last commit, keeping changes for a better one
    git rev-parse --short HEAD  # the short commit hash
    gitk &  # GUI showing files in each commit

#### diff-options
    git log -p -Sfoo --output=pickaxe  # then open that file & search for foo
    git log -S<change_string>  # reports commits that added or removed it

#### grep
    git grep Log $(git rev-list --all) -- '*.ps1'  # searches all  ps1  files in all commits for "Log"

in `$cITCP/networking/browsers`, `git grep activeInstall $(git rev-list --all) -- 'browsers.txt'`

#### move around
    git checkout -q HEAD^1  # go back one commit
    git checkout -q HEAD~9; git rev-parse --short HEAD  # go back 9 commits and print the short hash
    git checkout <commit>  # go back to the commit (hash or tag)
    git checkout master  # return to current state of project
    git checkout master  # return to current state of project

### configurations
    :%s#https://github.com/#git@github.com:#g

#### gitconfig
    $cITCP/encoding/gitconfig-JH
    $misc/CP/gitconfig
    git config -l  # --list
    git config -l --global
    git hist
    git lg

#### lf
- `autocrlf = input`  warning: CRLF will be replaced by LF
- `eol = lf`

### the index
    git checkout-index -f <somefile>  # overwrite from the index's copy
    git ls-files
    git reset  # clears all staged files
    git rm --cached -r .  # empties the index

#### damaged
    del .git\index
    git reset

### lazygit
- `Tab`/`left-arrow` & `Shift-Tab`/`right-arrow` rotates through the left column of panes
- `?` adaptive help - <esc> quits it
- `q` quits

no search functionality

### remotes
    gh repo clone
    git clone https://github.com/... [target_directory] --depth=n  # clones only to commit depth n
    git pull --unshallow
    git remote -v
    git remote add upstream https://github.com/...
    git remote rename origin gh
    git remote show  # reports name set in  .git/config

git-fetch

### tig
Tig Manual

#### commands
- `t`  tree view
- `j/k/-/space/home/end`  movements

## Go
    go env
    go version

### Hugo
    hugo mod graph  # dependencies
    hugo mod tidy  # (re)creates  go.mod  &  go.sum
    hugo server  # baseURL  must be defined to get  http://localhost:1313/
    hugo server -p 1314  # http://localhost:1314/
    hugo version
    rm -r public, hugo  # repopulates  public/

- `hugo -b http://...` overrides `baseURL` defined in a `config.toml`
- "Page Not Found" if no theme...

## gnuplot
    $cITcr/CP/gnuplot
    $jtCP/gnuplot
    gnuplot -e 'set terminal'  # lists those available
    gnuplot -e 'show datafile commentschars'
    gnuplot -e 'show loadpath'
    gnuplot -e 'show palette'
    gnuplot -e 'test' -persist  # terminal
    gnuplot -e 'test palette' -persist
    gnuplot -h
    gnuplot -V

`.gpi` can't parse Bash environment variables

### commands
    q[uit]

## Java
    java -?
    java -version
    PS> where.exe java

## JavaScript - Node.js
    node -h  # --help
    node -v  # --version

### npm
    npm install
    npm ls -g
    npm un[install] -g [<package>]
    npm up[date] -g [<package>]
    npm prefix -g  # =  npm config get prefix
    npm -v  # --version
    npx cowsay goodbye!''

package manager

#### Astro
    npm run dev -- -h  # --help
    npx astro --help
    npx astro --version
    npx astro docs  # launches Astro Docs
    npx astro info  # environment

##### development server
    http://localhost:4321
    npm run dev
    npx astro dev

- gets dev toolbar at bottom
- HMR ensures instant updates

## Lua
    $cITCP/encoding/dpl/scratch.lua
    $cGRs/CP/Vim/vim-vim/src/testdir/testluaplugin/lua/testluaplugin/hello.lua
    lua -v

## markdown
- <https://github.com/github/linguist/blob/master/lib/linguist/languages.yml> dosini
- <http://daringfireball.net/projects/markdown/syntax>

### Markdown Guide
- <https://www.markdownguide.org/basic-syntax/>
- <https://www.markdownguide.org/extended-syntax/>

## Pandoc
    $cGRs/d-CP/r-jgm-pandoc
    $core/IT/CP/Pandoc/monofont.md
    $core/IT/CP/Pandoc/weird.gfm
    pandoc --version

`--fail-if-warnings`  exit with error status if there are any warnings

### verbose
    [makePDF] Source:
    ...
    \end{document}

## Perl
    $cITCP/encoding/dpl/Perl/scratch0.pl
    $jtCP/coding/Perl
    cpanm --help
    perl -?

- command prompt, `set TERM=dumb` allows Perl stuff to run without Terminal Size warnings
- `q(a b c)` = `a b c`
- `qq(a b c)` = `"a b c"`
- `qw(a b c)` = `('a', 'b', 'c')`
- `File::Find` - `$onGH/FM-underscores/underscores.pl`
- `ppm` Perl Package Management

### arrays
    @array = (1, 2, 3, 4, 5);
    print $array[0];   # Prints 1
    print $array[3];   # Prints 4
    print $array[-1];  # Prints 5

### commands
    die('died for debugging');
    for ...  # = foreach ...
    print lc("String to Lowercase")
    print length($string)."\n";

#### conditionals
    if ( expr ) { action }
    if ( expr ) { action } else { action }
    if ( expr ) { action } elsif ( expr  ) { action } ... else { action }
    unless ( expr ) { action }

##### comparison Operators
    numeric string
    ==      eq
    !=      ne
    <       lt
    >       tt
    <=      le
    >=      ge
    <=>     cmp

#### file tests
- `-e $node` exists
- `-z $node` zero size
- `-s $node` returns size in bytes
- `-f $node` is a file
- `-d $node` is a directory
- `-l $node` is a symlink

#### loops
    last;  # break
    next;  # continue
    while ($boolean) {...}

#### regex
- `*`  0 or more times
- `+`  1 or more times
- `\d`  `[0-9]`
- `\n`  newline
- `\s`  space, tab, newline
- `\w`  alphanumeric or _
- `a{m,n}`  between  m  &  n  a's
- `^abc|abc$` abc at start or end

<https://jkorpela.fi/perl/regexp.html>

##### accented characters
    $ echo 'aà cç eé eè' | perl -pe 's/[^\P{Latin}A-Za-z]/-/g'
    $ echo 'aà cç eé eè' | perl -pe 's/\p{Latin}/-/g'

#### say
    say scalar @array;  # number of elements
    perl -e 'use feature "say"; say "said";'

replaces `print "$var\n";`

### Data::Printer
    perl -e 'use DDP; p @{[ one, two, three ]};'

arrays containing tabbed values can get messy: `perl -e 'my @tabbedArray = ( "short1st\tlong_second_item", "super_extra_long_first_item\tshort2nd", "12\textra_long_second_item" ); use DDP; p @tabbedArray;'`

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

### one-liners
    $ echo sample_text | perl -pe 's/(sample).*/$1/'  # double quotes wouldn't work here
    echo "my_string" | perl -pe 's/my/your/g'
    echo 'hello  there' | perl -pe 's/ +/ /'
    echo hello | perl -nle 'print uc'
    perl -de 0  # debug
    perl -e 'print reverse <>' <file_to_reverse>
    perl -le 'print a..z'
    perl -ne 'print if $. == 2' <file> # line 2
    time perl -e 'sleep(1)'

## Pygments
    pygmentize -h
    pygmentize -L | less
    pygmentize -O style=<style> <code_file>

## Python
    $cITCP/encoding/dpl/Python/scratch.py
    python -h  # --help
    python -V

### code
    quit()
    python -c "print(__import__('sys').version)"
    python -c "print(__import__('platform').python_version())"
    shutil.copyfile ( src , dest )

#### sys
    python -c "import sys; print (sys.path)"

```
for arg in sys.argv[1:]: print(arg)
print(sys.argv[0])  # the full pathname of the program
```

### modules
    python -m <module>
    yaml2toml <yaml> <toml>

#### csvkit
    csvcut -n data.csv  # lists the headings, numbered
    csvcut -c 2,5,6 data.csv
    csvlook data.csv | less -S

#### pip
    py -m pip install -U pip
    pip -h  # --help
    pip -V  # --version
    pip list --outdated
    pip show <package>
    python -m pip install -U pip

#### pipx
    pipx install -h
    pipx list
    pipx run pycowsay moo
    pipx uninstall -h
    pipx upgrade-all

### site-packages
    cd $(python -m site --user-site)

#### global
    pip show six | grep "Location:" | cut -d " " -f2
    python -c "import os; print(os.path.dirname(os.__file__) + '/site-packages')"
    python -c 'import site; print(site.getsitepackages())'
    python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])'

### versions
    pyenv rehash
    python -V  # --version

### virtualenv
    cdvirtualenv  # goto the package directory
    deactivate
    lsvirtualenv  # lists the known environments

#### pew
    o $WORKON_HOME
    pew ls

#### virtualenvwrapper
    deactivate
    mkvirtualenv <name>  # also activates it
    rmvirtualenv <name>
    which python
    workon  # activate (or list all)

## Ruby
    ruby -v

### gems
    gem cl -d  # cleanup --dry-run
    gem e -h  # environment
    gem ou  # outdated
    gem li [<gem> -d  # list --details]
    gem uni [<gem>]  # unistall
    gem up  # update
    rougify -h

`minima` builds out the original repository copy of images that are less than 1024x512!

#### bundler
    bundle exec github-pages versions
    bundle install  # recreates Gemfile.lock from Gemfile
    bundle ou  # outdated
    bundle show
    bundle update --all

#### update
    fd -p "$GEM_HOME/gems" --changed-within 1d --max-depth 1  # lists recently updated
    gem update  # updates all

### IRB
    $onGH\misc\irbrc

`irb` is quit with `exit` or `ctrl+d`

## Rust
    rustup help
    rustup update

### Cargo
    cargo --list
    cargo install --list
    cargo search
    cargo version
    g $HOME/.cargo/bin

Crate regex: `x?` zero or one of `x` (greedy)

## Stack Exchange Network
- Stack Overflow
- What topics can I ask about here?

## webish
    js-beautify -f obfuscated.html -o beautiful.html

### HTML Elements
    <!-- a comment -->
    <a>anchor_link<a>

### LiquidJS
    {% comment %}
    multi-line comment
    {% endcomment %}

### ssg - Hugo
    hugo mod graph
    hugo mod tidy  # cleans  go.mod  and (re)generates  go.sum
    hugo serve --help
    hugo serve --navigateToChanged
    hugo serve -D  # includes drafts

### ssg - Jekyll
    bundle exec jekyll build
    bundle exec jekyll s  # serve locally to http://localhost:4000

- `[description of a post]({% post_url 20xx-xx-xx-name-of-post %})` provides a clickable link
- <https://github.com/rouge-ruby/rouge/wiki/List-of-supported-languages-and-lexers>
- YAML front matter

# file manage
    openssl sha3-256 <file>
    zoxide -h  # --help
    zoxide -V  # --version
    zoxide edit  # <esc>

`PeaZip`: `Ctrl+l` = `Extract all`

## 7-Zip
    7z
    7z x <pw'd_zip>

## fd
    fd ' \(2\)'  # as created by  Insync
    fd 'Chris Rea'
    fd [flags/options] [<pattern>] [<path>...]
    fd -H Ruby $home

- case insensitive until a capital is included
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
- `-L` follow links into symlinked directories
- `-td` type dir
- `-te` type empty file
- `-tf` type file
- `-tl` type symlink
- `-tx` type executable
- `-u` (not listed in `-h`) = `--unrestricted` = `-HI`
- `-x` (= `--exec`) <cmd>  # for each search result
- `-X` (= `--exec-batch`) <cmd>  # all search results at once

### recents
    fd --changed-within 3h
    fd -H --changed-within 9m
    fd -tf --changed-within 2d

in JH: `$DJH/search/searches.md`

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

## The Platinum Searcher
    pt
    pt /version
    pt Solange .

## sharkdp/bat
    bat --list-themes
    bat -h

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

my currently active key is `13F327EF`

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

## for paper - Epson EcoTank ET-5170 - feed tray
    $cITcr/HW/EpsonEcoTankET5170

- downside is printed
- landscape top is to right
- portrait top is to back of printer

## for paper - HP ENVY 5532
- place DL envelopes with the open side to the left
- printed pages come out head first (= upside down, printed face up)

## for paper - HP Envy Inspire 7220e
- 300gsm occasionally jams
- landscape top is to right
- Paper jams cause a reprint from the beginning of a series!

## screens
Sony Xperia 10 II: 1080x2520 = 21:9

### widescreen 16:9
- 1920x1080

# images
    $cITcc/CP/svg-flags-flat-png
    fd -utf -e bmp -e gif -e jpeg -e jpg -e png -e svg -e tiff -e webp > images.fetl

- 72 dpi = 18.3 dots per mm
- COLOR TOOLS <http://html-color-codes.info/>
- JPEG compression: `.jfif` `.jif` `.jpe` `.jpeg` `.jpg`

## GIMP
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

### magick
    -background <color>
    -border 20x20
    -draw 'text xpixels,ypixels "label"'
    -fill blue -draw 'rectangle x1,y1 x2,y2'  - the coordinates are diagonal opposites
    -font Arcon
    -gravity center
    -size 640x480

    magick -pointsize 72 label:inch_high  inch_high.gif
    magick -flatten img.png img-white.png
    magick -list format  # all of them
    magick -version
    magick <image> -background azure -gravity south -splice 0x80 <SBordered>
    magick rose: -background blue -splice 20x10+40+30 splice.gif
    magick wizard: wizard.png  # makes it

    label:"some text"

can convert from WebP

### gravity
    magick -list gravity

`-gravity northwest`  the default

### resize
    magick <image> -resize wxh! <image_forced>  # anisotropic resize (ignore original aspect ratio)
    magick <image> -resize xh <width_automagically_scaled_to_height>

## MyPaint
- `ctrl+s` = `File > Save`
- `d` = `Brush > Decrease Brush Size`
- `f` = `Brush > Increase Brush Size`
- `z` = undo
- `Save` pads out right & bottom images that aren't up to 1024x512...

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

## aspect ratios
- `1.3∙:1` =`4:3`
- `1.7∙:1` =`16:9` = `widescreen`

# ripgrep
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

in JH: `$DJH/search/searches.md`

# sqlite3
    sqlite3 <db.db>
    sqlite3 -help
    sqlite3 -version

## internal commands
    .exit
    .help
    .quit

# Stack Exchange Network
- `@petersmith` = Peter Smith
- CommonMark Implementations
- `highlight.js`

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

# terminal - WezTerm - key assignents
- `alt+enter` = `ToggleFullScreen`
- `ctrl -/+` = `DecreaseFontSize`/`IncreaseFontSize`
- `shift PageDown` = `ScrollByPage=1`
- `shift PageUp` = `ScrollByPage=-1`

## copy/paste
- `ctrl shift c` = `CopyTo="Clipboard"`
- `ctrl shift v` = `CopyFrom="Clipboard"`
- `ctrl shift x` = `ActivateCopyMode`
- mouse select

## panes
- `ctrl alt "` = `SplitVertical...` down
- `ctrl alt %` = `SplitHorizontal...` right
- `ctrl alt shift arrow` = resize pane
- `ctrl shift arrow` = move to pane
- `ctrl shift z` = `TogglePaneZoomState` get `[Z]` prefixed in window title

## tabs
- `ctrl PageDown` = `ActivateTabRelative=-1`
- `ctrl PageUp` = `ActivateTabRelative=1`
- `ctrl shift t` = `SpawnTab="CurrentPaneDomain"`
- `ctrl shift tab` = `ActivateTabRelative=-1`
- `ctrl tab` = `ActivateTabRelative=1`

# text wrangling
    ! " # $ % & ' ( ) * + , - . /
    ----10--------20--------30--------40--------50--------60--------70--------80--------90-------10
    ----10--------20--------30--------40--------50--------60--------70--------80--------90-------100-------110-------120-------130-------140-------150-------160
    ansifilter <file_to_strip_of_ANSI_terminal_escape_codes>

- ASCII Table
- carriage return (U+000D) returns the cursor to the left of the line (usually just before line feed on MSWin)
- `chmln.sd`
- finding characters

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
    curl ifconfig.co/city
    curl ifconfig.co/country
    ssh-keygen -lv -f ssh_host_rsa_key.pub  # shows fingerprint & ASCII art
    trashinbox

- GPS Coordinates <https://www.gps-coordinates.net>
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

### chromium-based
    chrome://apps/
    chrome://on-device-internals
    chrome://plugins/
    chrome://settings/cookies > See all site data and permissions

- `chrome://system > extensions > Expand` a list of Extensions
- `Ctrl+Shift+o` (= `Bookmarks`) `> Organise > Export`
- `Ctrl+u` view page source in new tab
- Google Chrome: `Ctrl+h` (= `chrome://history`)
- no way to stop autoplay of videos

#### Microsoft Edge
    edge://favorites/
    edge://history/all
    edge://settings/profiles

- `Importer les données du navigateur maintenant`
- `mouse hover over an image > ctr ctrl` = `right-click > magnify`

### Firefox
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
- `F12` (= `Web Developer Tools`)

### lynx
    lynx http://invisible-island.net/lynx

- `?`/`h` help screen
- `qq` quits

### Vivaldi
- `alt+p` (= `Settings`) `> Search > [ Google up to top and Set as Default , DuckDuckGo next, Wikipedia third ]`
- `ctrl+b` (= `Manage Bookmarks`)

## cloud storage - rclone
    $misc/CP/rclone.md
    rclone config file  # shows path

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

### Linux
    $AjB/bashrc-wm
    yt-dlp -f best <videoURL>
    yt-dlp --cookies-from-browser Firefox -S "height:720" https://youtu.be/xxxxxxxxxxx  # if age-restricted
    yt-dlp -f ba <videoURL>  # bestaudio (= best*[vcodec=none])
    yt-dlp -h
    yt-dlp --version

desideratus

### MSWin10
    $MSn\PS\Profile.ps1
    y --version

