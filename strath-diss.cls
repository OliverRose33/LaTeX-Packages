\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{strath-diss}[2025/08/25 University of Strathclyde Dissertation]

% Document settings
\LoadClass[a4paper,oneside,12pt]{book}
\RequirePackage[utf8]{inputenc}
\RequirePackage[left=2.5cm, right=2.5cm, top=2cm, bottom=4cm,
  includehead,includefoot, headheight=15pt]{geometry}

% Symbols and fonts
\RequirePackage[T1]{fontenc}
\RequirePackage{helvet}
\renewcommand{\familydefault}{\sfdefault}
\RequirePackage{amsfonts}
\RequirePackage{amsbsy}
\RequirePackage{amsmath}
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
\setstretch{1.5}
\RequirePackage{enumitem}

% Nomenclature
\RequirePackage{nomencl}
\makenomenclature

\RequirePackage{etoolbox}
\renewcommand\nomgroup[1]{%
  \item[\bfseries
  \ifstrequal{#1}{C}{Constants}{%
  \ifstrequal{#1}{S}{Variables}{}}%
]}

% Headers and footers
\RequirePackage{fancyhdr}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[L]{\nouppercase{\leftmark}}
\pagestyle{fancy}

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
\newcommand*{\@degreedate}{\monthname[\the\month]~\the\year}
\newcommand*{\wordcount}[1]{\gdef\@wordcount{#1}}

\renewcommand*{\maketitle}{%
  \begin{titlepage}
    \strathheader
    \vfill
    \centering
    {\huge\bfseries\@title\unskip\strut\par}
    \vspace{2cm}
    Author:~~\@author\unskip\strut\par
    \vspace{1cm}
    Student Number:~~\@studentnumber\unskip\strut\par
    \vspace{1cm}
    Supervisor:~~\@supervisor\unskip\strut\par
    \vspace{1cm}
    Word Count:~~\@wordcount\unskip\strut\par
    \vspace{2cm}
    A thesis submitted in partial fulfilment for the requirement of degree \\
    of \@course\unskip\strut\par
    \vfill
    {\@degreedate\par}
  \end{titlepage}
}