vim: nospell:

    $misc/CP/QR; m4ps 0 1

syntax of this file is ensured in `$vfv/filetype.vim`

    $JHt/IT/CP/fonts-SE595756-fontcharlist
    fzf -h
    fzf --version
    pdf-crop-margins pdf.pdf  # silently makes  pdf-cropped.pdf

- regular expressions
- Software Engineering Stack Exchange

# audio
    exiftool -ver  # https://sno.phy.queensu.ca/~phil/exiftool/

## text-to-speech
    espeak "Hello World!"

### French
    espeak -v fr "Votre texte à lire..."
    espeak -v fr+f2 "Bonjour tout le monde"

# AV
    $ITscr/HW/audio/BTHeadphones/JBLTune720BT

## OBS Studio Settings
    Output > Recording > Encoder > x264 low CPU usage

`Alt+f` (= `File`) > `s` (= `Settings`) > `Output` > `Recording` > `Recording Path`

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
    ctrl+shift+p (= Edit > Preferences)

#### Default Profile
- defaults to HD 720p 30 fps
- need to `Restart` `OpenShot` when changed

### Profiles
    $core/IT_stack/OpenShot

- `*assets` folders can be deleted

#### Choose Profile
    ctrl+p

- `HD 720p 30 fps (1280x720)`
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

### seeks
- 3s: `shift+left/right`
- 10s: `alt+left/right`
- 1m: `ctrl+left/right`

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

# documenting - Calibre
    ~/CalibreLibrary

E-book viewer `<esc>`/`<right_click>` brings up the controls

# documenting - LaTeX
    $DJH/search/dts-tex.fetl  # for my files
    $JHt/IT/CP/TeX/LaTeX/  # for example code
    :s/μ/\\mu{}/g
    xc

## chngcntr
    \counterwithout{section}{section} % (chngcntr) removes unneeded Chapter number for Sections

functionality included in Memoir

## commands
    \begin{figure}[h] \includegraphics[width=0.5\textwidth]{image} \end{figure}
    \centred{\rule{9cm}{0.4pt}}  % horizontal line
    \listfiles  in preamble gets package versions in  .log
    \newenvironment{<envName>}[<n>][<default>]{<beginEnv>}{<endEnv>}
    \overfullrule=2mm  % adds a black bar to locate an overfull hbox
    \pagebreak
    \pagestyle{empty}  % no headers or footers from here
    \raggedleftSomeText\par}
    \setlength{\columnsep}{1cm}
    \tableofcontents*  % ToC without itself listed therein
    \textsubscript{}
    \textsuperscript{}
    \the\length  % prints that length
    \title{your title} ... \begin{document} ... \maketitle
    \today
    \usepackage[dvipsnames]{xcolor}
    \usepackage{soul}  % Hyphenation for letterspacing, underlining, and more
    \usepackage{titlesec}  % incompatible with memoir
    \vfill

### font styles
    \textit{...}

`\textbf{...}` = `{\bfseries ...}` = bold
`\texttt{...}` = `{\ttfamily ...}` = monospaced

### font sizes
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

### horizontal spaces in text or math mode
    \enspace =>.5em
    \quad => 1em
    \qquad => 2em

### indents
    \noindent
    \setlength{\parindent}{0pt}
    \setlength{\parindent}{-3em}  % starts left of margin
    \leftskip=1cm ... \leftskip=0cm
    \rightskip=1cm ... \rightskip=0cm

### multicols
    \usepackage{multicol}
    ...
    \begin{document}
    \begin{multicols}{3}
    ...
    \end{multicols}

### sections
    \section*{ unnumbered section }
    \setcounter{secnumdepth}{3} % default
    \stepcounter{section} % increase section number by 1

`titlesec`: `\titleformat{\section}{\normalfont\Large\bfseries}{\thesection}{1em}{}`

## engines
    pdflatex --version
    pdflatex <path>/<texfile>  # outputs compilation results in  <path>/

