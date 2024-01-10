%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% --------------------------- %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% | Plantilla LaTeX         | %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% | Formato escuela         | %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% | INF PUCV                | %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% | por Sebastian Garcia    | %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% | @sebaignacioo           | %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% |                         | %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% |          2023           | %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% --------------------------- %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% | PREÁMBULO | %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{inf-pucv}[2023/04/24 sgarciad.me v0.1, Clase para la plantilla LaTeX con formato escuela INF PUCV.]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax

\LoadClass{extarticle}

%%%%%%%%%%%%%%%%%%%%%%%%%%% | PAQUETES NECESARIOS | %%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{hyperref}
\RequirePackage{styles}
\RequirePackage{csquotes}
\RequirePackage[style=apa, citestyle=apa, backend=biber, parentracker=true]{biblatex}
\RequirePackage{titlesec}
\RequirePackage{minted}
\RequirePackage{caption}
\RequirePackage{chngcntr}
\RequirePackage{lipsum}
\RequirePackage{enumitem}
\RequirePackage{pdfpages}
\RequirePackage{tocloft}
%\RequirePackage[a-1b]{pdfx}
%\RequirePackage[fixed]{fontawesome5}
%\RequirePackage{ifxetex,ifluatex}
%\RequirePackage{scrlfile}
%\RequirePackage{xparse}
%\RequirePackage{xcolor}
%\RequirePackage{accsupp}
%\RequirePackage{array,tabularx}
%\RequirePackage{longtable}

%%%%%%%%%%%%%%%%%%%%%%%%%% | CONFIGURACIONES BÁSICAS | %%%%%%%%%%%%%%%%%%%%%%%%%

\captionsetup[figure]{name=Figura}
\usemintedstyle{autumn}
\addbibresource{referencias.bib}
\hypersetup{
    colorlinks=true, % Habilita los hipervínculos coloreados
    linkcolor=black, % Color de los hipervínculos de enlace en negro
    filecolor=black, % Color de los hipervínculos de archivo en negro
    urlcolor=black, % Color de los hipervínculos de URL en negro
    citecolor=black, % Color de los hipervínculos de cita en negro
    citebordercolor=white, % Sin borde en los hipervínculos de cita
    linktoc=all % Hipervínculos de enlace para todas las entradas del índice
}
% Ajustar el espaciado antes y después de \paragraph
\titlespacing{\paragraph}{3em}{-0.5em}{0.5em}

%%%%%%%%%%%%%%%%%%%%%%%%%% | SOBREESCRITURA DE CMDS | %%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\cftsecleader}{\hspace*{1em}\cftdotfill{0.95\cftdotsep}}
\renewcommand{\cftsubsecleader}{\hspace*{1em}\cftdotfill{0.95\cftdotsep}}
\renewcommand{\cftsubsubsecleader}{\hspace*{1em}\cftdotfill{0.95\cftdotsep}}
\renewcommand{\cftfigleader}{\hspace*{1em}\cftdotfill{0.95\cftdotsep}}
\renewcommand{\cfttableader}{\hspace*{1em}\cftdotfill{0.95\cftdotsep}}
\renewcommand{\arraystretch}{2}
\renewcommand*{\bibopenparen}{[}
\renewcommand*{\bibcloseparen}{]}

