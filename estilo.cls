\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{estilo}
\LoadClass[10pt]{article}

\RequirePackage{hyperref}
\RequirePackage{verbatim}
\RequirePackage{attachfile2}
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage{pgffor}
\RequirePackage{arrayjobx}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[document]{ragged2e}
\RequirePackage{lipsum}
\RequirePackage{translations}
\RequirePackage{ifthen}
\RequirePackage{xstring}
\RequirePackage[a4paper, left=30mm, right=30mm, top=30mm, bottom=30mm, marginpar=25mm]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage{csquotes}


\RequirePackage{tikz}

\RequirePackage{xfp}
\RequirePackage{pdfpages}

% Función para poner los asteriscos
\newcommand{\andreas}[5][1.0]{
    \begin{scope}[shift={(#2,#3)},rotate=45,scale=#4,transparency group,opacity=#1]
        \fill[fill=#5] (0,0) -- (0,1) -- (3,1) -- (3,0);
        \fill[fill=#5] (1,-1) -- (2,-1) -- (2,2) -- (1,2);
    \end{scope}
}

\newcommand{\andreasline}{
    \centering\begin{tikzpicture}
        \newcommand\numcross{29}
        \foreach \n in {1,...,\the\numexpr\numcross\relax} {
            \andreas[\fpeval{0.9*sin((\n + 1)*pi/(\numcross+2))}]{0.5*\n}{0}{0.10}{black}
        }
    \end{tikzpicture}
}

\newcommand{\andreaslineslim}{
    \centering\begin{tikzpicture}[baseline]
        \newcommand\numcross{74}
        \foreach \n in {1,...,\the\numexpr\numcross\relax} {
            \andreas[0.75]{0.2*\n}{0}{0.04}{black}
        }
    \end{tikzpicture}
}

%------------------------------------------------------------------------------
%	Función para contar palabras
%------------------------------------------------------------------------------
%\newcommand{\quickwordcount}[1]{%
%  \immediate\write18{texcount -1 -sum=1,1,1,0,0,1,1. -merge -q -nobib #1.tex > #1-words.sum }%
%  \input{#1-words.sum} {palabras}%
%}
%\newcommand{\quickwordcount}[1]{%
%  \immediate\write18{texcount -1 -sum -merge #1.tex > #1-words}%
%  \input{#1-words}words%
%}
\newcommand{\quickwordcount}[1]{%
  \immediate\write18{texcount -total -sum -1 -merge #1.tex > #1-words}%
  \input{#1-words} palabras%
}


%------------------------------------------------------------------------------
%	HEADERS, FOOTERS EN SECCIONES
%------------------------------------------------------------------------------
\pagestyle{fancy}
\setlength{\headheight}{28pt}

\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{1pt}
\rhead{\footnotesize \textsc {Informe Final ParkLink\\ Trabajo Práctico Profesional}} % Trabajo práctico
% Se recorta el margen transparente del PNG para que el logo apoye sobre la línea
\lhead{\includegraphics[width=3cm, trim=50 40 59 47, clip]{fiuba-logo.png}}
\cfoot{\small \textsc {Página \thepage\ de \pageref*{LastPage}}}

\fancypagestyle{firststyle}
 {
  \fancyhf{}
   \renewcommand{\headrulewidth}{0pt}
   % descomentar si les interesa poner la cantidad de palabras:
   %\lfoot{\textit {\quickwordcount{main}}} 
   %\rfoot{\small \textsc {Página \thepage\ de \pageref*{LastPage}}}
 }




%------------------------------------------------------------------------------
%	CARÁTULA
%------------------------------------------------------------------------------

\renewcommand*{\maketitle}{
\thispagestyle{firststyle}
\begin{center}
    \includegraphics[width=9cm]{logo} \\[0.5cm]
    {\huge \bfseries Informe Final del Trabajo Profesional}\\[0.15cm] % Título
    \textsc{\normalsize (TAO53) Curso Piñeiro-Perrotta --- Equipo 198 (Grupo 14)}\\[0.4cm] % Materia y equipo
    \includegraphics[width=8.5cm]{logo-parklink} \\[0.35cm]
    {\Large \itshape ``Menos vueltas, más lugar asegurado''}\\[0.2cm] % Slogan
    {\large Sistema Integral de Mapeo, Gestión y Reserva de Cocheras Urbanas}\\[0.15cm] % Subtítulo
    \andreasline \\[0.4cm]

    % --- TABLA DE INTEGRANTES ---
    {\Large \bfseries Integrantes:}\\[0.25cm]
    \makebox[\linewidth][c]{%
    \renewcommand{\arraystretch}{1.3}
    \begin{tabular}{|c|c|c|}
        \hline
        \textbf{Nombre} & \textbf{Padrón} & \textbf{Email} \\
        \hline
        Thiago Fernando Baez & 110703 & tbaez@fi.uba.ar \\
        \hline
        Santiago Domínguez & 110010 & sadominguez@fi.uba.ar \\
        \hline
        Facundo Luzzi & 105229 & fluzzi@fi.uba.ar \\
        \hline
        Santiago Jorge Varga & 110561 & svarga@fi.uba.ar \\
        \hline
    \end{tabular}
    \renewcommand{\arraystretch}{1}%
    }\\[0.5cm]

    % --- TABLA DE DOCENTES ---
    {\Large \bfseries Docentes de la Cátedra:}\\[0.25cm]
    \makebox[\linewidth][c]{%
    \renewcommand{\arraystretch}{1.3}
    \begin{tabular}{|c|c|c|}
        \hline
        \textbf{Rol} & \textbf{Nombre} & \textbf{Email} \\
        \hline
        Jefe de Cátedra & Mg. Ing. Carlos Fontela & cfontela@fi.uba.ar \\
        \hline
        Director de Proyecto/Tutor & Mg. Ing. Gabriel Piñeiro & gpineiro@fi.uba.ar \\
        \hline
        Director de Proyecto/Co-Tutor & Ing. Agustín Perrotta & aperrotta@fi.uba.ar \\
        \hline
    \end{tabular}
    \renewcommand{\arraystretch}{1}%
    }
\end{center}
}