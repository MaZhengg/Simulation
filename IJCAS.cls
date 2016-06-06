%%
%% $ IJCAS.cls $
%%
%%  written by Karnes Kim, Feb. 2004
%%	modified by CDSL, SNU, July 2011; marked with `2011'
%% --------------------------------------------------------------
%% 
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.2
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.2 or later is part of all distributions of LaTeX
%% version 1999/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{IJCAS}
              [2011/07/26 v0.02 LaTeX class for IJCAS]

%% BASIC PARAMETERS SETTING UP
\@twosidetrue
\@mparswitchfalse
\@twocolumntrue
\newif\if@cmfont
\@cmfontfalse
\newif\if@draft
\newif\if@sloppy
\@draftfalse
\DeclareOption{draft}{\setlength\overfullrule{5pt}\@drafttrue}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}\@draftfalse}
\fi
\DeclareOption{cm}{\@cmfonttrue}
\DeclareOption{sloppy}{\@sloppytrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\ExecuteOptions{final}
\ProcessOptions
\RequirePackage[T1]{fontenc}
\usepackage{fancyhdr, ifthen, lastpage}
\usepackage{dblfloatfix}
\usepackage{amsmath}
\usepackage{cite}
\usepackage{picins}
\usepackage{tabu, booktabs, color}
\usepackage{flushend}
\usepackage{float}  %% for definition of foot* environment. NEVER REMOVE!!
\usepackage{dblfloatfix}  %% for inserting figures. NEVER REMOVE!!
\PassOptionsToPackage{hyphens}{url}
\usepackage[colorlinks,hyperindex,breaklinks, hyperfootnotes=false]{hyperref}
\hypersetup{citecolor=blue, linkcolor=black, urlcolor=black}
\AtBeginDocument{\label{FirstPage}} %% Mark the first page for checking the first page number

%% DOCUMENT FONT: if [cm] options is given, we will use
%% CM font, if not, mathptmx-like TIMES fonts used.
\if@cmfont
\else
\@ifpackageloaded{mathptmx}{}{%
\def\rmdefault{ptm}
\DeclareSymbolFont{operators}   {OT1}{ztmcm}{m}{n}
\DeclareSymbolFont{letters}     {OML}{ztmcm}{m}{it}
\DeclareSymbolFont{symbols}     {OMS}{ztmcm}{m}{n}
\DeclareSymbolFont{largesymbols}{OMX}{ztmcm}{m}{n}
\DeclareSymbolFont{bold}        {OT1}{ptm}{bx}{n}
\DeclareSymbolFont{italic}      {OT1}{ptm}{m}{it}
\@ifundefined{mathbf}{}{\DeclareMathAlphabet{\mathbf}{OT1}{ptm}{bx}{n}}
\@ifundefined{mathit}{}{\DeclareMathAlphabet{\mathit}{OT1}{ptm}{m}{it}}
\DeclareMathSymbol{\omicron}{0}{operators}{`\o}
\renewcommand{\jmath}{%
  \PackageError{IJCAS}
  {The symbols \protect\jmath, \protect\amalg\space and
  \protect\coprod\MessageBreak
  are not available with this package along with mathptmx}
  {Type \space <return> \space to proceed;
  your command will be ignored.}}
\let\amalg=\jmath
\let\coprod=\jmath
\thinmuskip=2mu
\medmuskip=2.5mu plus 1mu minus 1mu
\thickmuskip=4mu plus 1.5mu minus 1mu
\DeclareRobustCommand\hbar{{%
 \dimen@.03em%
 \dimen@ii.06em%
 \def\@tempa##1##2{{%
   \lower##1\dimen@\rlap{\kern##1\dimen@ii\the##2 0\char22}}}%
 \mathchoice\@tempa\@ne\textfont
            \@tempa\@ne\textfont
            \@tempa\defaultscriptratio\scriptfont
            \@tempa\defaultscriptscriptratio\scriptscriptfont
  h}}
