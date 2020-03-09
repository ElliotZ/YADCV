%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YADCV - YADCV is A Developer CV
% LaTeX Class
% Version 1.0 (08/03/20)
%
% This class is based on Developer CV, with added support for
% better rendering for unicode characters (via XeLaTeX), tweaked
% spacing / layout, modularized document structure, and a custom
% colorbox command.
% 
% Now with Nord Color scheme integration.
%
% The original template is available from:
% http://www.LaTeXTemplates.com
%
% Author: Yile "Elliot" Zhu
%
% Original Authors:
% Jan Vorisek (jan@vorisek.me)
% Based on a template by Jan Küster (info@jankuester.com)
% Modified for LaTeX Templates by Vel (vel@LaTeXTemplates.com)
%
% License:
% The MIT License (see included LICENSE file)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{yadcv}[2020/03/08 YADCV class v1.0]

% Pass through any options to the base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}} 

\ProcessOptions\relax % Process given options

\LoadClass{extarticle} % Load the base class

%----------------------------------------------------------------------------------------
%	PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

\setlength{\parindent}{0mm} % Suppress paragraph indentation

\usepackage[hidelinks]{hyperref} % Required for links, hide boxes around links

\newcommand{\lorem}{%
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.
} % Dummy text

\pagestyle{empty} % No headers or footers

\usepackage{moresize} % Provides more font size commands (\HUGE and \ssmall)

\usepackage{xargs} % Easily define commands with more than one optional arguments

\usepackage{xeCJK} % CJK support

%----------------------------------------------------------------------------------------
%   COLOR
%----------------------------------------------------------------------------------------

\usepackage{xcolor}
% Nord color theme - https://www.nordtheme.com/
% See https://www.nordtheme.com/docs/colors-and-palettes for colors and style guides.
% Polar Night
\definecolor{PolarNight0}{HTML}{2e3440} % deepest "black""
\definecolor{PolarNight1}{HTML}{3b4252}
\definecolor{PolarNight2}{HTML}{434c5e}
\definecolor{PolarNight3}{HTML}{4c566a} % lightest
% Snow Storm
\definecolor{SnowStorm0}{HTML}{d8dee9} % not as white
\definecolor{SnowStorm1}{HTML}{e5e9f0}
\definecolor{SnowStorm2}{HTML}{eceff4} % most white
% Frost
\definecolor{Frost0}{HTML}{8fbcbb} % greenish blue
\definecolor{Frost1}{HTML}{88c0d0}
\definecolor{Frost2}{HTML}{81a1c1}
\definecolor{Frost3}{HTML}{5e81ac} % icy blue
% Aurora
\definecolor{AurRed}{HTML}{bf616a}
\definecolor{AurOrn}{HTML}{d08700}
\definecolor{AurYlw}{HTML}{ebcb8b}
\definecolor{AurGrn}{HTML}{839e6c} % dimmed down for better readability
\definecolor{AurPrp}{HTML}{b48ead}

