\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{strath-diss}[2025/08/25 University of Strathclyde Dissertation]

% Document settings
\LoadClass[a4paper,oneside,12pt]{book}
\RequirePackage[utf8]{inputenc}
\RequirePackage[left=2cm, right=2cm, top=1.5cm, bottom=1.5cm,
    includehead,includefoot, headheight=15pt]{geometry}

% Symbols and fonts
\RequirePackage[T1]{fontenc}
% \RequirePackage{fontspec}
% \setmainfont{Arial}
\RequirePackage{helvet}
\renewcommand{\familydefault}{\sfdefault}
\RequirePackage{amsfonts}
\RequirePackage{amsbsy}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{siunitx}
\RequirePackage[super]{nth}

% Links and references
\RequirePackage{hyperref}
\RequirePackage{caption}
\RequirePackage{datetime}

% Graphics
\RequirePackage{graphicx}
\RequirePackage[x11names]{xcolor}
\RequirePackage{tikz}

% Formatting
\RequirePackage{setspace}
\setstretch{1.2}
\RequirePackage{enumitem}
\setlist{nolistsep}

\RequirePackage[skip=0.5\baselineskip]{parskip}

% Remove 'Chapter N' text
% https://tex.stackexchange.com/questions/120740/how-do-i-remove-chapter-n-from-the-chapter-titles-of-a-book
\RequirePackage[explicit, compact]{titlesec}
\titleformat{\chapter}[block]
{\bfseries\huge}{\filright\huge\thechapter.}{1ex}{\huge\filright #1}
\titlespacing*{\chapter}{0pt}{-30pt}{20pt}



% Remove hyphenation of words
% https://stackoverflow.com/a/65156105
\tolerance=9999
\emergencystretch=10pt
\hyphenpenalty=10000
\exhyphenpenalty=100


\RequirePackage{etoolbox}
\AtBeginEnvironment{thebibliography}{\interlinepenalty=10000}

% Nomenclature
\RequirePackage{nomencl}
\makenomenclature

% Headers and footers
\RequirePackage{fancyhdr}

\fancypagestyle{fancy}{
    \fancyhf{}
    \fancyhead[L]{\nouppercase{\leftmark}}
    \fancyhead[R]{\hyperlink{TOC}{Contents}}
    \fancyfoot[C]{\thepage}
}

\fancypagestyle{frontmatter}{%
    \fancyhf{}
    \fancyhead[L]{\nouppercase{\leftmark}}
    \fancyfoot[C]{\thepage}
}

\newcommand{\strathheader}{%
    \pagestyle{empty}
    \noindent
    \begin{figure}
        \begin{tikzpicture}[remember picture, overlay]
            \node[anchor=north west, align=left, inner sep=0] at (current page.north west){\includegraphics[width=\paperwidth, keepaspectratio]{Strathclyde MAE Header.png}};
        \end{tikzpicture}
    \end{figure}
}

% Title page
\newcommand*{\studentnumber}[1]{\gdef\@studentnumber{#1}}
\newcommand*{\project}[1]{\gdef\@project{#1}}
\newcommand*{\course}[1]{\gdef\@course{#1}}
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand*{\wordcount}[1]{\gdef\@wordcount{#1}}

\renewcommand*{\maketitle}{%
    \begin{titlepage}
        \strathheader
        \vfill
        \centering
        {\Huge\bfseries\@title\unskip\strut\par}
        \vspace{2cm}
        {\Large\bfseries\@author\unskip\strut\par}
        \vspace{2cm}
        Student Number:~~\@studentnumber\unskip\strut\par
        \vspace{1cm}
        Supervisor:~~\@supervisor\unskip\strut\par
        \vspace{1cm}
        Word Count:~~\@wordcount\unskip\strut\par
        \vspace{2cm}
        A thesis submitted in partial fulfilment for the requirement of degree \\
        of \@course\unskip\strut\par
        \vfill
        {\monthname[\the\month]~\the\year\par}
    \end{titlepage}
}