### MiKTeX
    initexmf --report
    miktex --version
    miktex --verbose fndb refresh

#### FNDB
    initexmf --update-fndb
    MiKTeX Console > Tasks > Refresh file name database

after filename changes in `$tex`

#### MiKTeX Package Manager
    C:\Users\troin\AppData\Local\MiKTeX\miktex\log\mpmcli.log
    mpm --list > "$ITstack\MSWin\MiKTeX\$Cn-packages-$(Get-Date -f yyMMdd-hhmm).txt"
    miktex --verbose packages check-update
    miktex packages list | measure | select -expand Count

## fonts
style `\textnormal`

### Indic
    FreeFont

`Lohit` used by Wikipedia

## maths environments
    \longrightarrow
    \rightarrow

## tabular environment
    \multicolumn{num_cols}{alignment}{contents}
    \renewcommand{\arraystretch}{1.5}  % tabular (default 1.0)

```
\begin{tabular}{ c|l|r }
  \hline
  centred & left & right \\
\end{tabular}
```

### multirow
    \multirow{<num_rows>}{<width>}{<contents>} % * for default width
    \usepackage{multirow}

# documenting - LibreOffice
    $CrPl/documenting/LibreOffice/Buildup.txt
    r ~/.config/libreoffice/4/user/

- `alt+f12` = `Tools > Options`
- `alt+o`/`alt-t` (= `Format`) `> p` (= `Page style...`/`Style de page...`)
    - `Page` is where can set borders
- `alt+t e` = `Tools > Extensions` = `ctrl+alt+e`
- `ctrl+alt+e` = `Tools > Extension Manager...`
- Writer: right-click on a hyperlink for `Remove Hyperlink`

## Draw
- curve: `left-click > [shift] move > left-click > move > double-left-click`
- `F2` (= `Insert > Text Box`)

## porting
    \user\config
    ~\AppData\Roaming\LibreOffice\4\user\registrymodifications.xcu

# documenting - PDFs
use Google Chrome to break out just some pages into a reduced copy

## PDFtk
    pdftk in.pdf burst  # breaks into individual pages
    pdftk in*.pdf cat output out.pdf  # concatenate a sequence of PDFs
    pdftk secure.pdf input_pw <password> output normal.pdf

## fix rotations
    pdftk leftRotated.pdf cat 1-endeast output horizontal.pdf
    pdftk leftRotated-rightRotated.pdf cat 1east 2west output horizontal.pdf

# Emacs - commands
- `C-*`  calc-dispatch
- `C-g`  keyboard-quit
- `C-x C-c`  quit
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

## fonts
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

no built in documentation for `straight.el`

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
- `$DCGRs/emacs/emacs-evil-evil/evil-maps.el`
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
    code-minimap $misc/CP/QR/QR.md
    rustc -V  # --version
    wiki/JSON
    yj -ty <file.toml >file.yml

- `*.oma` = Sony OpenMG
- R: `q("no")`

## Bluefish
    alt+e (= Edit) > s (= Preferences...)
    bluefish -v

## doku/highlight
    highlight --syntax=bash <script_without_shebang>
    highlight --version
    highlight -h

### supported languages
- <http://www.andre-simon.de/doku/highlight/en/langs.php>
- no `csv`

## FFmpeg
    -vf crop=iw:ih-80:0:0
    ffmhb -i <video> -vf 'scale=iw/2:ih/2' <same_video_with_half_the_frame_size>
    ffmhb -i <video> -vframes 1 frame.jpg  # extracts a single frame
    ffmpeg -version | xcol --enable-libvidstab
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
    git -P <command>  # --no-pager
    git branch --show-current
    git branch -a  # lists local & remote branches
    git branch -m <new_name_of_branch>
    git grep <caseSensitiveText>
    git init -b gh  # --initial-branch=<branch_name>
    git push gh +master  # force push to remote
    git rev-parse --show-toplevel  # print the top level directory of the current repository
    git show <pathToFile>  # highlights the changes
    git submodule
    git version
    onefetch -h

