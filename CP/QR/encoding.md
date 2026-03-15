vim: nospell:

    /* a single-line CSS comment */
    code-minimap $misc/CP/QR/QR.md
    rustc -V  # --version
    wiki/JSON
    yj -ty <file.toml >file.yml
    zig version

- `*.oma` = Sony OpenMG
- `R`: `q("no")`

# Bluefish
    alt+e (= Edit) > s (= Preferences...)
    bluefish -v

# CMake
    cmake -h
    cmake /V

# doku/highlight
    highlight --syntax=bash <script_without_shebang>
    highlight --version
    highlight -h

## supported languages
- <http://www.andre-simon.de/doku/highlight/en/langs.php>
- no `csv`

# FFmpeg
    $cITCP/encoding/x264_fullhelp.txt
    ffi <audio_to_fade> -af 'afade=t=out:st=<seconds_to_start>:d=<seconds_duration>' -t <seconds_to_end> -y <audio_faded_out>  # <seconds_to_start> + <seconds_duration> = <seconds_to_end>
    ffi <video> -vf 'scale=iw/2:ih/2' <same_video_with_half_the_frame_size>
    ffi <video> -vframes 1 frame.jpg  # extracts a single frame
    ffmpeg -version | xcol --enable-libvidstab
    ffmpeg -version | xcol --enable-libvorbis

- concat protocol `ffi 'concat:1.avi|2.avi' -c copy concatenated.avi`
- `-an` no audio
- `-filter:a afftdn=nr=90:nf=-20` removes white noise
- `-r ntsc` = 29.97 fps (= 30000/1001)
- `-t` length of output
- `-vf crop=width:height:x:y` where `height` = depth below y

## concatenation protocol
    ffmhb -i "concat:1.mpg|2.mpg|3.mpg" -c copy o.mpg

convert mp4's first to MPEG-2 transport streams (`ffmhb -i 1.mp4 -c copy 1.ts`) and concatenate them back to an mp4

## codecs
`MPEG` can use `-q:v n` (= `-qscale:v`) where `n` is from `2` (best) to `5` (good) to `31` (worst)

### libx264
    -c:a copy -crf 18 -preset veryfast -vf 'scale=iw/2:ih/2'

`Advanced Video Coding` (`H.264`, using `x264` encoder)

#### converting to mp4
> -qscale is ignored, -crf is recommended.

`-c:v libx264` seems to not be needed

#### options
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

## ffprobe
    ffprobe -h  # vast
    ffprobe -v error -show_format -show_streams <videoFile>
    ffprobe -version
    man ffprobe

## transpose
- `0`  90° counter clockwise and vertical flip (default)
- `1`  90° clockwise
- `2`  90° counter clockwise
- `3`  90° clockwise and vertical flip

# Git
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

- `git-merge`
- GitLab Markdown
- <https://ndpsoftware.com/git-cheatsheet.html>
- remove a file that is newly added to `.gitignore`: `git rm --cached <file>`

## commits
    $vimfiles; git log -3 --pretty="format:%C(auto)%h %as" -- */syntax/sh.vim  # last 3 dates of change
    git log -- *pdf  # shows if any PDF's have been inadvertently included
    git log -1  # credentials of last commit
    git reset HEAD~1  # throw away last commit, keeping changes for a better one
    git rev-parse --short HEAD  # the short commit hash
    gitk &  # GUI showing files in each commit

### search for a text change
1. `git log -S<change_string> --pretty=reference` reports commits that added or removed it
1. `git log -p -Sfoo` (`--patch`) generated

### find older filenames
    git log --follow *spacemacs*
    git log --follow '*cmusq.vim'
    git log --follow *Colette*

### grep
    git grep Log $(git rev-list --all) -- '*.ps1'  # searches all  ps1  files in all commits for "Log"

in `$cITCP/networking/browsers`, `git grep activeInstall $(git rev-list --all) -- 'browsers.txt'`

### move around
    git checkout -q HEAD^1  # go back one commit
    git checkout -q HEAD~9; git rev-parse --short HEAD  # go back 9 commits and print the short hash
    git checkout <commit>  # go back to the commit (hash or tag)
    git checkout master  # return to current state of project
    git checkout master  # return to current state of project

## configurations
    :%s#https://github.com/#git@github.com:#g

### gitconfig
    $cITCP/encoding/gitconfig-JH
    $misc/CP/gitconfig
    fd -tf -u -E .git gitignore
    git config -l  # --list
    git config -l --global
    git hist
    git lg

### lf
- `autocrlf = input`  warning: CRLF will be replaced by LF
- `eol = lf`

## the index
    git checkout-index -f <somefile>  # overwrite from the index's copy
    git ls-files
    git reset  # clears all staged files
    git rm --cached -r .  # empties the index

### damaged
    del .git\index
    git reset

## lazygit
- `Tab`/`left-arrow` & `Shift-Tab`/`right-arrow` rotates through the left column of panes
- `?` adaptive help - <esc> quits it
- `q` quits

no search functionality

## remotes
    gh repo clone
    git clone https://github.com/... [target_directory] --depth=n  # clones only to commit depth n
    git pull --unshallow
    git remote -v
    git remote add upstream https://github.com/...
    git remote rename origin gh
    git remote show  # reports name set in  .git/config