%%%%%%%%%%%%%%%%%%%%%%%%% | COMANDOS PERSONALIZADOS | %%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% |     TIPOGRAFÍA      | %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\membreteFont}[1]{\fontsize{12}{16}\selectfont\noindent #1}
\newcommand{\tituloPortadaFont}[1]{\fontsize{18}{22}\selectfont\noindent {\bfseries #1}}
\newcommand{\textoPortadaFont}[1]{\fontsize{12}{16}\selectfont\noindent #1}
\newcommand{\fechaPortadaFont}[1]{\fontsize{14}{18}\selectfont\noindent #1}
\newcommand{\tituloMiniSeccion}[1]{\fontsize{11}{14}\noindent \textbf{#1}}
\newcommand{\leyendaFont}[1]{\fontsize{10}{12}\selectfont #1}
\newcommand{\palabrasClaveFont}[1]{\noindent #1}

\captionsetup{
  labelfont={bf,small},
  singlelinecheck=false,
  justification=centering
}

%%%%% |     NUMERACIONES      | %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Configurar el formato de la etiqueta de la figura
\renewcommand{\thefigure}{\thesection.\arabic{figure}}
% Configurar el formato de la etiqueta de la tabla
\renewcommand{\thetable}{\thesection.\arabic{table}}

\counterwithin{figure}{section}
\counterwithin{table}{section}


%%%%% | LISTAS Y ESPACIADOS | %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newlist{actividades}{enumerate}{1}
\newlist{hitos}{enumerate}{1}
\newlist{subactividades}{enumerate}{2}

\setlist[actividades]{label=\makebox[1.75em][r]{\textbf{\scriptsize{\arabic*}.-}},leftmargin=2.5em, align=left}
\setlist[hitos]{label=\makebox[2em][r]{\textbf{{\roman*}}},leftmargin=5em, align=left}
\setlist[subactividades]{label=\textbf{{\scriptsize\arabic{actividadesi}.\arabic*}.-},resume=actividades,leftmargin=1.5em, align=left}

\setlength{\parskip}{1em} % Ajusta el espacio vertical entre párrafos a 1em
\titlespacing{\section}{0pt}{0pt}{1em-\parskip}
\titlespacing{\subsection}{0pt}{0pt}{0.8em-\parskip}
\titlespacing{\subsubsection}{0pt}{0pt}{0.65em-\parskip}

\setlist{noitemsep} % Elimina el espacio vertical entre items de las listas

%%%%% |     MACROS      | %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\membrete}[1]{%
  \membreteFont{#1}
}%

\newcommand{\tituloPortada}[1]{%
    \tituloPortadaFont{#1}\\
}%

\newcommand{\alumnos}[1]{%
    \textoPortadaFont{\textbf{#1}}
}%

\newcommand{\datoPortada}[2]{%
    \textoPortadaFont{#1: \textbf{#2}\\}
}%

\newcommand{\datosPortada}[1]{%
    #1
}%

\newcommand{\fechaPortada}[1]{%
    \fechaPortadaFont{#1}
}%

\newcommand{\palabrasClave}[1]{%
    \palabrasClaveFont{\textbf{Palabras clave: }\textit{#1}}
}%

\newcommand{\imagen}[3]{%
    \begin{figure}[H]
        \centering
        \includegraphics[width=0.75\textwidth]{#1}
        \caption{\leyendaFont{#2}}
        \label{fig:#3}
    \end{figure}
}

\newcommand{\imagenS}[4]{%
    \begin{figure}[H]
        \centering
        \includegraphics[width=#4\textwidth]{#1}
        \caption{\leyendaFont{#2}}
        \label{fig:#3}
    \end{figure}
}

\NewDocumentCommand{\pdfExterno}{m m m o}{%
    \phantomsection
    \addcontentsline{toc}{subsection}{#1}
    \label{anexo:#3}
    \IfValueTF{#4}{% 
        % * Si se especificaron números de página
        \includepdf[pages={#4}, pagecommand={\thispagestyle{plain}}]{#2}
    }{%
        % * Si no se especificaron números de página, incluir todas las páginas
        % ! Esto da error por el momento, hay que especificar el número de páginas
        % TODO: Arreglar esto
        \includepdf[pagecommand={\thispagestyle{plain}}]{#2}
    }%
}

\newcommand{\filaTabla}[1]{#1\\\hline}

\newcommand{\tabla}[4]{%
    \begin{table}[!htbp]
        \centering
        \caption{\leyendaFont{#1}}
        \label{tab:#2}
        {\scriptsize
            \begin{tabular}{#3}
                \hline #4
            \end{tabular}
        }
    \end{table}
}

\newcommand{\actividad}[2]{%
    {\scriptsize\bfseries(#1)}\hspace*{1em}{\small#2}
}

\newcommand{\hito}[2]{%
    {\scriptsize\bfseries(#1)}\hspace*{0.65em}{\small#2}
}

\definecolor{PythonBlue}{RGB}{48, 105, 152}

\setlipsum{%
  par-before = \colorlet{oldcolor}{.}\color{PythonBlue!50!white},
  par-after = \color{oldcolor},
  sentence-before = \colorlet{oldcolor}{.}\color{PythonBlue!50!white},
  sentence-after = \color{oldcolor}
}
