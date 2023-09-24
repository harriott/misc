vim: nospell:

    $onGH/misc/CrossPlatform/QR; m4ps 0 1

    $DJH/dts-tex.txt
    :s/μ/\\mu{}/g
    \setlength{\columnsep}{1cm}
    xc

# chngcntr
    \counterwithout{section}{section} % (chngcntr) removes unneeded Chapter number for Sections

functionality included in Memoir

# commands
    \begin{figure}[h] \includegraphics[width=0.5\textwidth]{image} \end{figure}
    \centred{\rule{9cm}{0.4pt}}  % horizontal line
    \newenvironment{<envName>}[<n>][<default>]{<beginEnv>}{<endEnv>}
    \pagebreak
    \pagestyle{empty}  % no headers or footers from here
    \raggedleftSomeText\par}
    \renewcommand{\arraystretch}{1.5}  % tabular (default 1.0)
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

## font styles
    \textit{...}

`\textbf{...}` = `{\bfseries ...}` = bold
`\texttt{...}` = `{\ttfamily ...}` = monospaced

## font sizes
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

## geometry
    hmargin={<left margin>,<right margin>}
    vmargin={<top margin>,<bottom margin>}
    top=20mm

## horizontal spaces in text or math mode
    \enspace =>.5em
    \quad => 1em
    \qquad => 2em

## indents
    \noindent
    \setlength{\parindent}{0pt}
    \setlength{\parindent}{-3em}  % starts left of margin
    \leftskip=1cm ... \leftskip=0cm
    \rightskip=1cm ... \rightskip=0cm

## multicols
    \usepackage{multicol}
    ...
    \begin{document}
    \begin{multicols}{3}
    ...
    \end{multicols}

## sections
    \section*{ unnumbered section }
    \setcounter{secnumdepth}{3} % default
    \stepcounter{section} % increase section number by 1

# engines
    pdflatex --version

## MiKTeX
    initexmf --report
    miktex --version
    miktex --verbose fndb refresh

### FNDB
    initexmf --update-fndb
    MiKTeX Console > Tasks > Refresh file name database

after filename changes in `$tex`

### MiKTeX Package Manager
    C:\Users\troin\AppData\Local\MiKTeX\miktex\log\mpmcli.log
    mpm --list > "$ITstack\MSWin\MiKTeX\$Cn-packages-$(Get-Date -f yyMMdd-hhmm).txt"
    miktex --verbose packages check-update
    miktex packages list | measure | select -expand Count

# fonts - Indic
    FreeFont

`Lohit` used by Wikipedia

# maths environments
    \longrightarrow
    \rightarrow

# packages
    tlmgr info pgfplots
    tlmgr update --list

`datetime2`

## blindtext
    \blinddocument
    \Blinddocument
    \blindtext
    \Blindtext[5]
    \usepackage[bible]{blindtext}

## hyperref
    \href{...}
    \pdfstringdefDisableCommands{...}  % to fix "token not allowed"

## pifont
    \ding{80}  % a little star
    \usepackage{pifont}

## psnfss
    \usepackage{pifont}
    \ding{80}  % a little star
    \ding{220}  % a fat arrow

## Memoir
    \defaultlists
    \documentclass[20pt,a4paper,article,extrafontsizes,twocolumn]{memoir}
    \newcommand{\maketitle}
    \nonzeroparskip
    \tightlists

- `\the\columnsep` reports `10.0pt`
- Font sizes

### sectioning
    \chapterstyle{article}

#### lower level headings - default fonts
- sec: `\Large\bfseries`
- subsec: `\large\bfseries`
- subsubsec: `\bfseries`

#### lower level headings - section tweaks
    \setsecheadstyle{\color{gray}\Large\bfseries}

##### sub
    \setaftersubsecskip{0em}  % text follows heading inline
    \the\setaftersubsecskip

#### lower level headings - skips
    \setbeforesecskip{3.5ex plus 1ex minus .2ex} % vspace before section plus allowable stretch minus allowable shrink
    rg -ttex 'skip'

- afterskip
- beforeskip

##### beforeskip - defaults
- sec: `3.5ex plus 1 minus .2`
- subsec: `3.25ex plus 1 minus .2`
- subsubsec: `3.25ex plus 1 minus .2`

### simple footer
    \usepackage{currfile}
      \makeevenfoot{plain}{}{\cg {\currfilename}}{}
       \makeoddfoot{plain}{}{\cg {\currfilename}}{}

might require `[article]`

## pdfpages
    \includepdf[options]{<pdf>}

- doesn't respect `geometry` margins, so `\includepdfset{offset=<fromInnerEdge> <fromTop>}`
- if business cards aren't sized right, go through images

# verse
```tex
\renewcommand{\poemtitlefont}{\normalfont\bfseries\large}  % removed \centering

\begin{verse}

\begin{altverse}
odd lines are normal \\
  even lines will be indented
\end{altverse}

\indentpattern{01230}
\begin{patverse}
zero indent \\
  one indent \\
    two indents \\
      three indents \\
zero indent
\end{patverse}

\end{verse}
```