git-fetch

## tig
- main view list never shows the hash - `Enter` goes in and shows it
- Tig Manual

### commands
- `q`  quit
- `t`  tree view
- `j/k/-/space/home/end`  movements

# Go
    go env
    go version
    lazyjournal -h

## Hugo
    hugo mod graph  # dependencies
    hugo mod tidy  # (re)creates  go.mod  &  go.sum
    hugo server  # baseURL  must be defined to get  http://localhost:1313/
    hugo server -p 1314  # http://localhost:1314/
    hugo version
    rm -r public, hugo  # repopulates  public/

- `hugo -b http://...` overrides `baseURL` defined in a `config.toml`
- "Page Not Found" if no theme...

# gnuplot
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

## commands
    q[uit]

# Java
    java -?
    java -version
    PS> where.exe java

# JavaScript - Node.js
    node -h  # --help
    node -v  # --version

## npm
    npm install
    npm ls -g
    npm un[install] -g [<package>]
    npm up[date] -g [<package>]
    npm prefix -g  # =  npm config get prefix
    npm -v  # --version
    npx cowsay goodbye!''

package manager

### Astro
    npm run dev -- -h  # --help
    npx astro --help
    npx astro --version
    npx astro docs  # launches Astro Docs
    npx astro info  # environment

#### development server
    http://localhost:4321
    npm run dev
    npx astro dev

- gets dev toolbar at bottom
- HMR ensures instant updates

# Lua
    $cITCP/encoding/dpl/scratch.lua
    lua -v

# markdown
- <https://github.com/github/linguist/blob/master/lib/linguist/languages.yml> dosini
- <http://daringfireball.net/projects/markdown/syntax>

## Markdown Guide
- <https://www.markdownguide.org/basic-syntax/>
- <https://www.markdownguide.org/extended-syntax/>

# Pandoc
    $cGRs/d-CP/r-jgm-pandoc
    :Man pandoc
    pandoc --version

## options
    $MD4PDF/defaults.yaml
    $MD4PDF/defaults-toc.yaml

- `--fail-if-warnings`  exit with error status if there are any warnings
- `--pdf-engine=xelatex` (default `pdflatex`)
- `-d <dfy>` (`--defaults=<dfy>`) defaults file in YAML
- `-f <if>` (= `--from=<if>` = `-r <if>` = `--read=<if>`) input format
    - `csv`, `tsv`, ...
    - `markdown_strict+backtick_code_blocks`
- `-t <of>` (= `--to=<of>` = `-w <of>` = `--write=<of>`) output format

## snags
    $core/IT/CP/Pandoc/monofont.md
    $core/IT/CP/Pandoc/weird.gfm

## verbose
    [makePDF] Source:
    ...
    \end{document}

# Perl
    $cITCP/encoding/dpl/Perl/scratch0.pl
    $jtCP/coding/Perl
    cpanm --help
    perl -?

- command prompt, `set TERM=dumb` allows Perl stuff to run without Terminal Size warnings
- `perldoc perlrun` explains `-e` & `-p`
- `q(a b c)` = `a b c`
- `qq(a b c)` = `"a b c"`
- `qw(a b c)` = `('a', 'b', 'c')`
- `File::Find` - `$onGH/FM-underscores/underscores.pl`
- `ppm` Perl Package Management

## arrays
    @array = (1, 2, 3, 4, 5);
    print $array[0];   # Prints 1
    print $array[3];   # Prints 4
    print $array[-1];  # Prints 5

## commands
    die('died for debugging');
    for ...  # = foreach ...
    print lc("String to Lowercase")
    print length($string)."\n";

### conditionals
    if ( expr ) { action }
    if ( expr ) { action } else { action }
    if ( expr ) { action } elsif ( expr  ) { action } ... else { action }
    unless ( expr ) { action }

#### comparison Operators
    numeric string
    ==      eq
    !=      ne
    <       lt
    >       tt
    <=      le
    >=      ge
    <=>     cmp

### file tests
- `-e $node` exists
- `-z $node` zero size
- `-s $node` returns size in bytes
- `-f $node` is a file
- `-d $node` is a directory
- `-l $node` is a symlink

### loops
    last;  # break
    next;  # continue
    while ($boolean) {...}

### regex
- `*`  0 or more times
- `+`  1 or more times
- `\d`  `[0-9]`
- `\n`  newline
- `\s`  space, tab, newline
- `\w`  alphanumeric or _
- `a{m,n}`  between  m  &  n  a's
- `^abc|abc$` abc at start or end

<https://jkorpela.fi/perl/regexp.html>

#### accented characters
    $ echo 'aà cç eé eè' | perl -pe 's/[^\P{Latin}A-Za-z]/-/g'
    $ echo 'aà cç eé eè' | perl -pe 's/\p{Latin}/-/g'

### say
    say scalar @array;  # number of elements
    perl -e 'use feature "say"; say "said";'

replaces `print "$var\n";`

## Data::Printer
    perl -e 'use DDP; p @{[ one, two, three ]};'

