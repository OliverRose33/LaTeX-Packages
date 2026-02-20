\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{usm-bom}[2025/03/17 USM BoM class]

% Load article class
\LoadClass{article}
\RequirePackage[a4paper, landscape, margin = 2cm]{geometry}
\renewcommand{\normalsize}{\fontsize{8pt}{10pt}\selectfont}
\renewcommand{\small}{\fontsize{7pt}{9pt}\selectfont}
\setlength{\parindent}{0pt}

% =============================== Load packages ================================
\RequirePackage{hyperref}
\RequirePackage{graphicx}
\RequirePackage{datetime}
\renewcommand{\dateseparator}{-}
\RequirePackage{caption}

% =================================== Fonts ====================================
\RequirePackage[T1]{fontenc}
\RequirePackage{helvet}
\renewcommand{\familydefault}{\sfdefault}
\RequirePackage{eurosym} % Euro symbol

% ================================== Colours ===================================
\RequirePackage{xcolor}
\definecolor[named]{USMBlue}{HTML}{003366}
\definecolor[named]{BoMPartGrey}{HTML}{D2D2D2}
\definecolor[named]{BoMProcessDark}{HTML}{F0F0F0}
\definecolor[named]{BoMProcessLight}{HTML}{FAFAFA}
\definecolor[named]{ColourBR}{HTML}{99CCFF}
\definecolor[named]{ColourDT}{HTML}{CCFFCC}
\definecolor[named]{ColourEL}{HTML}{FFCC99}
\definecolor[named]{ColourTS}{HTML}{CCFF99}
\definecolor[named]{ColourFR}{HTML}{FF9999}
\definecolor[named]{ColourMS}{HTML}{CC99FF}
\definecolor[named]{ColourST}{HTML}{FF9900}
\definecolor[named]{ColourSU}{HTML}{FFFF00}
\definecolor[named]{ColourWT}{HTML}{CCFFFF}

% ============================= Header and Footer ==============================
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\RequirePackage{zref-totpages} % Total pagecount

\setlength{\headheight}{18pt}
% \fancyhead[L]{\includegraphics[width=1cm]{res/USM Text Blue.png}}
\fancyhead[L]{\color{USMBlue}\Large\textbf{USM}}
\fancyhead[C]{\textbf{CCBOM -- University of Strathclyde}}
\fancyhead[R]{{\yyyymmdddate \today} \currenttime}
\renewcommand{\headrulewidth}{0.4pt}

\fancyfoot[C]{page~\thepage~of~\ztotpages}
\fancyfoot[R]{\hyperlink{contents}{Contents}}
\renewcommand{\footrulewidth}{0.4pt}

% ============================= Table of Contents ==============================
\RequirePackage{tocloft}
\RequirePackage{multicol}
\AtBeginDocument{\addtocontents{toc}{\protect\begin{multicols}{3}}}
\AtEndDocument {\addtocontents{toc}{\protect\end{multicols}}}
\renewcommand{\cfttoctitlefont}{\hfill\large\bfseries}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftdotsep}{0}

% =================================== Tables ===================================
\RequirePackage{longtable}[=v4.13]
\RequirePackage{tabularray}
\RequirePackage{xparse}

\NewTblrTheme{bomassembly}{
    \DefTblrTemplate{firsthead,middlehead,lasthead}{default}{}%
}

\NewExpandableDocumentCommand{\BoMRowPart}{mmmmm}{%
    \unexpanded{\SetRow{BoMPartGrey, 1.5em, abovesep+=0.15em}\SetCell[c=2]{l}}
    \unexpanded{\textbf{#1}} & & % Part name
    \unexpanded{\textit{#2}} & % Description
    \SetCell{l} #3 & % Make or buy
    \SetCell{r} \unexpanded{#4} & % Part cost
    \unexpanded{\small #5} \\ % Part number
}

\NewExpandableDocumentCommand{\BoMStep}{mmmmm}{%
    \unexpanded{\SetRow{font = \small}}
    #1 &
    #2 &
    ~~~~\unexpanded{\textit{#3}} &
    #4 & #5 & \\
}

\newenvironment{assemblytable}[6]{
    \newpage
    \captionlistentry[table]{#2 #1}
    \phantomsection\addcontentsline{toc}{table}{#2 #1}
    \begin{longtblr}[
        expand = \expanded,
        theme = bomassembly
    ]{
        colspec = {|[5pt,#4] p{3.5em} X[2,l] X[3,l] X[2,r] X[2,l] p{5.5em}},
        rowhead = 1,
        rowsep = 0.2pt, colsep = 2pt,
        row{odd} = {BoMProcessLight},
        row{even} = {BoMProcessDark},
        row{1} = {#4, 1.5em, abovesep+=0.15em}
    }
    \SetCell[c=2]{l}\textbf{#2} (#3) & & % System ID and name
    \textbf{#1} & & % Assembly name
    \SetCell{r}#5 & % Part cost
    {\small #6} \\ % Part number
}
{\end{longtblr}}