- GitLab Markdown
- <https://github.com/github/linguist/blob/master/lib/linguist/languages.yml>
- <https://ndpsoftware.com/git-cheatsheet.html>

### commits
    git log -- *pdf  # shows if any PDF's have been inadvertently included
    git log --follow *spacemacs*
    git log --follow '*cmusq.vim'
    git log --follow *Colette*
    git log -1  # credentials of last commit
    git log -3 --pretty="format:%C(auto)%h %as" -- */syntax/sh.vim  # last 3 dates of change
    git log -S<change_string>  # reports commits that added or removed it
    git reset HEAD~1  # throw away last commit, keeping changes for a better one
    git rev-parse --short HEAD  # the short commit hash
    gitk &  # GUI showing files in each commit

#### grep
    git grep Log $(git rev-list --all) -- '*.ps1'  # searches all  ps1  files in all commits for "Log"

in `$CrPl/networking/browsers`, `git grep activeInstall $(git rev-list --all) -- 'browsers.txt'`

#### move around
    git checkout -q HEAD^1  # go back one commit
    git checkout -q HEAD~9; git rev-parse --short HEAD  # go back 9 commits and print the short hash
    git checkout <commit>  # go back to the commit (hash or tag)
    git checkout master  # return to current state of project

### configurations
    :%s#https://github.com/#git@github.com:#g

#### lf
- `autocrlf = input`  warning: CRLF will be replaced by LF
- `eol = lf`

#### gitconfig
    git config -l
    git hist
    git lg

### GitHub CLI
    gh repo list  # handy list of your repositories
    gh repo view  # in a repository, returns the README

### the index
    git checkout-index -f <somefile>  # overwrite from the index's copy
    git ls-files
    git reset  # clears all staged files
    git rm --cached -r .  # empties the index

#### damaged
    del .git\index
    git reset

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
    gnuplot -e 'set terminal'  # lists those available
    gnuplot -e 'show datafile commentschars'
    gnuplot -e 'show loadpath'
    gnuplot -e 'show palette'
    gnuplot -V
    r $jtCP/gnuplot  # sample code

### commands
    q[uit]

## Java
    java -?
    java -version
    PS> where.exe java

## Lua
    $DCGRs/CP/Vim/vim-vim/src/testdir/testluaplugin/lua/testluaplugin/hello.lua
    lua -v

## markdown
- <https://github.com/github/linguist/blob/master/lib/linguist/languages.yml> dosini
- <http://daringfireball.net/projects/markdown/syntax>

### Markdown Guide
- <https://www.markdownguide.org/basic-syntax/>
- <https://www.markdownguide.org/extended-syntax/>

## npm
    npm ls -g
    npm un[install] -g [<package>]
    npm up[date] -g [<package>]
    npm prefix -g  # =  npm config get prefix
    npm -v  # --version
    npx cowsay goodbye!''

## Pandoc
    $core/IT_stack/CP/Pandoc/monofont.md
    $core/IT_stack/CP/Pandoc/weird.gfm
    pandoc --version

`--fail-if-warnings`  exit with error status if there are any warnings

### verbose
    [makePDF] Source:
    ...
    \end{document}

## Perl
    $ echo sample_text | perl -pe 's/(sample).*/$1/'  # double quotes wouldn't work here
    $ITstack/CP/encoding/dpl/Perl/scratch.pl
    cpanm --help
    echo "my_string" | perl -pe 's/my/your/g'
    echo 'hello  there' | perl -pe 's/ +/ /'
    echo hello | perl -nle 'print uc'
    for ...  # = foreach ...
    perl -de 0  # debug
    perl -e 'print reverse <>' <file_to_reverse>
    perl -h  # summary of options
    perl -le 'print a..z'
    perl -v  # version

