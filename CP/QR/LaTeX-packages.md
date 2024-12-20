vim: nospell:

    $misc/CrossPlatform/QR; m4ps 0 1

    \usepackage{tikz}
    \usepackage{url}
    tlmgr info pgfplots
    tlmgr update --list

- `datetime2`: `\DTMnow{}`
- `enumitem`: `\begin{description}` used in `$JHw/CV-LaTeX/parts/*.tex`
- `ifplatform`: `\ifwindows ... \else ... \fi`

# blindtext
    \blinddocument
    \Blinddocument
    \blindtext
    \Blindtext[5]
    \usepackage[bible]{blindtext}

# Currvita
    $JHw/CV/LaTeX/JH-CV.tex

    \UsePackage[LabelsAligned]{currvita}
    \setlength{\cvlabelwidth}{50mm} % defaults to that of "88/8888-88/8888"

# fontspec
    \setmainfont{...}
    \setmonofont{...}

# geometry
    \usepackage[hmargin=21mm,vmargin={24mm,26mm}]{geometry}
    \usepackage[margin=1.4cm]{geometry}
    \usepackage[top=1cm,bottom=8mm,left=5mm,right=1cm,paperwidth=21cm,paperheight=120mm]{geometry}

# graphicx
    \usepackage{graphicx}
    \graphicspath{<path>}
    \includegraphics[width=8cm]{plot}

# hyperref
    \pdfstringdefDisableCommands{...}  % to fix "token not allowed"

## URLs
    \url{https://www.wikibooks.org}
    \href{https://www.wikibooks.org}{Wikibooks home}

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

