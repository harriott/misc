vim: nospell:

    $onGH/misc/CrossPlatform/QR; m4ps 0 1

    $Drpbx/JH/dts-tex.txt
    :s/μ/\\mu{}/g
    xc

# maths environments
    \longrightarrow
    \rightarrow

# chngcntr
    \counterwithout{section}{section} % (chngcntr) removes unneeded Chapter number for Sections

functionality included in Memoir

# commands
    \begin{figure}[h] \includegraphics[width=0.5\textwidth]{image} \end{figure}
    \newenvironment{<envName>}[<n>][<default>]{<beginEnv>}{<endEnv>}
    \pagebreak
    \pagestyle{empty}  % no headers or footers from here
    \raggedleftSomeText\par}
    \renewcommand{\arraystretch}{1.5}  % tabular (default 1.0)
    \stepcounter{section} % increase section number by 1
    \tableofcontents*  % ToC without itself listed therein
    \textbf{...}
    \textit{...}
    \textsubscript{}
    \textsuperscript{}
    \the\length  % prints that length
    \title{your title} ... \begin{document} ... \maketitle
    \today
    \usepackage[dvipsnames]{xcolor}
    \usepackage{soul}  % Hyphenation for letterspacing, underlining, and more
    \usepackage{titlesec}  % incompatible with memoir
    \vfill

## horizontal spaces in text or math mode
    \enspace =>.5em
    \quad => 1em
    \qquad => 2em

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

# package - blindtext
    \blinddocument
    \Blinddocument
    \blindtext
    \Blindtext[5]
    \usepackage[bible]{blindtext}

# package - Memoir
    \defaultlists
    \documentclass[20pt,a4paper,article,extrafontsizes,twocolumn]{memoir}
    \nonzeroparskip
    \tightlists

Font sizes

## sectioning
    \chapterstyle{article}

### lower level headings - default fonts
- sec: `\Large\bfseries`
- subsec: `\large\bfseries`
- subsubsec: `\bfseries`

### lower level headings - section tweaks
    \setsecheadstyle{\color{gray}\Large\bfseries}

#### sub
    \setaftersubsecskip{0em}  % text follows heading inline
    \the\setaftersubsecskip

### lower level headings - skips
    \setbeforesecskip{3.5ex plus 1ex minus .2ex} % vspace before section plus allowable stretch minus allowable shrink
    rg -ttex 'skip'

- afterskip
- beforeskip

#### beforeskip - defaults
- sec: `3.5ex plus 1 minus .2`
- subsec: `3.25ex plus 1 minus .2`
- subsubsec: `3.25ex plus 1 minus .2`

## simple footer
    \usepackage{currfile}
      \makeevenfoot{plain}{}{\cg {\currfilename}}{}
       \makeoddfoot{plain}{}{\cg {\currfilename}}{}

might require `[article]`

# package - pdfpages
    \includepdf[options]{<pdf>}

doesn't respect `geometry` margins, so `\includepdfset{offset=<fromInnerEdge> <fromTop>}`

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
zero indent
  one indent
    two indents
      three indents
zero indent
\end{patverse}

\end{verse}
```