### conditionals
    if ( expr ) { action }
    if ( expr ) { action } else { action }
    if ( expr ) { action } elsif ( expr  ) { action } ... else { action }
    unless ( expr ) { action }

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

### loops
    last;  # break
    next;  # continue
    while ($boolean) {...}

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
- `^abc|abc$` abc at start or end

<https://jkorpela.fi/perl/regexp.html>

#### accented characters
    $ echo 'aà cç eé eè' | perl -pe 's/[^\P{Latin}A-Za-z]/-/g'
    $ echo 'aà cç eé eè' | perl -pe 's/\p{Latin}/-/g'

### say
    say scalar @array;  # number of elements
    use feature 'say';

replaces `print "$var\n";`

## Python
    $ITstack/CP/encoding/dpl/Python/scratch.py
    python -h  # --help
    python -V

### code
    quit()
    python -c "print(__import__('sys').version)"
    python -c "print(__import__('platform').python_version())"

#### sys
    python -c "import sys; print (sys.path)"

```
for arg in sys.argv[1:]: print(arg)
print(sys.argv[0])  # the full pathname of the program
```

### modules
    py -m pip install -U pip
    pip -V (--version)
    pip list --outdated
    python -m pip install -U pip
    yaml2toml <yaml> <toml>

#### pipx
    pipx list
    pipx run pycowsay moo
    pipx uninstall -h
    pipx upgrade-all

### site-packages
    pip show six | grep "Location:" | cut -d " " -f2
    python -c "import os; print(os.path.dirname(os.__file__) + '/site-packages')"
    python -c 'import site; print(site.getsitepackages())'
    python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])'
    python -m site --user-site

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
    gem env
    gem list
    rougify -h

`minima` builds out the original repository copy of images that are less than 1024x512!

#### bundler
    bundle exec github-pages versions
    bundle install  # recreates Gemfile.lock from Gemfile
    bundle outdated
    bundle show
    bundle update --all

#### update
    fd -p "$GEM_HOME/gems" --changed-within 1d --max-depth 1  # lists recently updated
    gem update  # updates all

### IRB
    $onGH\misc\irbrc

`irb` is quit with `exit` or `ctrl+d`

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
    bundle exec jekyll s  # serve locally

- `[description of a post]({% post_url 20xx-xx-xx-name-of-post %})` provides a clickable link
- <https://github.com/rouge-ruby/rouge/wiki/List-of-supported-languages-and-lexers>
- YAML front matter

# file manage
    zoxide -h  # --help
    zoxide -V  # --version

- `7-Zip`: `7z x <pw'd_zip>`
- sharkdp/bat

## fd
    im fd

- recursive by default
- sharkdp/fd
- Ubuntu: `fdfind -V`

### man
- `-a` (=`--absolute-path`)
- `-d1` = depth 1 (current dir)
- `-e <ext>` (= `--extension`)
- `-E` (= `--exclude`) `<unquoted_glob>`
- `-H` (`--hidden`)
- `-I` = `--no-ignore` = don't respect `.(fd|git)ignore`
- `-L` follow links into symlinked directories
- `-td` type dir
- `-tf` type file
- `-u` (not listed in `-h`) = `--unrestricted` = `-HI`
- `-x` (= `--exec`) <cmd>  # for each search result
- `-X` (= `--exec-batch`) <cmd>  # all search results at once

### recents
    fd --changed-within 3h
    fd -tf --changed-within 2d

in JH: `$DJH/search/searches.md`

### symlinks
    fd --max-depth 1 -Hl -tl
    fd -H -tl  # only found targets, broken ones with red background
    fd -Hl -tl  # show supposed link source

## lf file manager
- `c` (`clear` paths in buffer)
- `c-l` (`redraw`)
- `c-r` (`reload`)
- `d` (`cut`)
- `gh` (`cd ~`)
- `i` open in pager
- `p` (`paste`)
- `r` (`rename`)
- `y` (`copy`)
- `zh` (`set hidden!`) toggles

