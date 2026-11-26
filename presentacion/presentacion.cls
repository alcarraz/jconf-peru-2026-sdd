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
% Page margin shared by the logo, QR, title bar, panel and footer, in cm; text sits 0.4cm further in
\newcommand{\pjm}{0.4}
\newlength{\pjtextmargin}
\setlength{\pjtextmargin}{\dimexpr\pjm cm + 0.4cm\relax}
\setbeamersize{text margin left=\pjtextmargin, text margin right=\pjtextmargin}

\setbeamercolor{normal text}{fg=pjdark}
\setbeamercolor{structure}{fg=pjred}
\setbeamercolor{alerted text}{fg=pjred}
\setbeamercolor{example text}{fg=pjred}
\setbeamercolor{bibliography entry author}{fg=pjdark}
\setbeamercolor{bibliography entry title}{fg=pjdark}
\setbeamercolor{bibliography entry location}{fg=pjdark!65}
\setbeamercolor{bibliography entry note}{fg=pjdark!65}
\setbeamerfont{frametitle}{series=\bfseries}

\setbeamertemplate{frametitle continuation}{}
\setbeamertemplate{itemize items}[circle]
\setbeamertemplate{itemize subitem}[circle]

% Clickable section list in the footer: current section in red bold, the rest muted
\setbeamertemplate{section in head/foot}{\textcolor{pjred}{\bfseries\insertsectionhead}}
\setbeamertemplate{section in head/foot shaded}{\textcolor{pjdark!65}{\insertsectionhead}}

% QR to the talk repository, top right; red modules on a transparent background, sized so
% its bottom lines up with the title bar's (2.3cm from the top of the page)
\newcommand{\pjqrimage}{\includegraphics[width=\dimexpr 2.3cm - \pjm cm\relax]{img/qr-code.png}}