\def\boldmath{%
   \PackageWarning%
   {mathptmx}%
   {There are no bold math fonts}%
   \global\let\boldmath=\relax
}
\def\defaultscriptratio{.74}
\def\defaultscriptscriptratio{.6}
\DeclareMathSizes{5}{5}{5}{5}
\DeclareMathSizes{6}{6}{5}{5}
\DeclareMathSizes{7}{7}{5}{5}
\DeclareMathSizes{8}{8}{6}{5}
\DeclareMathSizes{9}{9}{7}{5}
\DeclareMathSizes{9.5}{9.5}{7}{5}
\DeclareMathSizes{10}{10}{7.4}{6}
\DeclareMathSizes{10.95}{10.95}{8}{6}
\DeclareMathSizes{12}{12}{9}{7}
\DeclareMathSizes{14.4}{14.4}{10.95}{8}
\DeclareMathSizes{17.28}{17.28}{12}{10}
\DeclareMathSizes{20.74}{20.74}{14.4}{12}
\DeclareMathSizes{24.88}{24.88}{17.28}{14.4}
\DeclareOption{slantedGreek}{%
  \DeclareMathSymbol{\Gamma}{\mathalpha}{letters}{0}
  \DeclareMathSymbol{\Delta}{\mathalpha}{letters}{1}
  \DeclareMathSymbol{\Theta}{\mathalpha}{letters}{2}
  \DeclareMathSymbol{\Lambda}{\mathalpha}{letters}{3}
  \DeclareMathSymbol{\Xi}{\mathalpha}{letters}{4}
  \DeclareMathSymbol{\Pi}{\mathalpha}{letters}{5}
  \DeclareMathSymbol{\Sigma}{\mathalpha}{letters}{6}
  \DeclareMathSymbol{\Upsilon}{\mathalpha}{letters}{7}
  \DeclareMathSymbol{\Phi}{\mathalpha}{letters}{8}
  \DeclareMathSymbol{\Psi}{\mathalpha}{letters}{9}
  \DeclareMathSymbol{\Omega}{\mathalpha}{letters}{10}
}
\DeclareMathSymbol{\upDelta}{\mathord}{operators}{1}
\DeclareMathSymbol{\upOmega}{\mathord}{operators}{10}
\ProcessOptions\relax
\let\s@vedhbar\hbar
\AtBeginDocument{%
  \DeclareFontFamily{U}{msa}{}%
  \DeclareFontShape{U}{msa}{m}{n}{<->msam10}{}%
  \DeclareFontFamily{U}{msb}{}%
  \DeclareFontShape{U}{msb}{m}{n}{<->msbm10}{}%
  \DeclareFontFamily{U}{euf}{}%
  \DeclareFontShape{U}{euf}{m}{n}{<-6>eufm5<6-8>eufm7<8->eufm10}{}%
  \DeclareFontShape{U}{euf}{b}{n}{<-6>eufb5<6-8>eufb7<8->eufb10}{}%
  \@ifpackageloaded{amsfonts}{\let\hbar\s@vedhbar}{}
  \@ifpackageloaded{amsmath}{}{%
    \newdimen\big@size
    \addto@hook\every@math@size{\setbox\z@\vbox{\hbox{$($}\kern\z@}%
       \global\big@size 1.2\ht\z@}
    \def\bBigg@#1#2{%
       {\hbox{$\left#2\vcenter to#1\big@size{}\right.\n@space$}}}
    \def\big{\bBigg@\@ne}
    \def\Big{\bBigg@{1.5}}
    \def\bigg{\bBigg@\tw@}
    \def\Bigg{\bBigg@{2.5}}
  }%
 }%
}
\fi
%%%
%%% size definitions
%%%
\def\@vpt{5}
\def\@vipt{6}
\def\@viipt{7}
\def\@viiipt{8}
\def\@ninesize{9}
\def\@ixpt{9.5}
\def\@xpt{10}% 10.5 -> 10 on 2011
\def\@elevensize{10.0}% 11.0 -> 10.0 on 2011
\def\@xipt{11.25}
\def\@xiipt{12.24}
\def\@xivpt{15}
\def\@xviipt{17.28}
\def\@xxpt{20.74}
\def\@xxvpt{24.88}
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xpt\@xiipt
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\newcommand\small{%
   \@setfontsize\small\@ixpt{11}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\footnotesize{%
%   \@setfontsize\footnotesize\@viiipt{9.5}%
   \@setfontsize\footnotesize\@ninesize{9.5}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\newcommand\ninesize{\@setfontsize\ninesize\@ninesize{9.5}}
\newcommand\elevensize{\@setfontsize\elevensize\@elevensize{11.5}}
\newcommand\large{\@setfontsize\large\@xiipt{14}}
\newcommand\Large{\@setfontsize\Large\@xivpt{18}}
\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
\setlength\parindent{1em}
\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}
\setlength\headheight{12\p@}
\setlength\headsep   {25\p@}
\setlength\topskip   {10\p@}
\setlength\footskip{30\p@}
\if@compatibility \setlength\maxdepth{4\p@} \else
\setlength\maxdepth{.5\topskip} \fi
%%%%% *
\setlength{\skip\footins}{9\p@ \@plus 4\p@ \@minus 2\p@}
\setlength\floatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep   {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}
\def\@listi{\leftmargin\leftmargini
            \parsep 2\p@ \@plus2\p@ \@minus\p@
            \topsep 6\p@ \@plus2\p@ \@minus4\p@
            \itemsep0\p@ \@plus1\p@ \@minus\p@}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    4\p@ \@plus2\p@ \@minus\p@
              \parsep    2\p@ \@plus\p@  \@minus\p@
              \itemsep   0\p@}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    2\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep   0\p@}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}
