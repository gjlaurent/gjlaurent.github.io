% ---------------------------------------------------------------------
% examen.cls - Classe LaTeX pour la réalisation de sujets d'examens
% 18/01/2011 - Guillaume Laurent
% ---------------------------------------------------------------------
  \NeedsTeXFormat{LaTeX2e}
  \ProvidesClass{examen}[18/01/2011 Classe pour la réalisation de sujets d'examens]
  \LoadClass[a4paper,11pt]{article}

	\usepackage[latin1]{inputenc}
	\usepackage[cm]{aeguill}
	\usepackage{ae}
	\usepackage{aecompl}
  \usepackage[francais]{babel}
	\usepackage{amsfonts}
	\usepackage{amsmath}
	\usepackage{amssymb}
	\usepackage[pdftex]{graphicx}
  \usepackage{fancyhdr}

% Définition du titre, de l'auteur, etc--------------------------------
  \renewcommand{\date}[1]{\def\@Date{#1}}%
  \renewcommand{\author}[1]{\def\@Auteur{#1}}%
  \renewcommand{\title}[1]{\def\@Titre{#1}}%
  \newcommand{\formation}[1]{\def\@Formation{#1}}%
  \newcommand{\consignes}[1]{\def\@Consignes{#1}}%

	\def\@Date{}
	\def\@Auteur{}
	\def\@Titre{}
	\def\@Formation{}
	\def\@Consignes{}

% Commande \maketitle ------------------------------------------------
\renewcommand{\maketitle}{
  \hrule
  \begin{center}
  \LARGE \bf
  \@Titre\\
  \rm\normalsize \@Consignes
   \end{center}
  \smallskip
  \hrule
  \par
  \bigskip
}

% Commande \annexe ---------------------------------------------------
\newcounter{an}
\setcounter{an}{0}
  
\newcommand{\annexe}[1]{
 \stepcounter{an}
 \setcounter{ex}{0}
 \setcounter{qt}{0}
 \par\bigskip\bigskip
 \noindent
 \begin{center}
 {\bf{\Large Annexe~\arabic{an}\\ \smallskip\large #1}}
 \par\rule{5cm}{0.4pt}
 \end{center}
 }


% Commande \partie ---------------------------------------------------
\newcounter{pt}
\setcounter{pt}{0}
  
\newcommand{\partie}[1]{
 \stepcounter{pt}
 \setcounter{ex}{0}
 \setcounter{qt}{0}
 \par\bigskip\bigskip
 \noindent
 \begin{center}
 {\bf{\Large Partie~\Alph{pt}\\ \smallskip\large #1}}
 \par\rule{5cm}{0.4pt}
 \end{center}
 }

% Commande \exercice ---------------------------------------------------
\newcounter{ex}
\setcounter{ex}{0}

\newcommand{\exercice}[1]{
 \stepcounter{ex}
 \setcounter{qt}{0}
 \par\bigskip\bigskip
 \noindent
 \ifnum\value{pt}=0
   {\bf{\large Exercice~\arabic{ex}.}\quad #1}
 \else
   {\bf{\large Exercice~\Alph{pt}.\arabic{ex}.}\quad #1}
 \fi 
 \def\@pointex{.}
 \par
 \smallskip
 }

% Commande \question -------------------------------------------------
\newcounter{qt}
\setcounter{qt}{0}

\newcommand{\question}[1]{
 \stepcounter{qt}
 \par\medskip
 \ifnum\value{pt}=0
   \ifnum\value{ex}=0
     \textsl{\arabic{qt}.}~\textit{#1}
   \else
     \textsl{\arabic{ex}.\alph{qt}.}~\textit{#1}
   \fi
 \else
   \ifnum\value{ex}=0
     \textsl{\Alph{pt}.\arabic{qt}.}~\textit{#1}
   \else
     \textsl{\Alph{pt}.\arabic{ex}.\alph{qt}.}~\textit{#1}
   \fi
 \fi
	\par\medskip
}

% Mise en page -------------------------------------------------------
  \setlength{\topmargin}{-0.8cm}
  \setlength{\hoffset}{-1in}
  \setlength{\textheight}{24cm}
  \setlength{\textwidth}{17cm}
  \setlength{\oddsidemargin}{2cm}
  \setlength{\evensidemargin}{2cm}
  \setlength{\headheight}{14pt}

  \pagestyle{fancy}
  \rhead{\@Date}
  \chead{}
  \lhead{\@Formation}
  \rfoot{Page~\thepage~sur~\pageref{lastpage}}
  \cfoot{}
  \lfoot{\@Auteur}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}

  % Séparateur en fin de document + balise lastpage
  \let\myenddocument\enddocument
  \def\enddocument{\center\rule{5cm}{0.4pt}\label{lastpage}
  \myenddocument}

% Fin ----------------------------------------------------------------