% Footer shared by every page: progress rule, community link, section navigation
% and a progress dial around the two-digit page number.
% The total frame count comes from the previous run, so it is clamped on the first one.
\newcommand{\pjfooter}{%
    \pgfmathsetmacro\pjprogress{min(1, \insertframenumber/max(1, \inserttotalframenumber))}%
    % Footer items are centred on the dial, which sits \pjm from the bottom right corner
    \pgfmathsetmacro\pjfy{-9 + \pjm + 0.27}%
    \fill[pjdark!20] ({\pjm},{\pjfy + 0.5}) rectangle ++({16 - 2*\pjm},-0.05);
    \fill[pjred] ({\pjm},{\pjfy + 0.5}) rectangle ++({(16 - 2*\pjm)*\pjprogress},-0.05);
    \node[anchor=west, inner sep=0, font=\fontsize{6.5}{8}\selectfont] at ({\pjm},\pjfy)
        {Peru JUG \textperiodcentered\ \href{https://linktr.ee/perujug}{linktr.ee/perujug}};
    \node[anchor=west, inner sep=0, font=\fontsize{6.5}{8}\selectfont] at ({\pjm + 3.15},\pjfy)
        {\insertsectionnavigationhorizontal{10.5cm}{}{\hfill}};
    \draw[pjdark!20, line width=1.4pt] ({16 - \pjm - 0.27},\pjfy) circle[radius=0.27];
    \draw[pjred, line width=1.4pt] ({16 - \pjm - 0.27},{\pjfy + 0.27})
        arc[start angle=90, end angle=90-359.9*\pjprogress, radius=0.27];
    \node[inner sep=0, font=\bfseries\fontsize{6.5}{8}\selectfont] at ({16 - \pjm - 0.27},\pjfy)
        {\ifnum\insertframenumber<10 0\fi\insertframenumber};
}

\setbeamertemplate{background}{%
    \begin{tikzpicture}[x=1cm, y=1cm]
        \useasboundingbox (0,0) rectangle (16,-9);
        \node[anchor=north west, inner sep=0] at (0,0)
            {\includegraphics[width=16cm, height=9cm]{img/fondo.jpg}};
        % Offset by the image's own transparent padding so the visible logo sits \pjm
        % from the top and left edges, like the QR on the other side
        \node[anchor=north west, inner sep=0] at ({\pjm - 0.07},{-\pjm + 0.05})
            {\includegraphics[width=3.85cm]{img/logo.png}};
        \pjfooter
    \end{tikzpicture}%
}

\setbeamertemplate{headline}{\vbox to 1.3cm{}}
% The footline is typeset after the frame content, so the QR drawn here stays on top of
% the title bar and the panel
\setbeamertemplate{footline}{%
    \begin{tikzpicture}[remember picture, overlay]
        \node[anchor=north east, inner sep=0, opacity=0.5]
            at ([xshift=-\pjm cm, yshift=-\pjm cm]current page.north east) {\pjqrimage};
    \end{tikzpicture}%
    \vbox to 1.05cm{}%
}

% Section-style frames (\seccion) show only the title bar; content frames also get
% a translucent panel so text stays legible over the background.
% Title bar fades from black into the page background, staying opaque under the title
% text and clearing only towards the QR on the right (white = opaque, black = transparent)
\usetikzlibrary{fadings}
\pgfdeclarehorizontalshading{pjtitlemask}{100bp}{color(0bp)=(white); color(65bp)=(white!80!black); color(100bp)=(black)}
\pgfdeclarefading{pjtitle}{\pgfuseshading{pjtitlemask}}

\newif\ifpjpanel
\pjpaneltrue
% The frametitle box starts at the left text margin; shift back by it so coordinates are page-relative
\setbeamertemplate{frametitle}{%
    \hskip-\pjtextmargin\rlap{%
    \begin{tikzpicture}[x=1cm, y=1cm]
        \useasboundingbox (0,0) rectangle (16,-1.35);
        % y is relative to the top of the frametitle, 1.3cm below the page top; the panel
        % stops 0.13cm above the footer's progress rule
        \ifpjpanel
            \fill[white, opacity=0.88] ({\pjm},-1.2) rectangle ({16 - \pjm},{-9 + \pjm + 0.27 + 0.63 + 1.3});
        \fi
        \fill[pjred] ({\pjm},-1.2) rectangle ({16 - \pjm},-1.25);
        % Ends 0.1cm before the QR, whose left edge is always at 13.7cm: it is
        % (2.3 - \pjm) wide and \pjm from the right edge
        \fill[pjdark, path fading=pjtitle, fit fading=true] ({\pjm},0) rectangle (13.6,-1.0);
        \node[anchor=west, text=white, text width={13.4cm - \pjm cm - 0.3cm}, inner sep=0,
            font=\usebeamerfont{frametitle}\fontsize{15}{18}\selectfont] at ({\pjm + 0.3},-0.5)
            {\insertframetitle};
    \end{tikzpicture}}%
}

% Full-screen frame: background image and a translucent panel only, without logo, QR,
% title bar or footer. Usage: {\pantallacompleta\begin{frame}[plain] ... \end{frame}}
\newcommand{\pantallacompleta}{%
    \setbeamertemplate{background}{%
        \begin{tikzpicture}[x=1cm, y=1cm]
            \useasboundingbox (0,0) rectangle (16,-9);
            \node[anchor=north west, inner sep=0] at (0,0)
                {\includegraphics[width=16cm, height=9cm]{img/fondo.jpg}};
            \fill[white, opacity=0.88] ({\pjm},{-\pjm}) rectangle ({16 - \pjm},{-9 + \pjm});
        \end{tikzpicture}%
    }%
}

% Flow diagram phases are styled by what they modify: the default red border writes Spec Kit
% artifacts, pjcodigo writes code and pjlectura changes nothing; pjmuestra draws legend swatches
\tikzset{
    pjcodigo/.style={fill=pjred, text=white},
    pjlectura/.style={dashed, draw=pjdark!55, fill=pjdark!6},
    pjmuestra/.style={rectangle, rounded corners=1.5pt, draw=pjred, fill=white,
        minimum width=0.55cm, minimum height=0.32cm, inner sep=0},
    pjleyenda/.style={font=\scriptsize, anchor=west, inner sep=2pt},
}

% Flow diagram phase: command name, then its artifact in small type
% The caption goes in a tabular so its own line breaks keep the small font (TikZ resets
% the font at each node line)
\newcommand{\pjfase}[2]{\texttt{\bfseries #1}\\[-1pt]{\scriptsize\begin{tabular}{@{}c@{}}#2\end{tabular}}}

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

% Transitions: a short fade between slides and a push on the first slide of each section. Steps
% of the same frame (\pause) get none, so revealed content appears in place. The frame number
% tells steps apart because the slide-in-frame counter has already advanced at shipout.
\makeatletter
\def\pjlastsection{0}
\def\pjlastframe{0}
\addtobeamertemplate{background canvas}{%
    \ifnum\insertframenumber=\pjlastframe\relax
        \transreplace
    \else\ifnum\insertsectionnumber=\pjlastsection\relax
        \transfade[duration=0.3]%
    \else
        \transpush[duration=0.5, direction=180]%
        \xdef\pjlastsection{\insertsectionnumber}%
    \fi\fi
    \xdef\pjlastframe{\insertframenumber}%
}{}
\makeatother
