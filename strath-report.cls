\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{strath-report}[2025/10/19 University of Strathclyde Report]

% Document settings
\LoadClass[a4paper,oneside,12pt]{article}
\RequirePackage[utf8]{inputenc}
\RequirePackage[left=2.5cm, right=2.5cm, top=2cm, bottom=2cm,
  includehead,includefoot, headheight=19pt]{geometry}

% Formatting
\RequirePackage{parskip}
\RequirePackage[font=footnotesize]{caption}

% Symbols and fonts
\RequirePackage[T1]{fontenc}
% \RequirePackage{helvet}
% \renewcommand{\familydefault}{\sfdefault}
\RequirePackage{amsfonts}
% \RequirePackage{amsbsy}
% \RequirePackage{amsmath}
% \RequirePackage{siunitx}
\RequirePackage[super]{nth}

% Links and references
\RequirePackage{hyperref}
\RequirePackage{caption}
\RequirePackage[nodayofweek]{datetime}

% Graphics
\RequirePackage{graphicx}
\RequirePackage[x11names]{xcolor}
\RequirePackage{tikz}

% Headers and footers
\RequirePackage{fancyhdr}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[L]{\includegraphics[width=0.5\textwidth]{Header.png}}
\fancyfoot[R]{\thepage}
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
\newcommand*{\classcode}[1]{\gdef\@classcode{#1}}
\newcommand*{\@reportdate}{\the\day~\monthname[\the\month]~\the\year}
\newcommand*{\wordcount}[1]{\gdef\@wordcount{#1}}

\renewcommand*{\maketitle}{%
  \begin{titlepage}
    \strathheader
    \vfill
    \centering
    {\huge\bfseries\@title\unskip\strut\par}
    \vspace{2cm}
    {\Large\@classcode\unskip\strut\par}
    \vspace{2cm}
    Student Numbers:~~\@studentnumber\unskip\strut\par
    \vspace{1cm}
    Word Count:~~\@wordcount\unskip\strut\par
    \vfill
    {\today\par}
  \end{titlepage}
}