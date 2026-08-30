vim: nospell:

    $misc/CrossPlatform/QR; m4ps 0 1

    \usepackage[dvipsnames]{xcolor}
    tlmgr info pgfplots
    tlmgr update --list

`ifplatform`: `\ifwindows ... \else ... \fi`

# classes
    \documentclass[varwidth]{standalone}

## Memoir
    \defaultlists
    \firmlists  % less between
    \firmlists*  % less around
    \tightlists

    \documentclass[20pt,a4paper,article,extrafontsizes,twocolumn]{memoir}
    \newcommand{\maketitle}
    \nonzeroparskip

- `\the\columnsep` reports `10.0pt`
- `\the\parskip` reports `5.0pt plus 1.00006pt minus 1.00006pt`

### font sizes
     Class option   9pt  10pt  11pt  12pt  14pt  17pt  20pt  25pt  30pt   36pt   48pt   60pt
       \miniscule   4pt   5pt   6pt   7pt   8pt   9pt  10pt  11pt  12pt   14pt   17pt   20pt
            \tiny   5pt   6pt   7pt   8pt   9pt  10pt  11pt  12pt  14pt   17pt   20pt   25pt
      \scriptsize   6pt   7pt   8pt   9pt  10pt  11pt  12pt  14pt  17pt   20pt   25pt   30pt
    \footnotesize   7pt   8pt   9pt  10pt  11pt  12pt  14pt  17pt  20pt   25pt   30pt   36pt
           \small   8pt   9pt  10pt  11pt  12pt  14pt  17pt  20pt  25pt   30pt   36pt   48pt
      \normalsize   9pt  10pt  11pt  12pt  14pt  17pt  20pt  25pt  30pt   36pt   48pt   60pt
           \large  10pt  11pt  12pt  14pt  17pt  20pt  25pt  30pt  36pt   48pt   60pt   72pt
           \Large  11pt  12pt  14pt  17pt  20pt  25pt  30pt  36pt  48pt   60pt   72pt   84pt
           \LARGE  12pt  14pt  17pt  20pt  25pt  30pt  36pt  48pt  60pt   72pt   84pt   96pt
            \huge  14pt  17pt  20pt  25pt  30pt  36pt  48pt  60pt  72pt   84pt   96pt  108pt
            \Huge  17pt  20pt  25pt  30pt  36pt  48pt  60pt  72pt  84pt   96pt  108pt  120pt
            \HUGE  20pt  25pt  30pt  36pt  48pt  60pt  72pt  84pt  96pt  108pt  120pt  132pt

`4pt` & `26pt` up require option `extrafontsizes`

### margins
    \setlrmarginsandblock{30mm}{20mm}{*} % left and right margin
    \setulmarginsandblock{13mm}{25mm}{*} % upper and lower margin
    \checkandfixthelayout
    ...
    \begin{document}

### sectioning
    \chapterstyle{article}

#### lower level headings - default fonts
- sec: `\Large\bfseries`
- subsec: `\large\bfseries`
- subsubsec: `\bfseries`

#### lower level headings - section tweaks
    \setsecheadstyle{\color{gray}\Large\bfseries}
    \setsecheadstyle{\raggedright} % avoids margin overruns
    \setsecnumdepth{subsection} % = \setcounter{secnumdepth}{2}

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

# font - psnfss
    \usepackage{pifont}
    \ding{80}  % a little star
    \ding{220}  % a fat arrow

# fontspec
    \usepackage{fontspec}
        \setmainfont{...}
        \setmonofont{...}

# images
    \usepackage{adjustbox} % can more precisely position than graphicx
    \usepackage{tikz}

## graphicx
    \usepackage{graphicx}
    \graphicspath{<path>}
    \includegraphics[width=8cm]{plot}

# layout
    \raisebox{<len>}{<box>}
    \usepackage{titlesec} % incompatible with memoir

- `\usepackage{showframe}` (geometry option is neater)
- `enumitem`: `\begin{description}` used in `$Jwk/CV-LaTeX/parts/*.tex`

## Currvita
    $Jwk/CV-LaTeX/CV.tex

    \UsePackage[LabelsAligned]{currvita}
    \setlength{\cvlabelwidth}{50mm} % defaults to that of "88/8888-88/8888"

## geometry
    \usepackage[hmargin=21mm,vmargin={24mm,26mm}]{geometry}
    \usepackage[margin=1.4cm,showframe]{geometry}
    \usepackage[top=1cm,bottom=8mm,left=5mm,right=1cm,paperwidth=21cm,paperheight=120mm]{geometry}

## scalerel
    \usepackage{scalerel}
    ...
    \scaleto[max_width]{object}{height}

## verse
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

# pdfpages
    \usepackage{pdfpages}
    ...
    \includepdf[nup=2x3, pages=1-7]{<pdf1_basename>} % 2 columns, 3 rows
    ...
    \includepdf[pages=4,{},5]{<pdf2_basename>} % empty page between 4 & 5
    ...
    \includepdf[pages=-]{<pdf3_basename>} % all pages
    ...
    \includepdf[pages=last-1]{<pdf4_basename>} % reverse order
    ...
    \includepdfmerge[nup=2x1,scale=0.9]{<pdf5_basename>, 1-2,4-5,7,9}

    rg -ttex '\\usepackage\{pdfpages\}' -l > rg-tex-pdfpages.fetl

- doesn't respect `geometry` margins, so `\includepdfset{offset=<fromInnerEdge> <fromTop>}`
- if business cards aren't sized right, go through images

# text
    \usepackage{soul} % hyphenation for letterspacing, underlining, and more
    \usepackage{url}

`datetime2`: `\DTMnow{}`

## blindtext
    \blinddocument
    \Blinddocument
    \blindtext
    \Blindtext[5]
    \usepackage[bible]{blindtext}

## chngcntr
    \counterwithout{section}{Chapter} % removes unneeded Chapter number from section headings

functionality included in Memoir

## hyperref
    \pdfstringdefDisableCommands{...}  % to fix "token not allowed"

### URLs
    \url{https://www.wikibooks.org}
    \href{https://www.wikibooks.org}{Wikibooks home}

## Polyglossia
    \usepackage{polyglossia}
    \setdefaultlanguage[variant=uk]{english}
    \setdefaultlanguage{french}