\makeatletter
\newcommand{\globalcolor}[1]{%
  \color{#1}\global\let\default@color\current@color%
}
\makeatother

\AtBeginDocument{\globalcolor{PolarNight0}} % set PolarNight0 as default text color

%----------------------------------------------------------------------------------------
%	PAGE LAYOUT
%----------------------------------------------------------------------------------------

\usepackage{geometry} % Required for adjusting page dimensions and margins

\geometry{%
	paper=letterpaper, % Paper size, change to a4paper for a4 size
	top=1.00cm, % Top margin
	bottom=1.00cm, % Bottom margin
	left=2cm, % Left margin
	right=2cm, % Right margin
	headheight=0.75cm, % Header height
	footskip=1cm, % Space from the bottom margin to the baseline of the footer
	headsep=0.5cm, % Space from the top margin to the baseline of the header
	%showframe, % Uncomment to show how the type block is set on the page
}

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

%\usepackage[utf8]{inputenc}
%\usepackage[T1]{fontenc} % No longer required under XeLaTeX.
\usepackage{fontspec}

\usepackage[default]{raleway}
%\usepackage[defaultsans]{droidsans}
%\usepackage{cmbright}
%\usepackage{fetamont}
%\usepackage[default]{gillius}
%\usepackage{roboto}

\renewcommand*\familydefault{\sfdefault} % Force the sans-serif version of any font used

% These fonts are included.
\setCJKmainfont{NotoSerifCJK-Regular}[
    Path           = fonts/,
    Extension      = .ttc,
    BoldFont       = NotoSerifCJK-Bold,
    ItalicFont     = NotoSerifCJK-Regular,
    BoldItalicFont = NotoSerifCJK-Bold
]

\setCJKsansfont{NotoSansCJK-Regular}[
    Path           = fonts/,
    Extension      = .ttc,
    BoldFont       = NotoSansCJK-Bold,
    ItalicFont     = NotoSansCJK-Regular,
    BoldItalicFont = NotoSansCJK-Bold
]

\setmonofont{MesloLGS-NF-Regular}[
    Path           = fonts/,
    Extension      = .ttf,
    BoldFont       = MesloLGS-NF-Bold,
    ItalicFont     = MesloLGS-NF-Italic,
    BoldItalicFont = MesloLGS-NF-Bold-Italic
]

%------------------------------------------------

\usepackage{fontawesome} % Use Claud Park's package to resolve issue with XeLaTeX
\newfontfamily\FA[Path=fonts/]{FontAwesome}

% Command to output an icon in a black square box with text to the right
% #1 is the FontAwesome icon name, #2 is the box size and #3 is the text
\newcommand{\icon}[3]{%
    \vcenteredhbox{%
        \colorbox{Frost3}{%
            \makebox(#2, #2){%
                \textcolor{SnowStorm2}{\large\FA\csname faicon@#1\endcsname}
            }
        }
    }% Icon and box
	\hspace{0.2cm}% Whitespace
	\vcenteredhbox{\textcolor{PolarNight0}{#3}}% Text
}

%----------------------------------------------------------------------------------------
%	GRAPHICS DEFINITIONS - Unused, left as legacy
%---------------------------------------------------------------------------------------- 

\usepackage{tikz} % Required for creating the plots
\usetikzlibrary{shapes, backgrounds}
\tikzset{x=1cm, y=1cm} % Default tikz units

% Command to vertically centre adjacent content
\newcommand{\vcenteredhbox}[1]{% The only parameter is for the content to centre
	\begingroup%
		\setbox0=\hbox{#1}\parbox{\wd0}{\box0}%
	\endgroup%
}

%----------------------------------------------------------------------------------------
%	CHARTS - Unused, left as legacy
%---------------------------------------------------------------------------------------- 

\newcounter{barcount}

% Environment to hold a new bar chart
\newenvironment{barchart}[1]{ % The only parameter is the maximum bar width, in cm
	\newcommand{\barwidth}{0.35}
	\newcommand{\barsep}{0.2}
	
	% Command to add a bar to the bar chart
	\newcommand{\baritem}[2]{ % The first argument is the bar label and the second is the percentage the current bar should take up of the total width
		\pgfmathparse{##2}
		\let\perc\pgfmathresult
		
		\pgfmathparse{#1}
		\let\barsize\pgfmathresult
		
		\pgfmathparse{\barsize*##2/100}
		\let\barone\pgfmathresult
		
		\pgfmathparse{(\barwidth*\thebarcount)+(\barsep*\thebarcount)}
		\let\barx\pgfmathresult
		
		\filldraw[fill=PolarNight0, draw=none] (0,-\barx) rectangle (\barone,-\barx-\barwidth);
		
		\node [label=180:\colorbox{PolarNight0}{\textcolor{white}{##1}}] at (0,-\barx-0.175) {};
		\addtocounter{barcount}{1}
	}
	\begin{tikzpicture}
		\setcounter{barcount}{0}
}{
	\end{tikzpicture}
}

%------------------------------------------------

\newcounter{a}
\newcounter{b}
\newcounter{c}

% Command to output a number of automatically-sized bubbles from a string in the format of '<size>/<label>', e.g. \bubbles{5/Eclipse, 6/git, 4/Office, 3/Inkscape, 3/Blender}
\newcommand{\bubbles}[1]{
	% Reset counters
	\setcounter{a}{0}
	\setcounter{c}{150}
	
	\begin{tikzpicture}[scale=3]
		\foreach \p/\t in {#1} {
			\addtocounter{a}{1}
			\bubble{\thea/2}{\theb}{\p/25}{\t}{1\p0}
		}
	\end{tikzpicture}
}

% Command to output a bubble at a specific position with a specific size
\newcommand{\bubble}[5]{
	\filldraw[fill=PolarNight0, draw=none] (#1,0.5) circle (#3); % Bubble
	\node[label=\textcolor{PolarNight0}{#4}] at (#1,0.7) {}; % Label
}

%----------------------------------------------------------------------------------------
%	CUSTOM SECTIONS - Added optional arguments
%----------------------------------------------------------------------------------------

% Command to output section title headings
% Synopsis: \cvsect[box color][text color]{section title}
\newcommandx*{\cvsect}[3][1=AurGrn, 2=SnowStorm2]{% 
	\vspace{\baselineskip} % Whitespace before the section title
	\colorbox{#1}{\textcolor{#2}{\MakeUppercase{\textbf{#3}}}}\\% Section title
}

%----------------------------------------------------------------------------------------
%	ENTRY LIST - added two more entry classes, optional arguments
%----------------------------------------------------------------------------------------

\usepackage{longtable} % Required for tables that span multiple pages
\setlength{\LTpre}{0pt} % Remove default whitespace before longtable
\setlength{\LTpost}{0pt} % Remove default whitespace after longtable

\setlength{\tabcolsep}{0pt} % No spacing between table columns

% Environment to hold a new list of entries
\newenvironment{entrylist}{
	\begin{longtable}[H]{l l}
}{
	\end{longtable}
}

% First and second arguments decide the layout of entry and are optional
% Rest of the arguments are respectively:
% #3 for the leftmost date(s) text
% #4 is for the bold entry heading
% #5 is for the bold right-aligned entry qualifier 
% #6 is for the entry description
\newcommandx*{\entry}[6][1=0.175, 2=0.825]{
    \parbox[t]{#1\textwidth}{% 17.5% of the text width of the page
		#3 % Leftmost entry date(s) text
	}%
	&\parbox[t]{#2\textwidth}{% 82.5% of the text width of the page
		\textbf{#4}% Entry heading text
		\hfill% Horizontal whitespace
		{\footnotesize \textbf{\textcolor{PolarNight0}{#5}}}\\% Right-aligned
		#6 % Entry description text
	}\\\\%
}

% #6 is left justified for better spacing tags
\newcommandx*{\tagentry}[6][1=0.22, 2=0.78]{
    \parbox[t]{#1\textwidth}{% 17.5% of the text width of the page
		#3 % Leftmost entry date(s) text
	}%
	&\parbox[t]{#2\textwidth}{% 82.5% of the text width of the page
		\textbf{#4}% Entry heading text
		\hfill% Horizontal whitespace
		{\footnotesize \textbf{\textcolor{PolarNight0}{#5}}}\\% Right-aligned
		\raggedright
        #6 % Entry description text
	}\\\\%
}

% #5 is no longer bold for using tags
\newcommandx*{\projentry}[6][1=0.2, 2=0.8]{
    \parbox[t]{#1\textwidth}{% 17.5% of the text width of the page
		#3 % Leftmost entry date(s) text
	}%
	&\parbox[t]{#2\textwidth}{% 82.5% of the text width of the page
		\textbf{#4}% Entry heading text
		\hfill% Horizontal whitespace
		{\footnotesize{#5}}\\% Right-aligned entry qualifier text
		#6 % Entry description text
	}\\\\%
}

%-----------------------------------------------------------------------------------------
%   CUSTOM COLORBOX
%-----------------------------------------------------------------------------------------

\usepackage{graphicx}
\usepackage{calc}

%Define a reference depth. 
%--------------------------
\newlength{\DepthReference}

%Define a reference Height. 
%--------------------------
\newlength{\HeightReference}

\newlength{\Width}%

% Synopsis: \MyColorBox[height offset][width offset]{color}{content}
\newcommandx*{\MyColorBox}[4][1=0.5pt, 2=1.5mm]{%
    \settodepth{\DepthReference}{g}% relative to a depth of a letter.
    %\setlength{\DepthReference}{6pt}% absolute value.
    \settoheight{\HeightReference}{T}%
    %\setlength{\HeightReference}{6pt}%
    \settowidth{\Width}{#4}%
    %\setlength{\fboxsep}{0pt}%
    \colorbox{#3}{% 
        \parbox[b][\HeightReference+#1+\DepthReference+#1][c]{\Width+#2}{%
            \centering#4
        }%
    }%
}%

\setlength{\fboxsep}{2pt}
\newcommand{\tagsep}{\hspace{2pt}} % rename for readability

% Synopsis: \skilltag[box color][text color]{content}
\newcommandx*{\skilltag}[3][1=SnowStorm0, 2=PolarNight0]{%
    \MyColorBox{#1}{\strut\textcolor{#2}{\small\texttt{#3}}}
}