arrays containing tabbed values can get messy: `perl -e 'my @tabbedArray = ( "short1st\tlong_second_item", "super_extra_long_first_item\tshort2nd", "12\textra_long_second_item" ); use DDP; p @tabbedArray;'`

## inform
    perl -h  # summary of options
    perl -v
    perldoc -f <function>
    perldoc perldoc
    perldoc perlmodlib  # bundled modules
    perldoc perlrun
    where.exe perl

### @INC
    perl -e 'print join qq/\n/, @INC'
    perl -le '$,="\n"; print @INC'

### modules
    cpanm <moduleName>  # gets it

#### list
    cpan -l > $machine\troin\cpanList.txt
    instmodsh  # followed by l

## one-liners
    $ echo sample_text | perl -pe 's/(sample).*/$1/'  # double quotes wouldn't work here
    echo "my_string" | perl -pe 's/my/your/g'
    echo 'hello  there' | perl -pe 's/ +/ /'
    echo hello | perl -nle 'print uc'
    perl -de 0  # debug
    perl -e 'print reverse <>' <file_to_reverse>
    perl -le 'print a..z'
    perl -ne 'print if $. == 2' <file> # line 2
    perl -pe 's/\n/ /' <file_to_return_as_one_line>
    time perl -e 'sleep(1)'

# Pygments
    pygmentize -h
    pygmentize -L | less  # lexers
    pygmentize -O style=<style> <code_file>

# Python
    $cITCP/encoding/dpl/Python/scratch.py
    python -h  # --help
    python -V
    scriptfilename = (os.path.basename(os.path.splitext(sys.argv[0])[0])) # without extension

## code
    quit()
    python -c "print(__import__('sys').version)"
    python -c "print(__import__('platform').python_version())"
    shutil.copyfile ( src , dest )

### sys
    python -c "import sys; print (sys.path)"

```
for arg in sys.argv[1:]: print(arg)
print(sys.argv[0])  # the full pathname of the program
```

## modules
    python -m <module>
    yaml2toml <yaml> <toml>

### csvkit
    csvcut -n data.csv  # lists the headings, numbered
    csvcut -c 2,5,6 data.csv
    csvlook data.csv | less -S

### pip
    pip -h  # --help
    pip -V  # --version
    pip list --outdated
    pip show <package>

#### updating
    pip-review -a  # --auto  install updates
    pip-review -h  # --help

##### update pip
    py -m pip install -U pip
    python -m pip install -U pip

(`--upgrade`)

### pipx
    pipx install -h
    pipx list
    pipx run pycowsay moo
    pipx uninstall -h
    pipx upgrade-all

## site-packages
    cd $(python -m site --user-site)

### global
    pip show six | grep "Location:" | cut -d " " -f2
    python -c "import os; print(os.path.dirname(os.__file__) + '/site-packages')"
    python -c 'import site; print(site.getsitepackages())'
    python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])'

## versions
    pyenv rehash
    python -V  # --version

## virtualenv
    cdvirtualenv  # goto the package directory
    deactivate
    lsvirtualenv  # lists the known environments

### pew
    o $WORKON_HOME
    pew ls

### virtualenvwrapper
    deactivate
    mkvirtualenv <name>  # also activates it
    rmvirtualenv <name>
    which python
    workon  # activate (or list all)

# Ruby
    ruby -v

## gems
    gem cl -d  # cleanup --dry-run
    gem e -h  # environment
    gem ou  # outdated
    gem li [<gem> -d  # list --details]
    gem uni [<gem>]  # unistall
    gem up  # update
    rougify -h

`minima` builds out the original repository copy of images that are less than 1024x512!

### bundler
    bundle exec github-pages versions
    bundle install  # recreates Gemfile.lock from Gemfile
    bundle ou  # outdated
    bundle show
    bundle update --all

### update
    fd -p "$GEM_HOME/gems" --changed-within 1d --max-depth 1  # lists recently updated
    gem update  # updates all

## IRB
    $onGH\misc\irbrc

`irb` is quit with `exit` or `ctrl+d`

# Rust
    rustup help
    rustup update

## Cargo
    cargo --list
    cargo install --list
    cargo search
    cargo version
    g $HOME/.cargo/bin

Crate regex: `x?` zero or one of `x` (greedy)

# Stack Exchange Network
- Stack Overflow
- What topics can I ask about here?

# webish
    js-beautify -f obfuscated.html -o beautiful.html

## HTML Elements
    <!-- a comment -->
    <a>anchor_link<a>

## LiquidJS
    {% comment %}
    multi-line comment
    {% endcomment %}

## ssg - Hugo
    hugo mod graph
    hugo mod tidy  # cleans  go.mod  and (re)generates  go.sum
    hugo serve --help
    hugo serve --navigateToChanged
    hugo serve -D  # includes drafts

## ssg - Jekyll
    bundle exec jekyll build
    bundle exec jekyll s  # serve locally to http://localhost:4000

- `[description of a post]({% post_url 20xx-xx-xx-name-of-post %})` provides a clickable link
- <https://github.com/rouge-ruby/rouge/wiki/List-of-supported-languages-and-lexers>
- YAML front matter