%%%
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.75}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.8}
\renewcommand\dblfloatpagefraction{.75}

%%% PAGESTYLE
\def\ps@IJCASheadings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
%%	  \def\@oddhead{\sf\ninesize\journal@title~Vol.~\journal@volumn, No.~\journal@number,\ \journal@year\hfil\thepage}%
%%	  \def\@evenhead{\sf\ninesize\thepage\hfil\journal@title~Vol.~\journal@volumn, No.~\journal@number,\ \journal@year}
%	  \def\@oddhead{\sf\small\journal@title\hfil\thepage} % replaced on 2011
%	  \def\@evenhead{\sf\small\thepage\hfil\journal@title} % replaced on 2011
	  \def\@oddhead{\sf\small\@title\hfil\thepage} % replaced on 2015
	  \def\@evenhead{\sf\small\journal@title\hfil\thepage} % replaced on 2015
      \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection\quad
        \fi
        ##1}}{}}%
    \def\subsectionmark##1{%
      \markright {%
        \ifnum \c@secnumdepth >\@ne
          \thesubsection\quad
        \fi
        ##1}}}

%%% MAKETITLE
\newcommand\maketitle{\par
  \begingroup
	\renewcommand\thefootnote{}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.5em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \thispagestyle{IJCASheadings}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

\def\@maketitle{%
  \newpage
  \null
  \vskip 1.0em%
  \begin{center}%
%  \begin{flushleft}
%  \let \footnote \thanks
%    {\minipage{.85\textwidth}{\centering\Large\bf\@title \par}\endminipage}%
    {\minipage{\textwidth}{\fontsize{15.5pt}{18pt}\selectfont{\textcolor[RGB]{70,126,166}{\bf\@title}} \par}\endminipage}%
    \vskip .5em%
    {%
      \lineskip .5em%
      \hskip -1pc
      \minipage{\textwidth}{
      \begin{tabular}[t]{l}%
        {\elevensize\bf\@author}%
      \end{tabular}\par}%
      \endminipage}
%    \vskip .2em%
%    {\large \@date}%
%  \end{center}%
%  \end{flushleft}
%  \par
%  \vskip 1.0em%
%  \vskip -2em%
%  \begin{center}%
  \hskip 0.1pc\hbox to \textwidth{\leaders\hrule\hfill}%
  \vskip 1em%
  \abstract@produce
  \vskip 1.0em%
  \keyword@produce
%  \vskip 1em%
  \vskip -0.5 em%
%  \hbox to .9\textwidth{\hskip .1\textwidth\leavevmode\leaders\hrule height .4pt \hfill}%
  \hskip 0.1pc\hbox to \textwidth{\leaders\hrule\hfill}%
  \end{center}%
%  \vskip 1.5em
  }
%
%%%
\newbox\abstractbox
\newenvironment{abstract}{%
   \lrbox\abstractbox
     \minipage{.95\textwidth}%
     \bfseries\normalsize\abstractname~%
	 \normalfont\normalsize\ignorespaces%
  }{%
   \endminipage\endlrbox}
\def\abstract@produce{%
   \leavevmode\box\abstractbox\par
}
%%%
\newbox\keywordbox
\newenvironment{keywords}{%
   \lrbox\keywordbox
     \minipage{.95\textwidth}%
     \bfseries\normalsize\keywordname~%
	 \normalfont\normalsize\ignorespaces%
  }{%
   \endminipage\endlrbox}
\def\keyword@produce{%
   \leavevmode\box\keywordbox\par
}
%%%
\newbox\footnotebox
\newenvironment{makefoot}{%
   \lrbox\footnotebox
     \minipage{.95\textwidth}%
     \normalfont\fontsize{8.5pt}{8.5pt}\ignorespaces%
  }{%
   \endminipage\endlrbox}
\def\footnote@produce{%
   \leavevmode\box\footnotebox\par
}

%%% SECTION commands:
%%% \section and \subsection are effective, but other commands will be preserved
%%% for compatibility.
\setcounter {secnumdepth}{2}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand\thesection {\normalsize\@arabic\c@section.}
\renewcommand\thesubsection   {\thesection\@arabic\c@subsection.}
\renewcommand\thesubsubsection{\thesubsection\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\MakeUppercaseBlue[1]{
\textcolor[RGB]{70,126,166}{\bfseries\MakeUppercase{#1}}
}

\newcommand\section{\@startsection {section}{1}{\z@}%
                   {-3.5ex \@plus -.5ex \@minus -.2ex}%
                   {2.0ex \@plus.2ex}%
                   {\centering\normalfont\elevensize\MakeUppercaseBlue}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                      {-2.8ex\@plus -.5ex \@minus -.2ex}%
                      {0.5ex \@plus .1ex}%
                      {\noindent\normalfont\fontsize{10.5pt}{6pt}\selectfont\textcolor[RGB]{227,108,10}}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                         {-2.8ex\@plus -.5ex \@minus -.2ex}%
                         {0.5ex \@plus .1ex}%
                         {\normalfont\normalsize}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                     {1.5ex \@plus1ex \@minus.2ex}%
                     {-1em}%
                     {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                        {3.25ex \@plus1ex \@minus .2ex}%
                        {-1em}%
                        {\normalfont\normalsize\bfseries}}

\leftmargin  \leftmargini
\setlength\leftmargini {1.8em}
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {.5em}
\setlength\leftmarginvi {.5em}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\newcounter{appendixcnt}
\setcounter{appendixcnt}{0}
\newcommand\appendix{\par\medskip
  \stepcounter{appendixcnt}%
  \section*{\MakeUppercase\appendixname~\Alph{appendixcnt}}\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{equation}{0}%
  \def\theequation{\Alph{appendixcnt},\arabic{equation}}%
  \gdef\thesection{\@Alph\c@section}%
  \renewcommand\section{\@startsection {section}{1}{\z@}%
                       {-3.5ex \@plus -1ex \@minus -.2ex}%
                       {2.3ex \@plus.2ex}%
                       {\centering\normalfont\large\sc}}
}

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand \theequation {\@arabic\c@equation}
\newcounter{figure}
\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\textcolor[RGB]{227,108,10}{\thefigure}}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\textcolor[RGB]{227,108,10}{\thetable}}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1\textcolor[RGB]{227,108,10}{.} #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1\textcolor[RGB]{227,108,10}{.} #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {%
      \renewcommand\section{\@startsection {section}{1}{\z@}%
                       {-3.5ex \@plus -1ex \@minus -.2ex}%
                       {2.3ex \@plus.2ex}%
                       {\centering\normalfont\elevensize\bfseries\MakeUppercase}}
      \section*{\refname}%
      \fontsize{9pt}{11pt}\selectfont
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            %\setlength\itemsep{-.8\parsep}
            \setlength\itemsep{\parsep}
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\refname{\textcolor[RGB]{70,126,166}{References}}
\newcommand\figurename{\textcolor[RGB]{227,108,10}{Fig.}}
\newcommand\tablename{\textcolor[RGB]{227,108,10}{Table}}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{\textcolor[RGB]{227,108,10}{Abstract:}}
\newcommand\keywordname{\textcolor[RGB]{227,108,10}{Keywords:}}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{12\p@}
\setlength\columnseprule{0\p@}
\pagestyle{IJCASheadings}
\pagenumbering{arabic}
\raggedbottom
%\twocolumn
\onecolumn
\if@sloppy
   \sloppy
\else
\fi
\flushbottom
%%%\RequirePackage[hmargin=20mm,vmargin=20mm]{geometry}
\oddsidemargin=-15pt
\evensidemargin\oddsidemargin
\headheight=12pt
\textheight=682pt
\marginparsep=10pt
\footskip=30pt
\hoffset=0pt
\paperwidth=597pt
\topmargin=-52pt
\headsep=15pt%25pt
\textwidth=483pt
\marginparwidth=48pt
\marginparpush=5pt
\voffset=0pt
\paperheight=796pt
\columnsep=2.14em % added on 2011
%%\setlength\paperheight {280mm}%
%%\setlength\paperwidth  {210mm}

%% hang caption extracts from caption2.sty
\newlength\realcaptionwidth
\newsavebox\captionbox
\newcommand*\captionsize{}
\newcommand*\captionfont{\captionsize}
\newcommand*\captionlabelfont{}
\newcommand*\captionlabeldelim{\textcolor[RGB]{227,108,10}{.}}
\newdimen\captionlabelsep
  \sbox\captionbox{ }
  \setlength\captionlabelsep{\wd\captionbox}
\newdimen\captionmargin
\newdimen\captionwidth
\newdimen\captionindent
\newif\ifonelinecaptions
\newif\iftakecaptionwidth
\newcommand*\setcaptionmargin[1]{%
  \setlength\captionmargin{#1}%
  \takecaptionwidthfalse}
\newcommand*\setcaptionwidth[1]{%
  \setlength\captionwidth{#1}%
  \takecaptionwidthtrue}
\newcommand\newcaptionstyle[2]{%
  \expandafter\ifx\csname caption@@#1\endcsname\relax
    \defcaptionstyle{#1}{#2}%
  \else
    \PackageError{IJCAS}{Caption style `#1' already defined from caption2}{}%
  \fi} 
\newcommand\renewcaptionstyle[2]{%
  \expandafter\ifx\csname caption@@#1\endcsname\relax
    \PackageError{IJCAS}{Caption style `#1' undefined from caption2}{}%
  \else
    \defcaptionstyle{#1}{#2}%
  \fi}
\newcommand\defcaptionstyle[2]{%
  \@namedef{caption@@#1}{#2}}
\newcommand*\dummycaptionstyle[2]{%
  \defcaptionstyle{#1}{%
    \expandafter\ifx\csname caption@@\caption@style\expandafter\endcsname%
                    \csname caption@@#1\endcsname
      \PackageError{IJCAS}{You can't use the caption style `#1' directy}{%
        The caption style `#1' is only a dummy and does not really exists.%
        \MessageBreak You have to redefine it (with \protect\renewcaptionstyle)
        before you can select\MessageBreak it with \protect\captionstyle.}%
    \else
      #2\usecaptionstyle{\caption@style}%
    \fi}}
\newcaptionstyle{normal}{\caption@make{normal}}
\newcaptionstyle{hang}{\caption@make{hang}}
\newcommand*\captionstyle[1]{%
  \expandafter\ifx\csname caption@@#1\endcsname\relax
    \PackageError{caption}{Undefined caption style `#1'}{}%
  \else
    \def\caption@style{#1}%
  \fi}
\captionstyle{hang}
\renewcommand\@makecaption[2]{%
  \vskip\abovecaptionskip
  \realcaptionwidth\linewidth
  \def\captionlabel{#1}%
  \def\captiontext{#2}%
  \usecaptionstyle{\caption@style}%
  \vskip\belowcaptionskip}
\newcommand*\caption@canterr[1]{%
  \PackageError{IJCAS}{You can't use \protect#1
    in normal text}{The usage of \protect#1 is only
    allowed inside code declared with\MessageBreak \protect\defcaptionstyle,
    \protect\newcaptionstyle \space or \protect\renewcaptionstyle.}}
\newcommand\onelinecaption[2]{%
  \ifx\captiontext\undefined
    \caption@canterr{\onelinecaption}%
  \else
    \def\caption@temp{#2}%
    \ifonelinecaptions
      \sbox\captionbox{#1}%
      \ifdim\wd\captionbox >\realcaptionwidth
        \caption@temp
      \else
        {\centering\usebox{\captionbox}\par}%
      \fi
    \else
      \caption@temp
    \fi
    \let\caption@temp\undefined
  \fi}
\newcommand*\usecaptionmargin{%
  \ifx\captiontext\undefined
    \caption@canterr{\usecaptionmargin}%
  \else
    \iftakecaptionwidth
      \leftskip\realcaptionwidth
      \advance\leftskip by -\captionwidth
      \divide\leftskip by 2
      \rightskip\leftskip
      \realcaptionwidth\captionwidth
    \else
      \leftskip\captionmargin
      \rightskip\captionmargin
      \advance\realcaptionwidth by -2\captionmargin
    \fi
  \fi}
\newcommand*\usecaptionstyle[1]{%
  \ifx\captiontext\undefined
    \caption@canterr{\usecaptionstyle}%
  \else
    \@ifundefined{caption@@#1}%
      {\PackageError{caption}{Caption style `#1' undefined}{}}%
      {\@nameuse{caption@@#1}}
  \fi}
\newcommand*\caption@make[1]{%
  \usecaptionmargin\captionfont
  \def\caption@label{%
    {\captionlabelfont\captionlabel\captionlabeldelim}%
    \hskip\captionlabelsep}%
  \onelinecaption{\caption@label\captiontext}%
    {\@nameuse{caption@@@#1}}}
\newcommand*\caption@@@normal{%
  \caption@label\captiontext\par}
\newcommand*\caption@@@hang{%
  \sbox\captionbox{\caption@label}%
  \hangindent\wd\captionbox\noindent
  \usebox\captionbox\captiontext\par}
\ifx\LT@makecaption\undefined
\else
  \caption@package{longtable}
  \dummycaptionstyle{longtable}{\setcaptionwidth\LTcapwidth}
  \renewcommand\LT@makecaption[3]{%
    \LT@mcol\LT@cols c{\hbox to\z@{\hss\parbox[t]\linewidth{%
    \realcaptionwidth\linewidth
    \ifx#1\@gobble
      \def\captionlabel{}%
      \def\captionlabeldelim{}%
      \captionlabelsep\z@
    \else
      \def\captionlabel{#2}%
    \fi
    \def\captiontext{#3}%
    \usecaptionstyle{longtable}%
    \endgraf\vskip\baselineskip}%
    \hss}}}
\fi
\newcommand*\addtosubcaption[1]{}
\@ifundefined{@makesubfigurecaption}{}{%
  \caption@package{subfigure}
  \newcommand*\subcapstyle[1]{%
    \expandafter\ifx\csname caption@@#1\endcsname\relax
      \PackageError{IJCAS}{Undefined caption style `#1' from caption2}{}%
    \else
      \def\caption@substyle{#1}%
    \fi}
  \subcapstyle{normal}
  \ifsubcaphang
    \subcapstyle{hang}
  \fi
  \newif\iftakesubfigcapwidth
  \newcommand*\subfigcapwidth{0pt}
  \newlength\subcapindent
  \newcommand*\setsubcapmargin[1]{%
    \renewcommand*\subcapfigmargin{#1}%
    \takesubfigcapwidthfalse}
  \newcommand*\setsubcapwidth[1]{%
    \renewcommand*\subcapfigwidth{#1}%
    \takesubfigcapwidthtrue}
  \renewcommand\@makesubfigurecaption[2]{%
    \realcaptionwidth\@tempdima
    \def\captionlabel{#1}%
    \def\captiontext{#2}%
    \let\captionfont\subcapsize
    \let\captionlabelfont\relax
    \let\captionlabeldelim\empty
    \captionlabelsep0pt
    \ifsubcapnooneline\onelinecaptionsfalse\else\onelinecaptionstrue\fi
    \iftakesubfigcapwidth\takecaptionwidthtrue\else\takecaptionwidthfalse\fi
    \setlength\captionmargin{\subfigcapmargin}%
    \setlength\captionwidth{\subfigcapwidth}%
    \captionindent\subcapindent
    \hbox{\parbox[t]\@tempdima{\strut\usecaptionstyle{\caption@substyle}}}}
  \renewcommand*\addtosubcaption[1]{%
    \let\caption@makesubfigurecaption\@makesubfigurecaption
    \renewcommand\@makesubfigurecaption[2]{%
      #1\caption@makesubfigurecaption}
    \let\@makesubtablecaption\@makesubfigurecaption}}

\RequirePackage{amsthm,amssymb}
\thm@style{plain}
\newtoks\thm@bodyfont  \thm@bodyfont{\normalfont}
\newtoks\thm@headfont  \thm@headfont{\bfseries}
\newtoks\thm@notefont  \thm@notefont{}
\newtoks\thm@headpunct \thm@headpunct{.}
\newskip\thm@preskip \newskip\thm@postskip
\def\thm@space@setup{%
  \thm@preskip=\topsep \thm@postskip=\thm@preskip
} 
\def\th@plain{%
  \let\thm@indent\indent % no indent
%%  \thm@headfont{\bfseries}% heading font is bold
%%  \thm@notefont{}% same as heading font
  \thm@headpunct{:}% add period after heading
%%  \let\thm@swap\@gobble
%%  \thm@preskip\topsep
%%  \thm@postskip\theorempreskipamount
  \normalfont% body font
} 
\def\@endtheorem{\endtrivlist\@endpefalse} 

%%% borrowed from amsart
%\newcommand\proofname{Proof}
\def\qed{\ifhmode\unskip\nobreak\fi\hfill
  \ifmmode\square\else$\m@th\square$\fi}

\renewenvironment{proof}[1][\proofname]{\par
  \normalfont
  \topsep6\p@\@plus6\p@ \trivlist
  \item[\hskip\labelsep\indent
  \bfseries
    #1\@addpunct{:}]\ignorespaces
}{%
  \qed\endtrivlist
}

%%% BIOGRAPHY : borrowed from IEEEtran and modified
\newif\if@biographyTOCentrynotmade
\global\@biographyTOCentrynotmadetrue

\newdimen\@tmpdimenA
\newdimen\@tmpdimenB 
\newcount\@tmpcountA
\newcount\@tmpcountB 
\begingroup
\catcode`\Q=3
\long\gdef\@ifmtarg#1{\@xifmtarg#1QQ\@secondoftwo\@firstoftwo\@nil}
\long\gdef\@xifmtarg#1#2Q#3#4#5\@nil{#4}
\endgroup 
\def\@needspace#1#2{\penalty-100\begingroup%shield temp variable
\@tmpdimenB\pagegoal\advance\@tmpdimenB-\pagetotal% space left
\ifdim #1>\@tmpdimenB\relax% not enough space left
\ifdim\@tmpdimenB>\z@\relax #2\fi%
\newpage%
\fi\endgroup} 

\newcounter{biography}
\setcounter{biography}{0}

\def\@photowidth{25mm}   % width of the biography photo area
\def\@photodepth{30mm}   % depth (height) of the biography photo area
\def\@hangwidth{27.5mm}  % width cleared for the biography photo area
\def\@hangdepth{31.5mm}  % depth cleared for the biography photo area
\def\@skipN{1.5\baselineskip}% nominal value of the vskip above the biography

\if@draft
\RequirePackage[draft]{graphicx}
\else
\RequirePackage{graphicx}
\fi
\newcommand\biography[3]%
{\begin{@biography}[{\includegraphics[width=25mm,height=30mm,clip,keepaspectratio]{#1}}]{\fontsize{9pt}{10pt}\selectfont\textcolor[RGB]{70,126,166}{\textbf{#2}}}
 {\fontsize{9pt}{10pt}\selectfont{#3}}
 \end{@biography}
}

\newenvironment{@biography}[2][]{\normalfont\small%
\unitlength 1in\parskip=0pt\par\parindent 1em\interlinepenalty500%
\@tmpdimenA=\@hangdepth%
\advance\@tmpdimenA by \@skipN%
\advance\@tmpdimenA by 1\baselineskip%
\@needspace{\@tmpdimenA}{\relax}%
\vskip \@skipN plus 1fil minus 0\baselineskip%
\def\@tempbiographybox{{\setlength{\fboxsep}{0pt}\framebox{\begin{minipage}[b][\@photodepth][c]{\@photowidth}\centering PLACE\\ PHOTO\\ HERE \end{minipage}}}}%
\@ifmtarg{#1}{\relax}{\def\@tempbiographybox{\mbox{\begin{minipage}[b][\@photodepth][c]{\@photowidth}%
\centering%
#1%
\end{minipage}}}}% end if optional argument supplied
\if@biographyTOCentrynotmade%
\setcounter{biography}{-1}%
\refstepcounter{biography}%
\addcontentsline{toc}{section}{Biographies}%
\global\@biographyTOCentrynotmadefalse%
\fi%
\refstepcounter{biography}%
\addcontentsline{toc}{subsection}{#2}%
\let\@ORGparCMD=\par% 
\edef\par{\hfil\break\indent}%
\settoheight{\@tmpdimenA}{\@tempbiographybox}%
\@tmpdimenB=\@hangdepth%
\@tmpcountA=\@tmpdimenB% countA has the hang depth
\divide\@tmpcountA by \baselineskip%
\advance\@tmpcountA by 1%
\hangindent\@hangwidth%
\hangafter-\@tmpcountA%
\settoheight{\@tmpdimenB}{\mbox{T}}%
\noindent\makebox[0pt][l]{\hspace{-\@hangwidth}\raisebox{\@tmpdimenB}[0pt][0pt]{\raisebox{-\@photodepth}[0pt][0pt]{\@tempbiographybox}}}%
\noindent\textbf{#2\ }\ignorespaces}
{\relax\let\par=\@ORGparCMD\par%
 \ifnum \prevgraf <\@tmpcountA\relax%
    \advance\@tmpcountA by -\prevgraf%
    \advance\@tmpcountA by -1\relax%
    \@tmpdimenA=\baselineskip%
    \multiply\@tmpdimenA by \@tmpcountA%
    \noindent\rule{0pt}{\@tmpdimenA}%
\fi%
\par\normalfont}

%%% last page balancing : balance.sty by Daly.
\@ifpackageloaded{balance}{}
{%
 \newcommand{\@BAlancecol}{\if@twocolumn
  \setbox0=\vbox{\unvbox\@outputbox} \@tempdima=\ht0
  \advance\@tempdima by \topskip \advance\@tempdima
     by -\baselineskip \divide\@tempdima by 2
     \splittopskip=\topskip
  {\vbadness=\@M \loop \global\setbox3=\copy0
   \global\setbox1=\vsplit3 to \@tempdima
   \ifdim\ht3>\@tempdima \global\advance\@tempdima by 1pt \repeat}
   \setbox\@leftcolumn=\vbox to \@tempdima{\unvbox1\vfil}
   \setbox\@outputbox=\vbox to \@tempdima
     {\dimen2=\dp3\unvbox3\kern-\dimen2
      \vfil}
  \fi}
 \newif\if@BAlanceone
 \global\@BAlanceonefalse
 \newdimen\oldvsize
 \newcommand{\@BAdblcol}{\if@firstcolumn
       \unvbox\@outputbox \penalty\outputpenalty
       \global\oldvsize=\@colht \global\multiply \@colht by 2
       \global\@BAlanceonetrue
       \global\@firstcolumnfalse
  \else \global\@firstcolumntrue
       \if@BAlanceone
       \global\@BAlanceonefalse\@BAlancecol
       \global\@colht=\oldvsize \else
       \PackageWarningNoLine{balance}
          {You have called \protect\balance\space
             in second column\MessageBreak
           Columns might not be balanced}\fi
     \setbox\@outputbox\vbox to \@colht{\hbox to\textwidth
     {\hbox to\columnwidth {\box\@leftcolumn \hss}\hfil
      \vrule width\columnseprule\hfil \hbox to\columnwidth
      {\box\@outputbox \hss}}\vfil}\@combinedblfloats
     \@outputpage \begingroup \@dblfloatplacement
     \@startdblcolumn \@whilesw\if@fcolmade \fi
     {\@outputpage\@startdblcolumn}\endgroup
  \fi}
 \newcommand{\@BAcleardblpage}{\clearpage\if@twoside \ifodd\c@page\else
  \hbox{}\newpage\fi\fi}
 \newcommand{\@@cleardblpage}{}
 \let\@@cleardblpage=\cleardoublepage

 \newcommand{\@@utputdblcol}{}
 \let\@@utputdblcol=\@outputdblcol
 \newcommand{\balance}{\global\let\@outputdblcol=\@BAdblcol
  \global\let\cleardoublepage=\@BAcleardblpage}
 \newcommand{\nobalance}{\global\let\@outputdblcol=\@@utputdblcol
  \global\let\cleardoublepage=\@@cleardblpage} 
}
\let\lastpagebalance\balance

\newcommand\journaltitle[1]%
	{\gdef\journal@title{#1}}
\newcommand\journalnumber[1]%
	{\gdef\journal@number{#1}}
\newcommand\journalvolumn[1]%
	{\gdef\journal@volumn{#1}}
\newcommand\journalyear[1]%
	{\gdef\journal@year{#1}}

\journaltitle{International Journal of Control, Automation and Systems}
\journalvolumn{}
\journalnumber{}
\journalyear{}

\newcommand\setarticlestartpagenumber[1]%
	{
	\setcounter{page}{#1}
	\gdef\startingpage{#1}
	}

\newenvironment{reference}
	{\begin{thebibliography}{00}}
	{\end{thebibliography}}

\newcommand\clearafterbiography{%
	\vspace*{\stretch{1}}%
}

%runningtitle{starting page}{authors}{title}
\newcommand{\runningtitle}[3]{
\pagestyle{fancy}
%\pagestyle{myheadings}
\fancyhead{}
%\fancyhead[LO]{\footnotesize\textsf{#3}\hfill\thepage}
\fancyhead[RO]{\thepage}
\fancyhead[CO]{\footnotesize\textsf{#3}}% / \textsf{International Journal of Control, Automation, and Systems (\journal@year)
\fancyhead[LE]{\thepage}
\fancyhead[CE]{\footnotesize\textsf{#2}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyfoot{}
%\ifthenelse{\equal{#1}{}}{\setcounter{page}{1}}{\setcounter{page}{#1}}
\thispagestyle{plain}
\fancypagestyle{plain}{
%
%\marginsize{15mm}{15mm}{10mm}{30mm}
%\
\fancyhf{}
\fancyhead[L]{
\begin{tabular}{l}
\footnotesize\textsf{\journal@title ~\journal@volumn(\journal@number) (\journal@year) \pageref{FirstPage}-\pageref{LastPage}}\\%\startingpage
\footnotesize\textsf{http://dx.doi.org/10.1007/s12555-xxx-xxxx-xx}%014-0328-10}
\end{tabular}
%DOI 10.1007/s12555-014-0328-10
}
\fancyhead[R]{
\begin{tabular}{l}
\footnotesize\textsf{ISSN:1598-6446 eISSN:2005-4092}\\
\footnotesize\textsf{\url{http://www.springer.com/12555}}
\end{tabular}
}

\fancyfoot[R]{\vskip -1pc\footnotesize\copyright ICROS, KIEE and Springer 2016}
%\fancyfoot[L]{\textcolor[RGB]{227,108,10}{\fontsize{8.5pt}{8.5pt}\selectfont DOI 10.1007/s12555-014-0328-10}}
\fancyfoot[L]{\includegraphics[width=2cm]{springer_mark.jpg}}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
}
\newfloat{foot}{b}{ft}

\newcommand{\makeAuthorInformation}[1]{
\begin{foot}[b!]
\noindent
\hskip 0.1pc\hbox to \textwidth{\leaders\hrule\hfill} %
\begin{center}
\vskip -0.5pc
\begin{minipage}[t]{0.98\textwidth}
\fontsize{8.5pt}{10pt}\selectfont{
#1
}
\end{minipage}
\end{center}
\vskip 0pc
\hskip 0.1pc\hbox to \textwidth{\leaders\hrule\hfill} %
\end{foot}
}



%% Theorem, Lemma, Remarks, etc.
\newtheorem{theorem}{Theorem}
\newtheorem{lemma}{Lemma}
\newtheorem{remark}{Remark}
\newtheorem{corollary}{Corollary}

%% Indenting the first paragraph
\let\@afterindentfalse\@afterindenttrue
\@afterindenttrue
		
\endinput
%%
%% End of file `IJCAS.cls'.
