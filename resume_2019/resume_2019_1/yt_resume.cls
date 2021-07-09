\ProvidesClass{yt_resume}[2018/10/12 v0.1 resume class]

% \DeclareOption{calibri}{%
%   \def\mainfontface{Calibri}
% }

% \ProcessOptions\relax

% Set up the fonts according to options
\def\mainfontsize{11pt}
\def\mainfontface{}

% Set font size and paper type
\LoadClass[letterpaper,\mainfontsize]{article} % Font size and paper type

\usepackage[hmargin=1.25cm, vmargin=0.7cm]{geometry}
\usepackage[hidelinks]{hyperref}
\usepackage{fontawesome}
%\usepackage[parfill]{parskip} % Remove paragraph indentation
%\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
%\usepackage{ifthen} % Required for ifthenelse statements

%\pagestyle{empty} % Suppress page numbers


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
%    \raggedright{
%        \parbox[c]{12em}{
%        \sffamily
%            {\urlstyle{same}
%                \faPhone \ \@phone\\
%                \faEnvelope \ \href{mailto:\@email}{\@email}\\
%            }
%        }
%    }
%    \hfill
%    \centering{
%        \parbox[c]{12em}{
%            \sffamily
%            \Huge
%            \@name
%        }
%    }
    \raggedright{
        \parbox[c]{20em}{
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
                \faPhone \ \@phone\\
                \faEnvelope \ \href{mailto:\@email}{\@email}\\
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

%\def \name#1{\def\@name{#1}} % Defines the \name command to set name
%\def \@name {} % Sets \@name to empty by default

%\def \addressSep {$\diamond$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
%\let \@addressone \relax
%\let \@addresstwo \relax
%\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
%\def \address #1{
%  \@ifundefined{@addresstwo}{
%    \def \@addresstwo {#1}
%  }{
%  \@ifundefined{@addressthree}{
%  \def \@addressthree {#1}
%  }{
%     \def \@addressone {#1}
%  }}
%}

% \printaddress is used to style an address line (given as input)
%\def \printaddress #1{
%  \begingroup
%    \def \\ {\addressSep\ }
%    \centerline{#1}
%  \endgroup
%  \par
%  \addressskip
%}

% \printname is used to print the name as a page header
%\def \printname {
%  \begingroup
%    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
%    \nameskip\break
%  \endgroup
%}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

%\let\ori@document=\document
%\renewcommand{\document}{
%  \ori@document  % Begin document
%  \printname % Print the name specified with \name
%  \@ifundefined{@addressone}{}{ % Print the first address if specified
%    \printaddress{\@addressone}}
%  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
%    \printaddress{\@addresstwo}}
%     \@ifundefined{@addressthree}{}{ % Print the third address if specified
%    \printaddress{\@addressthree}}
%}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
%\newenvironment{rSection}[1]{ % 1 input argument - section name
%  \sectionskip
%  \MakeUppercase{\bf #1} % Section title
%  \sectionlineskip
%  \hrule % Horizontal line
%  \begin{list}{}{ % List for each individual item in the section
%    \setlength{\leftmargin}{1.5em} % Margin within the section
%  }
%  \item[]
%}{
%  \end{list}
%}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

%\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
% {\bf #1} \hfill {#2} % Bold company name and date on the right
% \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
%  \\
%  {\em #3} \hfill {\em #4} % Italic job title and location
%  }\smallskip
%  \begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
%   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
%  }{
%  \end{list}
%  \vspace{0.5em} % Some space after the list of bullet points
%}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
%\def\namesize{\huge} % Size of the name at the top of the document
%\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
%\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
%\def\nameskip{\bigskip} % The space after your name at the top
%\def\sectionskip{\medskip} % The space after the heading section