by gokcehan

## The Platinum Searcher
    pt
    pt /version
    pt Solange .

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

# gpg
    <key-id> can be the short key id = the last 8 characters
    echo "encrypt me this" | gpg -ase -r 13F327EF -o gpg.asc
    gpg --delete-key <key-id>
    gpg --send-keys key-id  # then can never be deleted from the keyserver
    gpg --verify file.asc [file]

GnuPG

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
    $ABjo/gpg-agent.conf
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
    gpg -k  # --list-keys
    gpg -K  # --list-secret-keys

# HW
    duf (--all)  # storage devices info

## for paper
`HP Envy Inspire 7220e`: landscape top is to right

### HP ENVY 5532
- place DL envelopes with the open side to the left
- printed pages come out head first (= upside down, printed face up)

### Epson EcoTank ET-5170 - feed tray
    $ITscr/HW/EpsonEcoTankET5170

- downside is printed
- landscape top is to right
- portrait top is to back of printer

## screens
Sony Xperia 10 II: 1080x2520 = 21:9

### widescreen 16:9
- 854x480
- 1280x720 = 720p = "HD Ready"
- 1600x900
- 1920x1080

# images
- 72 dpi = 18.3 dots per mm
- COLOR TOOLS <http://html-color-codes.info/>
- JPEG compression: `.jfif` `.jif` `.jpe` `.jpeg` `.jpg`

## GIMP
paintbrush: shift previews a new straight line from last point to current mouse cursor location

### Crop
    shift+c

`Fixed Aspect ratio > 700:333` (as for `Mastodon` header image) triggers a selection box of that ratio

### Export
    ctrl+shift+e

`alt+f` (= `File`) > `x` (= `Export As...`)

## ImageMagick
    identify -format '%w %h %f \n' *  # images listed by size
    magick <image> -background azure -gravity south -splice 0x80 <SBordered>
    montage <left> <right> -geometry +9+9 -tile 2x1 <lr>
    montage <upper> <lower> -geometry +0+0 -tile 1x2 <ul>

### magick
    -background <color>
    -border 20x20
    -draw 'text xpixels,ypixels "label"'
    -fill blue -draw 'rectangle x1,y1 x2,y2'  - the coordinates are diagonal opposites
    -font Arcon
    -gravity center
    -pointsize 48
    -size 640x480
    magick -flatten img.png img-white.png
    magick -version
    label:"some text"

- anisotropic resize
- can convert from WebP

### gravity
    magick -list gravity

`-gravity northwest`  the default

## MyPaint
- `ctrl+s` = `File > Save`
- `d` = `Brush > Decrease Brush Size`
- `f` = `Brush > Increase Brush Size`
- `z` = undo
- `Save` pads out right & bottom images that aren't up to 1024x512...

# ripgrep
    rg -help

- `-N` (= `--no-line-number`)
- outer whitespaces get ignored

## filetypes
    rg --type-list  # $vfv/syntax/rgtl.vim
    rg <options> <pattern> [<path>]

- `.dw` not known
- no group for gitconfigs

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
    rg -uu <someText>  # ignores ignore files, and searches in hidden stuff
    rg <someText> **/*.ext
    rg 'url = ' **\*.git\config

in JH: `$DJH/search/searches.md`

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

# text wrangling
    ! " # $ % & ' ( ) * + , - . /
    ----10--------20--------30--------40--------50--------60--------70--------80--------90-------10
    ----10--------20--------30--------40--------50--------60--------70--------80--------90-------100-------110-------120-------130-------140-------150-------160
    ansifilter <file_to_strip_of_ANSI_terminal_escape_codes>

- carriage return (U+000D) returns the cursor to the left of the line (usually just before line feed on MSWin)
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

