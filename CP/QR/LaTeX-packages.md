vim: nospell:

    $misc/CrossPlatform/QR; m4ps 0 1

    \usepackage{tikz}
    \usepackage{url}
    tlmgr info pgfplots
    tlmgr update --list

- `datetime2`
- `ifplatform`: `\ifwindows ... \else ... \fi`

# blindtext
    \blinddocument
    \Blinddocument
    \blindtext
    \Blindtext[5]
    \usepackage[bible]{blindtext}

# fontspec
    \setmainfont{...}
    \setmonofont{...}

# geometry
- `hmargin` `left` `right`
- `vmargin` `top` `bottom`

# hyperref
    \href{...}
    \pdfstringdefDisableCommands{...}  % to fix "token not allowed"

# pifont
    \ding{80}  % a little star
    \usepackage{pifont}

# Polyglossia
    \usepackage{polyglossia}
    \setdefaultlanguage[variant=uk]{english}
    \setdefaultlanguage{french}

# psnfss
    \usepackage{pifont}
    \ding{80}  % a little star
    \ding{220}  % a fat arrow

# class
    \documentclass[varwidth]{standalone}

## Memoir
    \defaultlists
    \documentclass[20pt,a4paper,article,extrafontsizes,twocolumn]{memoir}
    \newcommand{\maketitle}
    \nonzeroparskip
    \setlength{\columnsep}{7mm}
    \tightlists

- `\the\columnsep` reports `10.0pt`
- Font sizes

### margins
    \setlrmarginsandblock{30mm}{20mm}{*} % left and right margin
    \setulmarginsandblock{13mm}{25mm}{*} % upper and lower margin
    \checkandfixthelayout

### sectioning
    \chapterstyle{article}

#### lower level headings - default fonts
- sec: `\Large\bfseries`
- subsec: `\large\bfseries`
- subsubsec: `\bfseries`

#### lower level headings - section tweaks
    \setsecheadstyle{\color{gray}\Large\bfseries}
    \setsecheadstyle{\raggedright} % avoids margin overruns

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

# pdfpages
    \usepackage{pdfpages}
    ...
    \includepdf[options]{<pdf>}

    rg -ttex '\\usepackage\{pdfpages\}' -l > rg-tex-pdfpages.fetl

- doesn't respect `geometry` margins, so `\includepdfset{offset=<fromInnerEdge> <fromTop>}`
- if business cards aren't sized right, go through images

# verse
```tex
\renewcommand{\poemtitlefont}{\normalfont\bfseries\large}  % removed \centering

\begin{verse}

no page break after this line \\*

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

