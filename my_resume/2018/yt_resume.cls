\ProvidesClass{yt_resume}[2018/10/12 v0.1 resume class]

% \DeclareOption{calibri}{%
%   \def\mainfontface{Calibri}
% }

% \ProcessOptions\relax

% Set up the fonts according to options
\def\mainfontsize{11pt}
\def\mainfontface{}

% Set font size and paper type
\LoadClass[letterpaper,\mainfontsize]{article}

\usepackage[hmargin=1.25cm, vmargin=0.7cm]{geometry}
\usepackage[hidelinks]{hyperref}
\usepackage{fontawesome}


% New commands
\newcommand{\Name}[1]{\def\@name{#1}}
\newcommand{\Phone}[1]{\def\@phone{#1}}
\newcommand{\Email}[1]{\def\@email{#1}}
\newcommand{\LinkedIn}[1]{\def\@linkedin{#1}}
\newcommand{\Github}[1]{\def\@github{#1}}

\newcommand{\institution}[1]{\def\@institution{#1}}
\newcommand{\degree}[1]{\def\@degree{#1}}
\newcommand{\gpa}[1]{\def\@gpa{#1}}
\newcommand{\organization}[1]{\def\@organization{#1}}
\newcommand{\jobtitle}[1]{\def\@jobtitle{#1}}
\newcommand{\location}[1]{\def\@location{#1}}
\newcommand{\period}[1]{\def\@period{#1}}


% Style header
\newcommand{\header}[0]{
    \raggedright{
        \parbox[c]{12em}{
        \sffamily
            {\urlstyle{same}
                \faPhone \ \@phone\\
                \faEnvelope \ \href{mailto:\@email}{\@email}\\
            }
        }
    }
    \hfill
    \centering{
        \parbox[c]{12em}{
            \sffamily
            \Huge
            \@name
        }
    }
    \hfill
    \raggedleft{
        \parbox[c]{20em}{
        \sffamily
            {\urlstyle{same}
                \faLinkedinSquare \ \href{https://www.\@linkedin/}{\@linkedin}\\
            \faGithub \ \href{https://\@github}{\@github}
            }
        }
    }
    \noindent\makebox[\linewidth]{\rule{\paperwidth}{0.4pt}}
}

\renewcommand{\section}[1]{
    \raggedright \sffamily \textbf{\uppercase{#1}}
}

\renewcommand{\subsection}[5]{
    \degree{#1}
    \institution{#2} % or \organization
    \location{#3}
    \gpa{#4}
    \period{#5}
    \sffamily
    \@degree, \@institution, \@location \hfill \@gpa \hfill \@period
}