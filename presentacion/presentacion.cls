%! suppress = DiscouragedUseOfDef
%! suppress = InclusionLoop
\ProvidesClass{presentacion}

\LoadClass[aspectratio=169]{beamer}


\RequirePackage{fontawesome}
\RequirePackage{worldflags}
\RequirePackage{etoolbox}
\RequirePackage{fontspec}
\RequirePackage{tikz}
\RequirePackage[most]{tcolorbox}
\RequirePackage{emoji}
\setemojifont{TwemojiMozilla}




% Reduce ToC vertical spacing to fit all sections on one slide
\makeatletter
\patchcmd{\beamer@sectionintoc}{\vskip1.5em}{\vskip0.4em}{}{}
\patchcmd{\beamer@sectionintoc}{\vfill}{\vskip0.15em}{}{}
\makeatother

% Define default accent colors
\definecolor{basecolor}{HTML}{E20613}

\colorlet{linkcolor}{basecolor}
\colorlet{accentcolor}{linkcolor!90}
\colorlet{symbolcolor}{linkcolor!85}



% Render a text with its symbol
% Usage; \socialtext{<icon>}{<label>}
\newcommand{\socialtext}[2]{\mbox{\textcolor{symbolcolor}{#1}\hspace{0.5em}#2\hspace{1em}}}
% Font Awesome icons aliases
\newcommand{\mailSymbol}{\faAt}
\newcommand{\locationSymbol}{\faMapMarker}
\newcommand{\infoSymbol}{\faInfo}
\newcommand{\blogSymbol}{\faRssSquare}
\newcommand{\cvpdfSymbol}{\faFilePdfO}
\newcommand{\linkedinSymbol}{\faLinkedinSquare}%{\faLinkedin}
\newcommand{\viadeoSymbol}{\faViadeo}
\newcommand{\mobileSymbol}{\faMobilePhone}
\newcommand{\githubSymbol}{\faGithub}
\newcommand{\stackOverflowSymbol}{\faStackOverflow}

\newcommand\link[2]{\color{linkcolor}\href{#1}{#2}\color{black} }


% Define author's tagline
% Usage: \tagline{<tag line>}
\newcommand*{\tagline}[1]{\def\@tagline{#1}}

% Define author's photo
% Usage \photo{<diameter>}{<photo>}
\newcommand{\photo}[2]{\def\@photo{#2}\def\@photodiameter{#1}}

% Render author's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\socialtext{\locationSymbol}{#1}}

% Render author's infos
% Usage: \infos{<infos>}
\newcommand*{\infos}[1]{\socialtext{\infoSymbol}{#1}}

% Render a link with its symbol
% Usage; \sociallink{<icon>}{<label>}
\newcommand{\sociallink}[3]{\mbox{\textcolor{symbolcolor}{#1}\hspace{0.5em}\link{#2}{#3}\hspace{1em}}}


% Render author's blog
% Usage: \blog{<blog>}
\newcommand*{\blog}[1]{\sociallink{\blogSymbol}{http://www.#1}{\underline{#1}}}

% Render author's PDF CV
% Usage: \cvpdf{<cvpdf>}
\newcommand*{\cvpdf}[1]{\sociallink{\cvpdfSymbol}{http://www.#1}{\underline{#1}}}

% Render author's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\sociallink{\linkedinSymbol}
    {http://www.linkedin.com/in/#1}{\underline{linkedin.com/in/#1}}}

% Render author's viadeo(optional)
% Usage: \viadeo{<viadeo-nick>}
\newcommand*{
        \viadeo
    }
    [1]
    {
        \sociallink{\viadeoSymbol}
            {http://www.viadeo.com/fr/profile/#1}
            {viadeo.com/fr/profile/#1}
    } 

% Render author's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\sociallink{\githubSymbol}
    {https://www.github.com/#1}{\underline{github.com/#1}}}

% Render author's email (optional)
% Usage: \email{<email adress>}
\newcommand*{\email}[1]{\sociallink{\mailSymbol}{mailto:#1}{\underline{#1}}}

% Render author's mobile phone (optional)
% Usage: \smartphone{<mobile phone number>}
\newcommand*\smartphone[1]{\socialtext{\mobileSymbol}{#1}}    

% Render author's stack overflow
\newcommand*{\stackoverflow}[1]{\sociallink{\stackOverflowSymbol}{https://stackoverflow.com/users/#1}{\underline{stackoverflow/#1}}}

% twitter
\newcommand*{\twitter}[1]{\sociallink{\faTwitter}{https://x.com/users/#1}{\underline{X/#1}}}

\flagsdefault[width=1em]

% Peru JUG theme, ported from the community's slide template.
% Geometry is in cm on the 16x9 beamer page, measured from the top-left corner.
\definecolor{pjred}{HTML}{E20613}
\definecolor{pjdark}{HTML}{111111}
\definecolor{pjblack}{HTML}{020B0A}

\setsansfont{Noto Sans}
\setmonofont{Noto Sans Mono}[Scale=MatchLowercase]

\setbeamertemplate{navigation symbols}{}
\setbeamersize{text margin left=1.1cm, text margin right=1.1cm}

\setbeamercolor{normal text}{fg=pjdark}
\setbeamercolor{structure}{fg=pjred}
\setbeamercolor{alerted text}{fg=pjred}
\setbeamercolor{example text}{fg=pjred}
\setbeamerfont{frametitle}{series=\bfseries}

\setbeamertemplate{frametitle continuation}{}
\setbeamertemplate{itemize items}[circle]
\setbeamertemplate{itemize subitem}[circle]

% Clickable section list in the footer: current section in red bold, the rest muted
\setbeamertemplate{section in head/foot}{\textcolor{pjred}{\bfseries\insertsectionhead}}
\setbeamertemplate{section in head/foot shaded}{\textcolor{pjdark!65}{\insertsectionhead}}

% Footer shared by every page: progress rule, community link, section navigation
% and a progress dial around the two-digit page number.
% The total frame count comes from the previous run, so it is clamped on the first one.
\newcommand{\pjfooter}{%
    \pgfmathsetmacro\pjprogress{min(1, \insertframenumber/max(1, \inserttotalframenumber))}%
    \fill[pjdark!20] (0.9,-8.1) rectangle ++(14.2,-0.05);
    \fill[pjred] (0.9,-8.1) rectangle ++(14.2*\pjprogress,-0.05);
    \node[anchor=west, inner sep=0, font=\fontsize{6.5}{8}\selectfont] at (0.9,-8.6)
        {Peru JUG \textperiodcentered\ linktr.ee/perujug};
    \node[anchor=west, inner sep=0, font=\fontsize{6.5}{8}\selectfont] at (3.9,-8.6)
        {\insertsectionnavigationhorizontal{10cm}{}{\hfill}};
    \draw[pjdark!20, line width=1.4pt] (14.8,-8.6) circle[radius=0.27];
    \draw[pjred, line width=1.4pt] (14.8,-8.33)
        arc[start angle=90, end angle=90-359.9*\pjprogress, radius=0.27];
    \node[inner sep=0, font=\bfseries\fontsize{6.5}{8}\selectfont] at (14.8,-8.6)
        {\ifnum\insertframenumber<10 0\fi\insertframenumber};
}

\setbeamertemplate{background}{%
    \begin{tikzpicture}[x=1cm, y=1cm]
        \useasboundingbox (0,0) rectangle (16,-9);
        \node[anchor=north west, inner sep=0] at (0,0)
            {\includegraphics[width=16cm, height=9cm]{img/fondo.jpg}};
        \node[anchor=north west, inner sep=0] at (0.75,-0.23)
            {\includegraphics[width=3.85cm]{img/logo.png}};
        \pjfooter
    \end{tikzpicture}%
}

\setbeamertemplate{headline}{\vbox to 1.3cm{}}
\setbeamertemplate{footline}{\vbox to 0.95cm{}}

% Section-style frames (\seccion) show only the title bar; content frames also get
% a translucent panel so text stays legible over the background.
\newif\ifpjpanel
\pjpaneltrue
% The frametitle box starts at the left text margin; shift back by it so coordinates are page-relative
\setbeamertemplate{frametitle}{%
    \hskip-1.1cm\rlap{%
    \begin{tikzpicture}[x=1cm, y=1cm]
        \useasboundingbox (0,0) rectangle (16,-1.35);
        \ifpjpanel
            \fill[white, opacity=0.88] (0.75,-1.2) rectangle (15.25,-6.75);
        \fi
        \fill[pjred] (0.75,-1.2) rectangle (15.25,-1.25);
        \fill[pjdark] (0.75,0) rectangle (15.25,-1.0);
        \node[anchor=west, text=white, text width=13.9cm, inner sep=0,
            font=\usebeamerfont{frametitle}\fontsize{15}{18}\selectfont] at (1.05,-0.5)
            {\insertframetitle};
    \end{tikzpicture}}%
}

% Section divider: title bar plus a short phrase introducing the topic
% Usage: \seccion{<title>}{<phrase>}
\newcommand{\seccion}[2]{{%
    \pjpanelfalse
    \begin{frame}[t]
        \frametitle{#1}
        {\Large #2\par}
    \end{frame}%
}}

% Flat blocks with a coloured rule on the left; the translucent body lets the rule colour tint it
\newcommand{\pjblock}[1]{%
    \begin{tcolorbox}[enhanced, colback=white, opacityback=0.9, colframe=#1,
        boxrule=0pt, leftrule=3pt, arc=0pt, outer arc=0pt,
        left=6pt, right=6pt, top=4pt, bottom=4pt, before skip=6pt, after skip=6pt]
    \ifx\insertblocktitle\@empty\else{\bfseries\color{#1}\insertblocktitle\par}\smallskip\fi
}
\setbeamertemplate{block begin}{\pjblock{pjdark!60}}
\setbeamertemplate{block end}{\end{tcolorbox}}
\setbeamertemplate{block alerted begin}{\pjblock{pjred}}
\setbeamertemplate{block alerted end}{\end{tcolorbox}}
\setbeamertemplate{block example begin}{\pjblock{pjdark}}
\setbeamertemplate{block example end}{\end{tcolorbox}}

% Cover page, after the community template's first slide
\newcommand{\portada}{{%
    \setbeamertemplate{background}{%
        \begin{tikzpicture}[x=1cm, y=1cm]
            \useasboundingbox (0,0) rectangle (16,-9);
            \node[anchor=north west, inner sep=0] at (0,0)
                {\includegraphics[width=16cm, height=9cm]{img/fondo.jpg}};
            \node[anchor=north west, inner sep=0] at (0,0)
                {\includegraphics[width=16cm, height=5.5cm]{img/portada.jpg}};
            \fill[pjblack] (0,-5.5) rectangle (16,-5.675);
            \node[anchor=north west, inner sep=0] at (0.507,-0.275)
                {\includegraphics[width=3.85cm]{img/logo.png}};
            \node[anchor=west, inner sep=0, text=white, text width=13.75cm] at (0.9,-3.4)
                {{\bfseries\fontsize{22}{26}\selectfont\inserttitle\par}
                 \smallskip{\fontsize{15}{18}\selectfont\insertsubtitle\par}};
            \node[anchor=north west, inner sep=0, text width=11cm] at (0.9,-6.4)
                {{\fontsize{11.3}{14}\selectfont\insertauthor\ \textperiodcentered\ \insertdate\par}
                 \smallskip{\small\insertinstitute\par}};
            \node[anchor=north west, inner sep=0] at (12.625,-6.0)
                {\includegraphics[width=2cm]{img/mascota.png}};
            \pjfooter
        \end{tikzpicture}%
    }%
    \begin{frame}[plain]\end{frame}%
}}
