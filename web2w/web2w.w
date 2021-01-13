% This file is part of web2w.
% Copyright 2017 Martin Ruckert
% 
% web2w is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% web2w is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with web2w.  If not, see <http://www.gnu.org/licenses/>.
%  
% Martin Ruckert, Hochschule Muenchen, Lothstrasse 64, 80336 Muenchen
% 

\input web2w.sty


%% defining how to display certain C identifiers
@s token int
@s symbol int
@s debug if
@s gubed if
@s stat if
@s tats if
@s init if
@s tini if
@s int8_t int
@s uint8_t int
@s int16_t int
@s uint16_t int
@s integer int
@s real float
@s repeat while
@s until  while
@s bool int

\makeindex
\maketoc

\titletrue

\def\lastrevision{${}$Revision: 1192 ${}$}
\def\lastdate{${}$Date: 2018-04-03 15:43:51 +0200 (Tue, 03 Apr 2018) ${}$}

\input titlepage.tex


\frontmatter

@

\plainsection{Preface}

This book describes a project to convert the \TeX\ source code\cite{Knuth:tex}
written by  \index{Knuth, Donald E.}Donald E. Knuth
as a ``\WEB/''\cite{Knuth:lp} into a ``\cweb/''\cite{Knuth:cweb}.

\itemize
\item On December 9, 2016, I started to implement \web2w/ as a compiler for \WEB/ files
which is described below. The compiler, as compilers usually do, reads an input file 
and continues to produce a parse tree.
The resulting parse tree
has two structures: a linear structure representing the 
linear order of the input file and a tree structure
representing the embedded \Pascal/ program.
Then the embedded \Pascal/ program needs to be translated into an 
equivalent \CEE/ program. And finally, the linear structure
of the parse tree will be used to output a \cweb/ file.
Small corrections on the resulting \cweb/ file are implemented by
a patch file\index{patch file}.

The overall goal is the generation of a
\.{ctex.w} file that is as close as possible to the \.{tex.web} input file,
and can be used to produce \.{ctex.tex} and \.{ctex.c} using the
standard tools \.{ctangle} and \.{cweave}.

The \TeX\ program can then be compiled from \.{ctex.c} and the \TeX\ documentation
can be generated from \.{ctex.tex} by \TeX\ itself.

This will simplify the tool chain necessary to generate \TeX\ from
its ``sources''.

\item On April 20, 2017, I was able to create the first ``hello world'' \.{dvi} file
with my newly generated \TeX\ program and with that, I had reached 
version 0.1\index{version 0.1} of \web2w/.% revision 794

\item On April 26, 2017, I succeeded for the first time
to generate a program that would pass the trip test\index{trip test} and
therefore can be called \TeX. 
This was then version 0.2\index{version 0.2} of \web2w/. % revision 808

While the program at this point was a ``correct implementation of \TeX'',
its form still needed further improvement. 
For example, the sizes of arrays were computed
and occurred in the source as literal numbers. It would be appropriate
for source code that instead the expression defining the
array size were used to specify the array size\index{array size}.
The use of \&{return} statements 
and the elimination of unused |end|
labels also asked for improvement.

\item  On May 11, 2017, I completed version 0.3 of \web2w/. % revision 834
Numerous improvements were added by then: some concerning the presentation 
of \web2w/ itself, others with the goal of generating better \cweb/ code for \TeX.
I decided then to freeze the improvement of the code for a while and
prepare this document for publication as a book.

\item On July 27, 2017, I completed version 0.4 of \web2w/, % revision 935
the first version that will be published as a book.
More improvements (and more versions) are still to come.

Of course, changes in the code part of \TeX\ will necessarily require
changes in the documentation part. These can, however, not result from
an automatic compilation. So the plan is to develop patch files\index{patch file}
that generate from the latest 0.$x$~versions\index{0.1 version+0.$x$~version} 
improved 1.$y$~versions\index{1.y version+1.$y$~version}. 
These versions will share
the same goal as version 0.$x$: producing a \cweb/ \TeX\ source file
that is as close as possible to the original web source
but with a documentation part of each section that reflects the changes 
made in the code.


\item There is a long term goal that brought me to construct \.{web2w}
in the first place: I plan to derive from the \TeX\ sources 
a new kind of \TeX\ that is influenced
by the means and necessities of current software and hardware.
The name for this new implementation will be \HINT/\index{HINT+\HINT/} which is, 
in the usual Open Software naming schema, the acronym for 
``\HINT/ is not \TeX''.

For example, \HINT/ will accept UTF-8 input files because this
is the defacto standard due to its use on the world wide web.
Further, the machine model will be a processor that can
efficiently handle 64-Bit values and has
access to large amounts of main memory (several GByte).
Last not least, I assume the availability of a good modern \CEE/
compiler and will leave optimizations to the compiler if possible.

The major change however will be the separation of the \TeX\ frontend\index{frontend}: 
the processing of \.{.tex} files, from the \TeX\ backend\index{backend}: 
the rendering of paragraphs and pages.

Let's look, for example, at  ebooks\index{ebook}: 
Current ebooks are of minor typographic quality. Just compiling
\TeX\ sources to a standard ebook format, for example epub, does
not work because a lot of information that is used by \TeX\ to
produce good looking pages is not available in these formats.
So I need to cut \TeX\ (or \HINT/) in two pieces: a frontend, that
reads \TeX\ input and a backend that renders pixel on a page.
The frontend will not know about the final page size because
the size of the output medium may change while we read---for
example by turning a mobile device from landscape to portrait
mode. On the other hand, the computational resources of the backend
are usually limited because a mobile device has a limited
supply of electrical energy. So we should do as much as we
can in the frontend and postpone what needs to be postponed
to the backend. In between front and back, we need a nice
new file format, that is compact and efficient, and transports
whatever information is necessary between both parts.

These are the possible next steps:
\itemize
\item As a first step, I will make a version of \TeX\ that produces a file listing all
the contributions and insertions that \TeX\ sends to the page builder\index{page builder}.
Let's call this a \.{.hint} file. This version of \TeX\ will become
the final frontend.

\item Next, I will use a second version of \TeX\ where I replace the 
reading of \.{.tex} files  by the reading of a \.{.hint} file and feeding
its content directly to the page builder.  This version of \TeX\ will become
the final backend. Once done, I can test the equation 
$\hbox{\TeX} =\hbox{\HINT/ frontend}+\hbox{\HINT/ backend}$.

\item
Next, I will replace the generation of dvi files in the backend
by directly displaying the results in a ``viewer''.
The ``viewer'' reads in a \.{.hint} file
and uses it to display one single page
at an arbitrary position.  Using page up and page down buttons,
the viewer can be used to navigate in the  \.{.hint} file.
At that point, it should be possible to change \.{vsize}\index{vsize+\.{vsize}} dynamically
in the viewer.

\item The hardest part will be the removal of \.{hsize}\index{hsize+\.{hsize}} dependencies
from the frontend and moving them to the backend. I am still not sure
how this will work out.

\item Once the author of a \TeX\ document can no longer
specify the final \.{hsize} and \.{vsize}, he or she would probably wish 
to be able to write conditional text for different ranges of \.{hsize}
and \.{vsize}. So if the frontend encounters such tests it needs to include
all variants in its output file.

\item Last not least, most people use \LaTeX\index{LaTeX+\LaTeX}\ not plain \TeX.
Hence, if I want many people to use \HINT/, it should be able to
work with \LaTeX. As a first step, 
I looked at $\epsilon$-\TeX\index{e-TeX+$\epsilon$-\TeX}, and my
cweb version of $\epsilon$-\TeX\ already passes the extended trip test\index{trip test} for
$\epsilon$-\TeX.  But I am not sure what \LaTeX\ needs
beside the extensions of $\epsilon$-\TeX. 
So if someone knows, please let me know.

\enditemize

Enough now of these fussy ideas about the future. Let's turn to the present
and the conversion of \TeX\ from \WEB/ to \cweb/. 
\enditemize

\index{literate programming} 
\index{Knuth, Donald E.}

\vskip 1cm
\noindent {\it San Luis Obispo, CA\hfil\break
June 27, 2017 \hfill Martin Ruckert}


\tableofcontent

\thefigindex
\makefigindex

\mainmatter

\section{Introduction}
\web2w/, the program that follows, was not written following an established
software engineering workflow as we teach it in our software
engineering classes. Instead the development of this program was driven by an ongoing
exploration of the problem at hand where the daily dose of success
or failure would determine the direction I would go on the next day.

This description of my program development approach sounds a bit like
``rapid prototyping''. But ``prototype'' implies the future existence of
a ``final'' version and I do not intend to produce such a ``final'' version.
Actually I have no intention to finish the prototype either,
and I might change it in the future in unpredictable ways.
I expect, however, that the speed of its further development will certainly
decrease as I move on to other problems.
Instead I have documented the development process 
as a literate program\index{literate programming}: the pages
you are just reading. So in terms of literature, this is not an epic novel with
a carefully designed plot, but it's more like the diary of an explorer who sets out
to travel trough yet uncharted territories.

The territory ahead of me was the program \TeX\ written 
by Donald E. Knuth\index{Knuth, Donald E.}
 using the \WEB/\index{WEB+\WEB/}
language as a literate program. As such, it contains snippets of code in the programming
language \Pascal/---\Pascal/-H\index{Pascal H+\Pascal/-H} to be precise.  
\Pascal/-H is Charles Hedrick's\index{Hedrick, Charles} modification of a compiler
for the DECsystem-10\index{DECsystem-10} that was originally developed at the 
University of Hamburg\index{University of Hamburg} 
(cf. \cite{GLN:pascal} see~\cite{Knuth:tex}). 
So I could not expect to find a pure ``Standard Pascal''.
But then, the implementation of \TeX\ deliberately does not use the full set of 
features that the language \Pascal/ has to offer in order to make 
it easier to run \TeX\ on a
large variety of machines. At the beginning, it was unclear to me what problems
I would encounter with the subset of \Pascal/ that is actually used in \TeX.

Further, the problem was not the translation of \Pascal/ to \CEE/. 
A program that does
this is available in the \TeX\ Live\index{TeX Live+\TeX\ Live} 
project: \.{web2c}\cite{web2c} translates the \Pascal/
code that is produced using \.{tangle}\index{tangle+\.{tangle}} 
from \.{tex.web} into \CEE/ code.
The \CEE/ code that is generated this way can, however, not be regarded
as human readable source code.
The following example might illustrate this: Figure~\figref{tex_code} 
shows the \WEB/ code for the function |new_null_box|. 
The result of  translating it to \CEE/
by \.{web2c} can be seen in figure~\figref{tl_code}.
In contrast, figure~\figref{ctex_code} shows what \web2w/ will achieve.

\float{\line{\noindent
\fig{\includefig{tex_new_null_box}%
\caption{\WEB/ code for |new_null_box|}\label{tex_code}}%
\hfill
\fig{\includefig{ctex_new_null_box}%
\caption{\cweb/ code for |new_null_box|}\label{ctex_code}}\hfil}%
\par\bigskip
\fig{\includefig{tl_new_null_box}%
\caption{The \CEE/ code for |new_null_box| as generated by {\tt web2c}}\label{tl_code}}
}

It can be seen, that \.{web2c} has desugared the sweet code written by
Knuth to make it unpalatable to human beings, the only use you can
make of it is feeding it to a \CEE/ compiler. In contrast, \web2w/
tries to create source code that is as close to the original as
possible but still translates \Pascal/ to \CEE/.  For example, note
the last statement in the |new_null_box| function: where \CEE/ has a
\&{return} statement, \Pascal/ assigns 
the return value to the function
name. A simple translation, sufficient for a \CEE/ compiler, can just
replace the function name by ``\.{Result}'' (an identifier that is not
used in the implementation of \TeX) and add ``\.{return Result;}'' at
the end of the function (see figure~\figref{tl_code}).  A translation
that strives to produce nice code should, however, avoid such ugly
code.

Let's look at another example\index{new character+|new_character|}:

\float{\line{\noindent
\fig{\includefig{tex_new_character}%
\caption{The \WEB/ code for |new_character|}\label{tex_new_character}}\hfil}%
\par\bigskip
\line{\noindent
\fig{\includefig{ctex_new_character}%
\caption{The \cweb/ code for |new_character|}\label{ctex_new_character}}\hfil}%
}%

In figure~\figref{tex_new_character} there is a ``\&{return}'' in the
innermost \&{if}.  This ``\&{return}'' is actually a macro defined as ``|goto
exit|'', and ``|exit|'' is a numeric macro defined as ``|10|''. ``\&{return}''
is a reserved word in \CEE/ and ``|exit|'' is a function of the \CEE/
standard library, so something has to be done. The example also
illustrates the point that I can not always replace an assignment to
the function name by a \CEE/ return statement. Only if the assignment
is in a tail position\index{tail position}, that is a position 
where the control-flow leads
directly to the end of the function body, it can be turned into a
return statement as happened in
figure~\figref{ctex_new_character}. Further, if all the goto
statements that lead to a given label have been eliminated, as it is the
case here, the label can be eliminated as well. 
In figure~\figref{ctex_new_character} there is no ``|exit:|''
preceding the final ``\.{\RB}''.

Another seemingly small problem is the different use of semicolons\index{semicolon} in
\CEE/ and \Pascal/.  While in \CEE/ a semicolon follows an expression
to make it into a statement, in \Pascal/ the semicolon connects two
statements into a statement sequence.  For example, if an assignment
precedes an ``\&{else}'', in \Pascal/ you have ``\.{x:=0 else}'' where as in
\CEE/ you have ``\.{x=0; else}''; no additional semicolon is needed if
a compound statement precedes the ``\&{else}''.  When converting
\.{tex.web}, a total of 1119~semicolons need to be inserted at the right
places. Speaking of the right place: Consider the following \WEB/
code:
\medskip
\nointerlineskip
\vbox{\includefig{tex_cant_happen}}
\nointerlineskip
\medskip
\noindent
Where should the semicolon\index{semicolon} go? Directly preceding the ``\&{else}''?
Probably not!  Alternatively, I can start the search for the right
place to insert the semicolon with the assignment. But this does not
work either: the assignment\index{assignment} can be spread over several macros or
modules which can be used multiple times; so the right place to insert
a semicolon in one instance can be the wrong place in another
instance.  \web2w/ places the semicolon correctly behind the
assignment like this:
\medskip
\nointerlineskip
\vbox{\includefig{ctex_cant_happen}}
\nointerlineskip
\medskip\noindent
But look what happened to the string\index{string} |"???"|.
Strings enclosed in \CEE/-like double quotes\index{double quote} receive a special
treatment by \.{tangle}\index{tangle+\.{tangle}}: 
the strings are collected in a string pool\index{string pool}
file and replaced by string numbers in the \Pascal/ source.  No such
mechanism is available in \.{ctangle}.  My first attempt was to replace
the string handling of \TeX\ and keep the \CEE/-like strings in the
source code. \TeX s string pool\index{string pool} is, however, hardwired into the
program and is used not only for static strings but also for strings
created at runtime, for example the names of control sequences\index{control sequence}.  
So I tried a hybrid approach: keeping strings that are used only for output
(error messages for example) and translating other strings to string
numbers.  There are different places where the translation of a string like 
|"Maybe you should try asking a human?"| to a number like |283| can take place.
\enumerate
\item One could add a function |s| to do the translation at runtime and then write
|s("Maybe you should try asking a human?")|. The advantage is simplicity and readability; 
the disadvantage is the overhead in time and space (the string will exist twice: 
as a static string
and as a copy in the string pool).
\item One could use the \CEE/ preprocessor to do the job. For
example, I could generate a macro {\it Maybe\_you\_should\_try\_asking\_a\_human0x63\/} 
that is defined as 283 and a second macro
{\it str\_283\/} for the string itself. Then, I can replace the occurrence of
the string in the source by the macro name that mimics the string
content and initialize the |str_pool| and |str_start| array using
the other macro.
\item As a third variation used below, one can use the module
expansion mechanism of \.{ctangle}.  I generate for each string a
module, in the above example named \PB{$\X1234:\PB{\.{"Maybe\ you\
should\ try\ asking\ a\ human?"}}\X$}, that will expand to the correct
number, here |283|. And as in the previous method use a macro
|str_283| to initialize |str_pool| and |str_start|. The advantage
is the greater flexibility and the nicer looking replacements for
strings, because module names can use the full character set.  
(Imagine replacing  |"???"| by {\it \_0x630x630x63\/}.)
\endenumerate
In retrospect, after seeing how nice method 3 works, I ponder if I
should have decided to avoid the hybrid approach and use approach 3
for all strings. It would have reduced the amount of changes to the
source file considerably.  I further think that approach 1 has its
merits too. The overhead in space is just a few thousand byte and the
overhead in time is incurred only when the strings are actually needed
which is mostly during a run of \.{initex} and while generating output
(which is slow anyway).

A mayor difference between \Pascal/ and \CEE/ is the use of
subrange types\index{subrange type}.  
Subrange types are used to specify the range of valid
indices when defining arrays. While most arrays\index{array} 
used in \TeX\ start with index zero,
not all do. In the first case, they can be implemented as \CEE/ arrays
which always start at index zero; in the latter case, I define a zero
based array having the right size, adding a ``0'' to the name. Then, I
define a constant pointer initialized by the address of the zero based
array plus/minus a suitable offset so that I can use this pointer as
a replacement for the \Pascal/ array.

When subrange types are used to define variables, I replace subrange
types by the next largest \CEE/ standard integer type as defined in
\.{stdint.h} which works most of the time. Consider the code
\medskip
\nointerlineskip
\vbox{\includefig{tex_print_totals}}
\nointerlineskip
\medskip\noindent
where ${}\\{nest\_size}\K{}$\T{40}.
Translating this to 
\medskip
\nointerlineskip
\vbox{\includefig{ctex_print_totals}}
\nointerlineskip
\medskip\noindent
would result in an infinite loop because |p| would never become less
than zero; instead it would wrap around. So in this (and 21 similar
cases), I declare the variables used in 
for-loops\index{for+\&{for}} to be of type \&{int}.

I will not go into further details of the translation process as you
will find all the information in what follows below. Instead, I will
take a step back now and give you the big picture, looking back at the
journey that took me to this point.

The program \web2w/ works in three phases: First I run the input file
\.{tex.web} through a scanner\index{scanner} producing
 tokens (see section~\secref{scanner}). The pattern matching
is done using \.{flex}\index{flex+\.{flex}}, the action code consists of 
macros described here.  The tokens form a doubly linked list, so that later I can
traverse the source file forward and backward. During scanning,
information is gathered and stored about macros, identifiers, and
modules.  In addition, every token has a |link| field which is used to
connect related tokens.  For example, I link an opening parenthesis
to the matching closing parenthesis, and the start of a comment to the
end of the comment.

After scanning comes parsing\index{parsing}. The parser is generated 
using \.{bison}\index{bison+\.{bison}}
from a modified \Pascal/ grammar  (see section~\secref{parser}).
To run the parser, I need to feed
it with tokens, rearranged in the order that \.{tangle}\index{tangle+\.{tangle}} 
would produce, expanding macros and modules as I go.  While parsing, I gather
information about the \Pascal/ code. At the beginning, I tended to use
this information immediately to rearrange the token sequence just
parsed. Later, I learned the hard way (modules that were modified on
the first encounter would later be feed to the parser in the modified
form) that it is better to leave the token sequence untouched and just
annotate it with information needed to transform it during the next stage.
A technique that proved to be very useful is connecting the key tokens
of a \Pascal/ structure using the |link| field. For example, connecting
a ``\&{case}'' token with its ``\&{do}'' token makes it easy to place
the expression that is between these tokens, without knowing anything about
its actual structure, between `` \&{switch} ('' and
``)''.  The final stage is the generation of \cweb/
output. Here the token sequence is traversed a third time, this time
again in input file order.  This time, the traversal will stop at the warning signs put
up during the first two passes, use the information gathered so far,
and rewrite the token sequence as gentle and respectful as possible
from \Pascal/ to \CEE/.

Et voil\`a! \.{tex.w} is ready---almost at least. I apply a last patch 
file\index{patch file},  for instance to adapt documentation reliant 
on \.{webmac.tex}\index{webmac tex+\.{webmac.tex}}
so that it works with \.{cwebmac.tex}\index{cwebmac tex+\.{cwebmac.tex}},
 or I make small changes that do not deserve a more general treatment. 
The final file is then called \.{ctex.w} from
which I obtain \.{ctex.c} and \.{ctex.tex} simply by applying
\.{ctangle} and \.{cweave}. Using ``\.{gcc ctex.c -o ctex}'' I get a
running \.{ctex}. Running ``\.{ctex ctex.tex}'' to get \.{ctex.dvi} is
then just a tiny step away: it is necessary to set up format and font metric
files.  The details on how to do that and run (and pass) the infamous
trip test\index{trip test} are described in section~\secref{triptest}.
 

\section{Converting \WEB/ to \cweb/}

\web2w/ is implemented by a \CEE/ code file\index{web2w.c+\.{web2w.c}}:


@c
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>
#include <math.h>
#include "web2w.h"
#include "pascal.tab.h"

@<internal declarations@>@;
@<global variables@>@;
@<functions@>@;

int @!main(int argc, char *argv[])
{ @<process the command line@>@;
  @<read the \WEB/@>@;
  @<parse \Pascal/@>@;
  @<generate \cweb/ output@>@;
  @<show summary@>@;
  return 0;
}
@


I also create the header file \.{web2w.h}\index{web2w.h+\.{web2w.h}} 
included in the above \CEE/ file.
 It contains the external declarations and is used to share constants, macros,
types, variables, and functions with other \CEE/ files.

@(web2w.h@>=
@<external declarations@>
@

\section{Reading the \WEB/}

When I read the \WEB/, I split it into a list of tokens\index{token};
this process is called ``scanning''.\index{scanner}
I use \.{flex}\index{flex+\.{flex}} (the free counterpart  
of \.{lex}\index{lex+\.{lex}}) to generate the function
|wwlex| from the file \.{web.l}\index{web.l+\.{web.l}}.
 
@<internal declarations@>=
extern int wwlex(void); /* the scanner */
extern FILE *wwin; /* the scanners input file */
extern FILE *wwout; /* the scanners needs an output file */@/@,
@

\noindent
Using this function, I can read the \WEB/ and produce a token list.
@<read the \WEB/@>=
  @<initialize token list@>@;
  wwlex();
  @<finalize token list@>@;
@

Reading the \WEB/ results in a list of tokens as used by 
\.{tangle}\index{tangle+\.{tangle}} or \.{weave}.
At this point, I do not need to extract the structure of the \Pascal/
program contained in the \WEB/. This is left for a later stage. 
I need to extract the \WEB/ specific structure: text in limbo\index{limbo} followed
by modules\index{module}; modules starting with \TeX\ text followed optionally by
definitions and \Pascal/ code. Aside from this general structure,
I will later need to translate the \WEB/ specific control sequences
(starting with @@) by \cweb/ specific control sequences.

The scanner identifies tokens by
matching the input against regular expressions\index{regular expression} and
executing \CEE/ code if a match is found.
The lex file \.{web.l}\index{web.l+\.{web.l}} is not a literate program 
since it's not a \CEE/ file;
it is given verbatim in section~\secref{scanner}.
The functions and macros used in the action parts
inside the file, however, are described below. 

\subsection{Scanning the \WEB/}

The scanner\index{scanner} is written following the \WEB/\index{WEB+\WEB/} 
User Manual\cite{Knuth:WEB}.

It has three main modes: the |INITIAL| mode (or |TEX| mode),
the |MIDDLE| mode, and the |PASCAL| mode; 
and three special modes |DEFINITION|, |FORMAT|, and |NAME|. 
@<external declarations@>=
#define @!TEX INITIAL
@

The scanner starts out in |TEX| mode scanning the part of the file
that is ``in limbo''\index{limbo} and then switches back and forth between |TEX|
mode, |MIDDLE| mode, and |PASCAL| mode, occasionally taking a detour 
through |DEFINITION|, |FORMAT|, or |NAME| mode.


While scanning in |TEX| mode, I need to deal with a few
special characters: the character ``\.{@@}'', because
it introduces special web commands and might introduce a change into
\Pascal/ mode; the ``\.{\VB}'' character, because it starts \Pascal/ mode;
and the ``\.{\LB}'' and ``\.{\RB}'' characters , which are
used for grouping while in \TeX\ mode. Unfortunately, these same characters
also start and end comments while in \Pascal/ mode. So finding a ``\.{\}}''
in |TEX| mode might be the end of a group or the end of a comment.
Everything else is just considered plain text. Text may also contain the
``\.{@@}'', ``\.{\VB}'', ``\.{\LB}'', and ``\.{\RB}'' characters if these 
are preceded by a backslash\index{backslash}.

In |PASCAL| mode, I match the tokens needed to
build the \Pascal/ parse tree. These are different---and 
far more numerous---than what I need for the \TeX\ part which 
my translator will not touch at all. The |MIDDLE| mode is a
restricted |PASCAL| mode that does not allow module names. Instead,
a module name terminates |MIDDLE| mode and starts a new module.

The |DEFINITION| mode is used to scan the initial part of a macro
definition; the |FORMAT| mode is a simplified version of the
|DEFINITION| mode used for format definitions; and the |NAME| mode is
used to scan module names.

In |PASCAL| mode, I ignore most spaces and match the usual \Pascal/ tokens.
The main work is left to the \Pascal/ parser.

The switching between the scanning modes is supported by a 
stack\index{stack} (see section~\secref{linking})
because it may involve nested structures. For example inside
\Pascal/, a comment contains \TeX\ code and inside \TeX\ code whatever
comes between two ``\.{\VB}'' characters is considered \Pascal/ code.
A scanner produced by \.{flex}\index{flex+\.{flex}} is very fast, 
but by itself not capable of tracking
nested structures.

\subsection{Tokens}
The parser creates a representation of the \WEB/ file as a list
of tokens\index{token}. Later the parser will build a parse tree with tokens
as leaf nodes. Because \CEE/ lacks object orientation,
I define |token| as a |union| of leaf nodes\index{leaf node} 
and internal nodes\index{internal node}
of the tree. All instances of the type defined this way share
a common |tag| field as a replacement for the class information.
Every token has a pointer to the |next| token,
a pointer the |previous| token,
a |link| field to connect related tokens, and an |up| pointer 
pointing from the leafs upwards and from internal
nodes upwards until reaching the root node.
@<external declarations@>=
typedef struct token {
  int tag;
  struct token *next, *previous, *link, *up;
  union {
    @<leaf node@>;
    @<internal node@>;
  };
} @!token;
@

Leaf nodes also contain a sequence number\index{sequence number}, enumerating stretches 
of contiguous \Pascal/ code, and for debugging\index{debugging} purposes, 
a line number\index{line number} field.
There is some more token specific information, that will be explained
as needed.

@<leaf node@>=
  struct {
    int @!sequenceno;
    int @!lineno;
    @<token specific info@>
  }
@




As a first example for token specific information, 
I note that most tokens have a |text| field that contains the textual 
representation of the token.
@<token specific info@>=
char *text;
@

The assignment of the |tag| numbers is mostly arbitrary.
The file \.{pascal.y} lists all possible tags and gives them
symbolic names which are shown using small caps in the following.
The function |tagname|, defined in \.{pascal.y}\index{pascal.y+\.{pascal.y}}, 
is responsible for converting the tag numbers back into readable strings.

@<external declarations@>=
extern const char *tagname(int tag);
@

Because I do not deallocate tokens, I can simply allocate them from 
a token array using the function |new_token|.

@<internal declarations@>=
#define MAX_TOKEN_MEM  250000
@

@<global variables@>=
static token token_mem[MAX_TOKEN_MEM]= {{0}};
static int free_tokens=MAX_TOKEN_MEM;
@

@<show summary@>=
  DBG(dbgbasic,"free tokens = %d\n",free_tokens);
@

@<functions@>=
static token *new_token(int tag)
{ token *n;
  if (free_tokens>0) n=&token_mem[--free_tokens]; 
  else ERROR("token mem overflow");
  n->lineno=wwlineno;
  n->sequenceno=sequenceno;
  n->tag=tag;
  return n;
}
@ 

The value of |wwlineno|, the current line number, is maintained automatically
by the code generated from \.{web.l}\index{web.l+\.{web.l}}.
@<external declarations@>=
extern int wwlineno;
@

The value of |sequenceno| is taken from a global variable.
@<global variables@>=
int sequenceno=0;
@
I increment this variable as part of the scanner actions using the macro |SEQ|.
@<external declarations@>=
extern int  sequenceno;
#define SEQ @[(sequenceno++)@]
@

The following function is used in the parser to verify that two tokens |t| and |s|
belong to the same token sequence.

@<external declarations@>=
void seq(token *t, token*s);
@

@<functions@>=
void seq(token *t, token*s)
{  CHECK(t->sequenceno==s->sequenceno,
        "tokens in line %d and %d belong to different code sequences",t->lineno,s->lineno);
}
@


The list of tokens is created by the function |add_token|.
@<external declarations@>=
extern token *add_token(int tag);
@

The function creates a new token and adds it to the
global list of all tokens maintaining two pointers,
one to the first and one to the last token of the list.

@<global variables@>=
static  token *first_token;
token *last_token;
@
@<external declarations@>=
extern token *last_token;
@

I initialize the list of tokens by creating a |HEAD| token, and make it the
first and last token of the list.

@<initialize token list@>=
first_token=last_token=new_token(HEAD);
first_token->text="";
@

@<functions@>=
token *add_token(int tag)
{ token *n=new_token(tag);
  last_token->next=n;
  n->previous=last_token;
  last_token=n;
  return n;
}
@

\subsection{Scanner actions}

Now I am ready to explain scanner actions\index{scanner action}. 
Let's start with the most
simple cases.  There are quite a few tokens, that are just added to
the token list and have a fixed literal string as textual
representation.  I use the macro |TOK| to do this. Making |TOK| an
external declaration will write its definition into the file
\.{web2w.h}\index{web2w.h+\.{web2w.h}} which will be 
included by \.{web.l}\index{web.l+\.{web.l}}.

@<external declarations@>=
#define TOK(string,tag)  (add_token(tag)->text=string)
@

Another class of simple tokens are those that have a varying textual
representation which is defined by the string found in the input file.
The variable |wwtext| points to this input string after it was matched
against the regular expression\index{regular expression}.
 Since these strings are not persistent,
I need to use the string handling function |copy_string| before I can 
store them in the tokens |text| field.
The macro |COPY| can be used together with |TOK| to achieve the desired effect.

@<external declarations@>=
#define COPY  @[copy_string(wwtext)@]
@

The last class of tokens that I discuss before I turn my attention
to the functions that actually do the string-handling are the tokens
where the textual representation is build up in small increments.
Three macros are used to perform the desired operations: |BOS| (Begin of String)
is used to start a new string, |ADD| adds characters to the current string,
and |EOS| (End of String) is used to complete  
the definition of the string.

@<external declarations@>=
#define BOS      @[new_string()@]
#define ADD      @[add_string(wwtext)@]
#define EOS      @[(string_length()>0?TOK(end_string(),TEXT):0)@]
@

More string handling functions are used to define these macros and
it is time to explain the string handling in more detail.

\subsection{Strings}
In this section, I define the following functions:\index{string}

@<external declarations@>=
extern char *new_string(void); /* start a new string */
extern void add_string(char *str); /* add characters to the string */
extern char *end_string(void); /* finish the string */
extern char *copy_string(char *str); /* all of the above */
extern int string_length(void); /* the length of the string */@\@,
@

I use a character array called |string_mem|
to store these strings. Strings in the |string_mem| are never
deallocated, so memory management is simple.
When the scanner has identified a string, it will add it to the
current string using |add_string|. The scanner can then decide
when to start a  new string by calling |new_string| and when the string is
ready for permanent storage by calling |end_string|.
|string_length| returns the length of the current string.



Some statistics: \.{tex.web} contains 
11195 Strings with an average of 46.6 characters
per string and a maximum of 5234 characters (the text in limbo); 
the second largest string has 1891 characters. 
The total number of characters in all strings is 516646.
(Scanning \.{etex.web} will require even more string memory.)

@<internal declarations@>=
#define MAX_STRING_MEM 800000
@

@<global variables@>=
static char string_mem[MAX_STRING_MEM];
static int free_strings = MAX_STRING_MEM;
static int current_string= 0; 
@

@<show summary@>=
  DBG(dbgbasic,"free strings = %d\n",free_strings);
@

The string currently under construction is identified by 
the position of its first character, the |current_string|,
and its last character |MAX_STRING_MEM-free_strings|. 


@<functions@>=
char *new_string(void)
{ current_string= MAX_STRING_MEM-free_strings;
  return string_mem+current_string;
}

void add_string(char *str)
{  while (free_strings>0)
   { if (*str!=0)
        string_mem[MAX_STRING_MEM-free_strings--]=*str++;
     else 
        return;
   }
   ERROR("String mem overflow");  
}

char *end_string(void)
{ char *str=string_mem+current_string;
  if (free_strings>0)
    string_mem[MAX_STRING_MEM-free_strings--]=0;  
  else   
    ERROR("String mem overflow");
  current_string= MAX_STRING_MEM-free_strings;
  return str;
}

char *copy_string(char *str)
{@+ new_string();
  add_string(str);
  return end_string();@+
}

int string_length(void)
{@+return  (MAX_STRING_MEM-free_strings)- current_string;@+}

@


\subsection{Identifiers}
To be able to parse the embedded \Pascal/ code, 
I need to take special care of identifiers\index{identifier}. I keep
information related to identifiers in a table, called the |symbol_table|.
The table is accessed by the string representing the identifier
as a key and it returns a pointer to the table entry, called a |symbol|.
@<external declarations@>=
typedef struct symbol {
char *name;
int tag;
int obsolete;
int for_ctrl;
int value;
struct symbol *link;
token *type;
token *eq;
} symbol;
extern int get_sym_no(char *name);
extern symbol *symbol_table[];
@
@<internal declarations@>=
#define MAX_SYMBOL_TABLE  6007 /* or 4001 4999, a prime */
#define MAX_SYMBOLS       5200 /* must be less than |MAX_SYMBOL_TABLE|  */
@

@<global variables@>=
symbol *symbol_table[MAX_SYMBOL_TABLE]= {NULL};
static symbol symbols[MAX_SYMBOLS]= {{0}};
static int free_symbols=MAX_SYMBOLS;
@
@<show summary@>=
  DBG(dbgbasic,"free symbols = %d\n",free_symbols);
@

I organize the symbol table as a hash table\index{hash table}
 using double hashing\index{double hashing}
as described in~\cite{Knuth:TAOCP}, Chapter 6.4.
@<functions@>=
static int symbol_hash(char *name)
{ int hash=0;
  while (*name!=0)
    hash=hash + (*(name++)^0x9E);
  return hash;
}

static symbol *new_symbol(void)
{ CHECK(free_symbols>0,"Symbol table overflow");
  free_symbols--;
  return symbols+free_symbols;
}

int get_sym_no(char *name)
{ int i,c;
  i = symbol_hash(name)%MAX_SYMBOL_TABLE;
  if (symbol_table[i]!=NULL)
  { if (strcmp(symbol_table[i]->name,name)==0) 
      return i;
    if (i==0) c=1; else c = MAX_SYMBOL_TABLE-i;
    while (true)
    { i=i-c;
      if (i<0) i=i+MAX_SYMBOL_TABLE;
      if (symbol_table[i]==NULL) break;
      if (strcmp(symbol_table[i]->name,name)==0)
        return i;
    }
  }
  symbol_table[i]=new_symbol();
  symbol_table[i]->name=new_string(); add_string(name); end_string();
  symbol_table[i]->tag=ID;
  return i;
}
@

The pointer into the symbol table can be stored inside the token
in two ways: as an index into the |symbol_table| or as a direct pointer
to the |symbol| structure. While scanning the \WEB/, I will assign
the symbol number(|sym_no|), and while parsing \Pascal/, I will replace the
symbol number by the symbol pointer (|sym_ptr|). This is necessary, because I
will need to distinguish between various local symbols\index{local symbol} 
with the same name; these have only a single entry in the symbol table but 
the pointers will point to different |symbol| structures.
@<token specific info@>=
int sym_no;
struct symbol *sym_ptr;
@
\noindent
This leads to the following macros:
@<external declarations@>=
#define SYM_PTR(name) @[symbol_table[get_sym_no(name)]@]
#define SYMBOL {@+int s=get_sym_no(yytext);@+add_token(symbol_table[s]->tag)->sym_no=s;@+}
#define SYM(t) @[(symbol_table[(t)->sym_no])@]
@ 
\noindent
It's easy to convert such a token back to a string.
@<convert token |t| to a string@>=
case ID: case PID: case PCONSTID: 
case PARRAYFILETYPEID: case PARRAYFILEID:
case PFUNCID: case PPROCID: 
case PDEFVARID: case PDEFPARAMID: case PDEFREFID: case PDEFCONSTID: 
case PDEFTYPEID: case PDEFTYPESUBID: case PDEFFUNCID:  case CREFID: 
case NMACRO: case OMACRO: case PMACRO:@/
  return SYM(t)->name;
@


In \TeX, like in most programs, I encounter two kinds of symbols:
global\index{global symbol} and local symbols\index{local symbol}. 
While scanning, every symbol that I
encounter gets entered into the global symbol table. While parsing, I
will discover, that the variable |f| is a file variable in one
function and an integer variable in another function.  The two
occurrences of |f| have different scope\index{scope}.  So I want to link different
occurrences of |f| to different entries in the symbol table.

I use the function |localize| to create a local version of a symbol.

@<external declarations@>=
extern void localize(token *t);
@

To open a new scope, I use the function |scope_open|; to close it again, I
use the function |scope_close|.

@<external declarations@>=
extern void scope_open(void);
extern void scope_close(void);
@
These functions use a small array holding all the symbol numbers of
currently local symbols and another array to hold pointers to the global
symbols of the same name.

@<global variables@>=
#define MAX_LOCALS 50
static int locals[MAX_LOCALS];
static symbol *globals[MAX_LOCALS];
static int free_locals=MAX_LOCALS;
@


@<functions@>=
void scope_open(void)
{
  CHECK(free_locals==MAX_LOCALS,"Opening a new scope without closing the previous one");
}

void scope_close(void)
{  int i;
  for (i=free_locals; i<MAX_LOCALS; i++)
    symbol_table[locals[i]]=globals[i];
  free_locals=MAX_LOCALS;
}
@
To localize a symbol, I create a new one and enter it, after
saving the global symbol, into the symbol table.

@<functions@>=
void localize(token *t)
{ int sym_no=t->sym_no;
  symbol *l, *g;
  l=new_symbol();
  g=symbol_table[sym_no];
  l->name=g->name;
  l->tag=g->tag;
  l->eq=g->eq;
  symbol_table[sym_no]=l;
  CHECK(free_locals>0,"Overflow of local symbols in line %d",t->lineno);
  free_locals--;
  locals[free_locals]=sym_no;
  globals[free_locals]=g;
  t->sym_ptr=l;  
}
@ 


\subsection{Linking related tokens}
\label{linking}%
So far I have considered the \WEB/ file as one long flat list of 
tokens.\index{related token}
As already mentioned above, the file has, however, also a nested structure:
For example, each ``\.{\LB}'' token is related to a ``\.{\RB}'' token
that ends either a \TeX\ group or a \Pascal/ comment. 
While scanning, I will need to know about this structure because it
is necessary to do a correct switching of modes. Hence, I use the |link| field
to connect the first token to the later token. This information
is also useful at later stages, for example when I expand macros.
The following table gives a list of related tokens.

\center{\table{List of linked tokens}{%
&Left      &Right   &Mode &  Comment\hfill\cr
\noalign{\hrule}
&\.{(} & \.{)} & |PASCAL|/|PASCAL|& needed for macro expansion\index{macro expansion}\hfill\cr
&\.{\{} & \.{\}} & |PASCAL|/|TEX|/|PASCAL|   & comments\index{comment} \hfill\cr
&\.{\{} & \.{\}} & |MIDDLE|/|TEX|/|MIDDLE|   & comments \hfill\cr
&\.{\{} & \.{\}} & |TEX|/|TEX|   & grouping\hfill\cr
& \.{\VB}& \.{\VB} & |TEX|/|PASCAL|/|TEX|  & typesetting code\hfill\cr
&\.{@@<} & \.{@@>} &  & module names\hfill\cr
& \.{=}  &    &           & begin of \Pascal/\hfill\cr
& \.{==} &    &           & begin of \Pascal/\hfill\cr
&   & \.{@@ }   & |PASCAL|  & \hfill end of \Pascal/\cr
&   & \.{@@*}   & |PASCAL|  & \hfill end of \Pascal/\cr
&   & \.{@@d}   & |PASCAL|  & \hfill end of \Pascal/\cr
&   & \.{@@f}   & |PASCAL|  & \hfill end of \Pascal/\cr
&   & \.{@@p}   & |PASCAL|  & \hfill end of \Pascal/\cr
& \.{"} & \.{"} &           & list of \WEB/ strings\index{string}\hfill\cr
&\.{@@>=} &\.{@@>=} &       & continuation of module\index{module}\hfill\cr
& \.{@@p}&  \.{@@p} &       & continuation of program\index{program}\hfill\cr      
}\label{Linked}}


To track the nesting of structures, I need a stack\index{stack}:
 
@<global variables@>=
#define MAX_WWSTACK 200
static token *wwstack[MAX_WWSTACK]={0};
static int wwsp = 0;
@

I define the functions |ww_push| and |ww_pop| to
operate on the stack. When popping a token, I keep the nesting information
by linking it to its matching token.
The function |ww_is| can be used to test the |tag| of the token
on top of the stack.

@<external declarations@>=
extern void ww_push(token *t);
extern token *ww_pop(token *t);
extern int ww_is(int tag);
@

@<functions@>=
void ww_push(token *left)
{ CHECK(wwsp<MAX_WWSTACK,"WW stack overflow");
  DBG(dbglink,"Pushing[%d]:",wwsp); if (left!=NULL) DBG(dbglink,THE_TOKEN(left));
  wwstack[wwsp++]=left;
}

token *ww_pop(token *right)
{ token *left;
  CHECK(wwsp>0,"Mode stack underflow");
  left=wwstack[--wwsp];
  if (left!=NULL) left->link=right;
  DBG(dbglink,"Popping[%d]:",wwsp);  if (left!=NULL) DBG(dbglink,THE_TOKEN(left));
  return left;
}

int ww_is(int tag)
{ return wwsp>0 && wwstack[wwsp-1]!=NULL &&  wwstack[wwsp-1]->tag==tag;
}

@

Using the stack\index{stack},
I can now also distinguish the use of ``\.{\LB}'' and ``\.{\RB}'' 
as a grouping\index{grouping}
construct in \TeX\ from the use of starting and ending comments\index{comment} 
in \Pascal/. When I encounter ``\.{\LB}'' in |TEX| mode, it introduces a new level of 
grouping and I do not create a new token. 
Instead I push |NULL| on the stack.
When  I encounter ``\.{\LB}'' in |PASCAL| mode, however, it is the start of a comment;
I create a token and push it.
When I encounter  the matching ``\.{\RB}'', I am always in |TEX| mode.
I pop the stack and test the value: 
If it was |NULL|, I can continue in |TEX| mode because it was a grouping character;
if it was not |NULL|, it is the end of a comment. I create a token for it and 
continue in |PASCAL| mode.

@<external declarations@>=
#define PUSH      @[ww_push(last_token)@]
#define PUSH_NULL @[ww_push(NULL)@]
#define POP       @[ww_pop(last_token)@]
#define POP_NULL  @[(ADD, POP)@]
#define POP_MLEFT @[(EOS, TOK("}",RIGHT), BEGIN(MIDDLE), POP)@] 
#define POP_PLEFT @[(EOS, TOK("}",RIGHT), BEGIN(PASCAL), POP)@]
#define POP_LEFT  @[(ww_is(MLEFT)? POP_MLEFT : (ww_is(PLEFT)? POP_PLEFT: POP_NULL))@]
@


Besides linking matching tokens, the |link| field can also be used
to build linear list of related token. One example for such a list
is the list of \WEB/ strings\index{string}.
The program \.{tangle}\index{tangle+\.{tangle}}, converting a
\WEB/ to \Pascal/, creates a string pool\index{string pool} file. This mechanism is
no longer available in \.{ctangle} so I have to implement an alternative
(see section~\secref{stringpool} on replacing the \TeX\ string pool).
Here I take the first step and collect all the strings that occur
in the \WEB/ in one linked list. For this purpose, I use
a pointer to the |first_string|, and a pointer to the link field
of the |last_string|. The macro |WWSTRING| is used in the scanner and
adds the new string token to this list.

@<external declarations@>=
extern void wwstring(char *wwtext);
#define WWSTRING  @[wwstring(wwtext)@]
@

@<functions@>=
void wwstring(char *wwtext)
{ token *t=add_token(STRING);
  t->sym_no=get_sym_no(wwtext);
  t->text=SYM(t)->name;
  *last_string=t;
  last_string=&(t->link);
}
@

To make this work, it is sufficient to initialize the two pointers
appropriately.
@<global variables@>=
static token *first_string=NULL, **last_string=&first_string;
@





\subsection{Module names}
I need to maintain information for each module\index{module}. I keep
this information in a table, called the module table\index{module table}.
The table is accessed by the string representing the module name\index{module name}
as a key. This sounds very similar to what I did for identifiers,
there is, however, one main difference: 
Modules are sometimes referenced by incomplete module names\index{incomplete module name} 
that end with an ellipsis\index{ellipsis} ($\ldots$).
These incomplete module names may not even be valid \TeX\ code.
For this reason, I use a binary search tree\index{binary search tree}
to map module names to modules.
The first thing I need, therefore, is a function to compare two module names.
The function |module_cmp(n,m)| will compare the name of |n| to the name of |m|;
it returns a negative value if $|n| < |m|$; zero if $|n|=|m|$; and a positive
value if $|n|>|m|$. |m| is always a full module name, |n| might end abruptly
with an ellipsis.

@<functions@>=
static int module_name_cmp(token *n, token *m)
{ n=n->next;@+ m=m->next; /* advance from ``\.{@@<}'' to the name */
  if (n->next->tag==ELIPSIS)
     return strncmp(n->text,m->text,strlen(n->text));
  else
     return strcmp(n->text,m->text);
}
@

I organize the module table as a binary tree and allocate new modules from
a large array.
@<internal declarations@>=
#define MAX_MODULE_TABLE 1009 /* or 1009,  1231, 2017, 3001, a prime */
@

@<global variables@>=
static module module_table[MAX_MODULE_TABLE]= {{0}};
static int free_modules=MAX_MODULE_TABLE;
static module *module_root=NULL;
@

@<external declarations@>=
typedef struct module {
  token *atless;
  token *atgreater;
  struct module *left,*right; 
} module;
extern void add_module(token *atless);
extern module *find_module(token *atless);
@


@<show summary@>=
  DBG(dbgbasic,"free modules = %d\n",free_modules);
@

To look up a module in the module table 
I use the function |find_module|. It returns a pointer to the module
given the pointer to the ``\.{@@<}'' token that starts the module
name. The function will allocate a new module if needed.

@<functions@>=
module *find_module(token *atless)
{ module **m=&module_root;
  while (*m!=NULL)
  {int d = module_name_cmp(atless, (*m)->atless);
   if (d==0)
     return *m;
   else if (d<0) m=&((*m)->left);
   else m=&((*m)->right);
  }
  CHECK(free_modules>0,"Module table overflow");
  *m= module_table+MAX_MODULE_TABLE-free_modules--;
  (*m)->atless=atless;
  return *m;
}
@

Because modules can be defined in multiple installments,
I link together the closing ``\.{@@>}'' tokens. 
This is done by calling the function |add_module| whenever
I find the two tokens ``\.{@@>=}''. 

@<functions@>=
void add_module(token *atless)
{ module *m=find_module(atless);
  token *atgreater = m->atgreater;
   if (atgreater==NULL) 
     m->atgreater=atless->link;
   else
   { while (atgreater->link!=NULL) atgreater=atgreater->link;
     atgreater->link=atless->link;
   }
}
@

Next I consider the problem of scanning module names.  The name of a
module starts after a ``\.{@@<}'' token.  If this token shows up, I have
to do some preparations depending on the current mode: If I am in
|TEX| mode, I need to terminate the current |TEXT| token; if I am
in |MIDDLE| mode, I pop the stack and terminate the macro or format
definition I were just scanning;
no special preparation is needed if I am in |PASCAL| mode.  Then I
push the ``\.{@@<}'' token on the stack, start a new |TEXT| token, and
switch to |NAME| mode.  When I encounter the matching ``\.{@@>}'' or
``\.{@@>=}'' token, I add the module to the module table---calling
|find_module| to cover the case that this is the first and only
complete occurrence of the module name.

@<external declarations@>=
#define AT_GREATER_EQ @[TOK("@@>",ATGREATER), add_module(POP), TOK("=",EQ), PUSH, SEQ@]
#define AT_GREATER    @[TOK("@@>",ATGREATER), find_module(POP)@]
@

You may have noticed that the above |AT_GREATER_EQ| macro pushes the
|EQ| token on the stack.  I match this token up with the token that
ends the \Pascal/ code following the equal sign.  As you will see
below, I do the same for macro definitions.
Further, I link all the unnamed modules together using the ``\.{@@p}''
tokens. I add an extra |EQ| token to match the convention that I
have established for named modules.

@<external declarations@>=
extern token *program;
#define PROGRAM @[(program->link=last_token,program=last_token),TOK("",EQ)@]
@
\noindent
I use the first token as list head.
@<global variables@>=
token *program;
@
@<initialize token list@>=
program=first_token;
@

\subsection{Definitions}
In a \WEB/ file, the token  ``\.{@@d}'' introduces the definition\index{definition} 
of a numeric constants or a macro with or without parameter.
When the scanner encounters such a token, it enters the |DEFINITION| mode.

The first token in  |DEFINITION| mode is an identifier which will be
stored in the symbol table\index{symbol table}. 
Then follows an optional macro parameter\index{macro parameter}
``\.{(\#)}''; after the single or double equal sign, the scanner\index{scanner} switches
to |MIDDLE| mode, not without pushing the equal sign on the stack\index{stack} to
be matched against the first token after the following \Pascal/ code.

After scanning an ``\.{=}'' token, I know that a numeric macro\index{numeric macro}
is following, and I record this fact
by changing the |tag| of the identifier\index{identifier} in the token\index{token} 
and in the symbol table\index{symbol table}.
@<external declarations@>=
#define CHGTAG(t,x) @[((t)->tag=(x))@]
#define CHGID(t,x)  @[(SYM(t)->tag=(x))
#define CHGTYPE(t,x)  @[(SYM(t)->type=(x))
#define CHGVALUE(t,x)  @[(SYM(t)->value=(x))
#define CHGTEXT(t,x) @[((t)->text=(x))@]
@

After scanning an ``\.{==}'' token, I know that I have either an
ordinary macro\index{ordinary macro} or a parametrized macro\index{parametrized macro}. 
A |PARAM| token tells the difference.


@<functions@>=
void def_macro(token *eq, int tag)
{ token *id;
  if (eq->previous->tag==PARAM)
  { id = eq->previous->previous;
    tag=PMACRO;
  }
  else
  { id = eq->previous;
  }
  CHGTAG(id,tag);
  CHGID(id,tag);
  SYM(id)->eq=eq;
  DBG(dbgexpand,"Defining %s: %s\n", tagname(tag),SYM(id)->name);
}
@

@<external declarations@>=
extern void def_macro(token *eq, int tag);
#define DEF_MACRO(tag)   @[def_macro(last_token,tag),SEQ@]
@

Similar, the token ``\.{@@f}'' introduces a format 
specification\index{format specification} switching the
scanner\index{scanner} to |FORMAT| mode. It then scans tokens until the first newline
character brings the scanner back to |MIDDLE| mode.

\subsection{Finishing the token list}

When the scanner is done, I terminate the token list with two 
end of file\index{end of file} tokens: one for \Pascal/ and one for the \WEB/.

@<finalize token list@>=
TOK("",ATP);@+ PROGRAM;@+  PUSH;@+ TOK("",PEOF);@+ TOK("",WEBEOF);@+ POP;
@

At this point I might want to have a complete list of all tokens and
identifiers for debugging\index{debugging} purposes.

@<finalize token list@>=
if (debugflags&dbgtoken)
{ token *t=first_token; 
  while (t!=NULL)@+ {@+MESSAGE(THE_TOKEN(t));@+t=t->next;@+}
}
if (debugflags&dbgid)
{ int i; 
  for (i=free_symbols; i < MAX_SYMBOLS; i++) 
    MESSAGE("symbol[%d]=%s\n",i,symbols[i].name);
}
@




\section{Parsing Pascal}

%bug reported: subrange types have the form constant..constant; 
%\TeX\ uses constant..constant-1
%in line 5499
\index{parsing}
I use \.{bison}\index{bison+\.{bison}} (the free replacement
 of \.{yacc}\index{yacc+\.{yacc}}) to implement the
parser\index{parser}.  
Fortunately \TeX\ does not use the full \Pascal/\index{Pascal+\Pascal/} 
language, so the parser can be simpler. Further, I do not need to generate code,
but just analyze the \Pascal/ programs for the purpose of finding
those constructions where \Pascal/ differs from \CEE/ and need a
conversion.  If I discover such an instance, I change the tags of
the affected tokens, set the |link| field to connect related tokens,
or even construct a parse tree and link to it using the |up| field.  
In a next sweep over the token list in
section~\secref{writing}, these changed tokens will help us make the
appropriate transformations. But before I can do this, I need to
feed the parser with the proper tokens, but not in the order I find
them in the \WEB/ file. I have to ``tangle''\index{tangle+\.{tangle}} them 
to get them into \Pascal/ program order.  The function that is supposed 
to deliver the tangled tokens is called |pplex|.  In addition, the parser 
expects a function |pperror| to produce error messages\index{error message}.

@<external declarations@>=
extern int pplex(void);
extern void pperror(const char *message);
@
The function |pperror| is very simple:
@<functions@>=
void pperror(const char *message)
{ ERROR("Parse error line %d: %s",pplval->lineno,message);@+}
@



\subsection{Generating the sequence of \Pascal/ tokens}
Primarily, the \Pascal/\index{Pascal+\Pascal/} tokens\index{token} come from the
 unnamed modules\index{unnamed module} and then
from expanding module names\index{module name} and macros\index{macro}.
 Because modules and macros
may reference other modules and macros, I will need a stack\index{stack} to keep
track of where to continue expansion when I have reached the end of
the current expansion.

@<global variables@>=
#define MAX_PPSTACK 40
static struct {
 token *next,*end,*link; 
 int environment;
 token *parameter;
} pp_stack[MAX_PPSTACK];
static int pp_sp=MAX_PPSTACK;
@

In each stack\index{stack} entry, the pointers |next| and |end| point to 
the next and past the last
token of the current replacement text\index{replacement text}. 
In the case of modules, where
the replacement text for the module name might be defined in multiple
installments, the |link| pointer is used to point to the continuation
of the current replacement text.

In the |parameter| field, I store the pointer to the ``\.{(}'' token
preceding the parameter\index{parameter} of a 
parametrized macro\index{parametrized macro}; it provides us
conveniently with a pointer to the parameter text with its |next|
pointer and with its |link| pointer to the ``\.{)}'' token a pointer
directly to the |end| of the parameter text.  When I expand the
parameter text of a parametrized macro, I need the |environment|
variable. It points down the stack to the stack entry that contains
the macro call. This is the place where I will find the replacement
for a ``\.{\#}'' token that might occur in the parameter text of
nested parametrized macros.

The function |pp_push| will store the required information on the
stack.  Instead of passing the |next| and |end| pointer separately, I
pass a pointer to the ``\.{=}'' token from the macro or module
definition.  This token conveniently contains both pointers.  The
function then advances the stack pointer, initializes the new stack\index{stack}
entry, and returns the pointer to the first token of the replacement.
|pp_pop| will pop the stack and again return the pointer to the next
token.

@<functions@>=
token *pp_push(token *link, token *eq, int environment, token*parameter)
{ CHECK(pp_sp>0,"Pascal lexer stack overflow");
  pp_sp--;
  pp_stack[pp_sp].link=link;
  pp_stack[pp_sp].next=eq->next;
  pp_stack[pp_sp].end=eq->link;
  pp_stack[pp_sp].environment=environment;
  pp_stack[pp_sp].parameter=parameter;
  DBG(dbgexpand,"Push pplex[%d]: ", MAX_PPSTACK-pp_sp); DBGTOKS(dbgexpand,eq->next,eq->link);
  return pp_stack[pp_sp].next;
}

token *pp_pop(void)
{ CHECK(pp_sp<MAX_PPSTACK,"Pascal Lexer stack underflow");
  pp_sp++;
  DBG(dbgexpand,"Pop pplex[%d]: ", MAX_PPSTACK-pp_sp); 
  DBGTOKS(dbgexpand,pp_stack[pp_sp].next,pp_stack[pp_sp].end);
  return pp_stack[pp_sp].next;
}
@

 
The function |pplex| is what I write next.  In an "endless" loop, I
read the next token from the stack\index{stack} just described, popping and pushing the
stack as necessary. If I find a \Pascal/ token---it has
a |tag| value greater than |FIRST_PASCAL_TOKEN|---I can
return its |tag| immediately to the parser.  \WEB/ tokens receive
special treatment.  When I deliver a token to the parser, |pplval|, 
the semantic value\index{semantic value} of the token, is the token pointer itself.

@<functions@>=
int pplex(void)
{ token *t;
  int tag;
  t=pp_stack[pp_sp].next;
  while (true)
  {
    if (t==pp_stack[pp_sp].end)
    { @<process the end of a code segment@>@;
      continue;
    }
    tag = t->tag;
tag_known:
    if (tag>FIRST_PASCAL_TOKEN)
    {
      pp_stack[pp_sp].next=t->next; 
      goto found;
    }
    else
    { switch (tag)
      { @<special treatment for \WEB/ tokens@>@;
        default:
          ERROR("Unexpected token in pplex:" THE_TOKEN(t));
      }
    }
  }
found:@/
  DBG(dbgpascal,"pplex: %s->\t",tagname(tag));
  DBG(dbgpascal,THE_TOKEN(t));
  if (pascal!=NULL) fprintf(pascal,"%s ",token2string(t));
  pplval=t; 
  return tag;
}
@

\subsection{Simple cases for the parser}
Now let's look at all the \WEB/ tokens and 
what |pplex| should to do with them.
Quite a lot of them can be simply skipped:
@<special treatment for \WEB/ tokens@>=
      case NL:
      case INDENT:
         if (pascal!=NULL) fprintf(pascal,"%s",token2string(t));
      case METACOMMENT:
      case ATT:
      case ATEX:
      case ATQM:
      case ATPLUS:
      case ATSLASH:
      case ATBACKSLASH:
      case ATBAR:
      case ATHASH:
      case ATCOMMA:
      case ATINDEX:
      case ATINDEXTT:
      case ATINDEX9:
      case ATAND:
      case ATSEMICOLON:
      case ATLEFT:
      case ATRIGHT:@/
        t=t->next; 
        continue;
@
Comments\index{comment} can be skipped in a single step:
@<special treatment for \WEB/ tokens@>=
   case MLEFT:
   case PLEFT:
       t=t->link->next;
       continue;
@

The \Pascal/ end-of-file\index{end of file} token is passed to the 
parser which then should terminate.
@<special treatment for \WEB/ tokens@>=
   case PEOF:
        pp_stack[pp_sp].next=t->next; 
        goto found;
@


Simple is also the translation of octal\index{octal constant} 
or hexadecimal\index{hexadecimal constant} constants 
and single character strings: I translate them as \Pascal/ integers.
The token ``\.{@@\$}'', it's the string pool\index{string pool} 
checksum\index{string pool checksum}, is an integer as well.
@<special treatment for \WEB/ tokens@>=
      case ATDOLLAR: 
      case OCTAL:
      case HEX:
      case CHAR:
        pp_stack[pp_sp].next=t->next; 
        tag=PINTEGER;
        goto found;
@

The last simple case are identifiers\index{identifier}.  For identifiers, I find the
correct tag in the symbol table which is maintained by the parser.  At
this point, I give tokens that still have the |tag==ID| the default
tag |PID| and link tokens to the actual symbol structure, which might
be local\index{local symbol} or global\index{global symbol}.

@<special treatment for \WEB/ tokens@>=
      case ID: 
      { symbol *s=SYM(t);
        tag=s->tag;
        if (tag==ID) 
          tag=s->tag=PID;
        t->sym_ptr=s;
        t->tag=tag;
        goto tag_known;
      }
@

\subsection{The macros {\bf debug}, {\bf gubed}, and friends}
\TeX\ does some special trickery with the pseudo keywords \&{debug},
\&{gubed}, \&{init}, \&{tini}, \&{stat}, and \&{tats}. These identifiers are
used to generate different versions of \TeX\ for debugging\index{debugging},
initialization\index{initialization}, and gathering of statistics\index{statistics}.  
The natural way to do
this in \CEE/ is the use of |#ifdef|\dots|#endif|.  It is however not
possible in \CEE/ to define a macro like ``|#define debug|\quad|#ifdef
DEBUG|'' because the \CEE/ preprocessor\index{preprocessor} performs a simple one-pass
replacement on the source code.  So macros are expanded and the
expansion is not expanded a second time.

It would be possible to define a module \X123:\.{debug}\X\ that
\.{ctangle} expands to ``\hbox{|#ifdef DEBUG|}'' before the \CEE/
preprocessor sees it; the other possibility is to do the expansion
right now in \web2w/.  The latter possibility is simple, so I do it
here, but it affects the visual appearance of the converted code to
its disadvantage.

There are further possibilities too: I could redefine the macro as
``|#define debug|\quad|if (Debug) {|'' making it plain \CEE/
code. Then the compiler would insert or optimize away the code in
question depending on whether I say ``|#define Debug @, 1|'' or
``|#define Debug @, 0|''.  The \&{stat}\dots\&{tats} brackets are however
often used to enclose variable- or function-definitions where an ``|if
(Debug) {|'' would not work.

There are, however, also instances where the ``|#ifdef DEBUG|''
approach does not work. For instance, |debug|\dots|gubed| is used
inside the macro |succumb|. Fortunately there are only a few of these
instances and I deal with them in the patch file\index{patch file}.

As far as the parser is concerned, I just skip these tokens.
@<special treatment for \WEB/ tokens@>=
      case WDEBUG:
      case WGUBED:
      case WINIT:
      case WTINI:
      case WSTAT:
      case WTATS:
        t=t->next; 
        continue;
@

Later, I get them back into the \cweb/ file using the following code.
It takes care not to replace the special keywords when they are
enclosed between vertical bars and are only part of the descriptive text.
@<convert |t| from \WEB/ to \cweb/@>=
      case WDEBUG:
        if (t->previous->tag==BAR)
          wputs(t->text);
        else
        { if (column!=0) wput('\n');
          wputs("#ifdef @@!DEBUG\n");
        }
        t=t->next;@+break; 
      case WINIT:
        if (t->previous->tag==BAR)
          wputs(t->text);
        else
        { if (column!=0) wput('\n');
          wputs("#ifdef @@!INIT\n");
        }
        t=t->next;@+break; 
      case WSTAT:
        if (t->previous->tag==BAR)
          wputs(t->text);
        else
        {
          if (column!=0) wput('\n');
          wputs("#ifdef @@!STAT\n");
        }
        t=t->next;@+break; 
      case WGUBED:
      case WTINI:
      case WTATS:
        if (t->previous->tag==BAR)
          wputs(t->text);
        else
        { if (column!=0) wput('\n');
          wputs("#endif\n");
        }
        t=t->next;
        if (t->tag==ATPLUS||t->tag==ATSLASH) t=t->next;
        if (t->tag==NL) t=t->next;
        break; 
@
I ignore ``\.{@@+}'' tokens that precede \&{debug} and friends, because
their replacement should always start on the beginning of a line.
@<convert |t| from \WEB/ to \cweb/@>=
case ATPLUS:
  t=t->next;
  if (!following_directive(t))
    wputs("@@+"); 
  else
    DBG(dbgcweb,"Eliminating @@+ in line %d\n",t->lineno);
  @+break; 
@

Because they also occur in format definitions, I mark the identifiers as 
obsolete\index{obsolete}.
@<finalize token list@>=
SYM_PTR("debug")->obsolete=1;
SYM_PTR("gubed")->obsolete=1;
SYM_PTR("stat")->obsolete=1;
SYM_PTR("tats")->obsolete=1;
SYM_PTR("init")->obsolete=1;
SYM_PTR("tini")->obsolete=1;
@

\subsection{Parsing numerical constants}

I do not expand numerical macros\index{numerical macro},
 instead I expand the \Pascal/
grammar to handle |NMACRO| tokens. This is also the right place to
switch numeric macros from symbol numbers to symbol pointers. For each
use of the token, I increment its |value| field in the symbol
table. This will allow us later to eliminate definitions that are no
longer used. The handling of \WEB/ strings is similar.

@<special treatment for \WEB/ tokens@>=
      case NMACRO: 
        t->sym_ptr=SYM(t);
        if (t->sym_ptr->eq->next->tag==STRING)
        {token *s= t->sym_ptr->eq->next;
         s->sym_ptr=SYM(s);
         s->sym_ptr->value++;
         DBG(dbgstring,"Using numeric macro %s (%d) in line %d\n",
             s->sym_ptr->name,s->sym_ptr->value,t->lineno);   
        } 
        pp_stack[pp_sp].next=t->next; 
        goto found;
      case STRING:
        t->sym_ptr=SYM(t);
        t->sym_ptr->value++;
        DBG(dbgstring,"Using string %s (%d) in line %d\n",
            t->sym_ptr->name,t->sym_ptr->value,t->lineno);
        pp_stack[pp_sp].next=t->next; 
        goto found;     
@


Occasionally, I will need the ability to determine the value of a token 
that the \Pascal/ parser considers an integer. 
The function  |getval| will return this value.
@<external declarations@>=
extern int getval(token *t);
@
@<functions@>=
int getval(token *t)
{  int n=0;
  switch (t->tag)
  { case ATDOLLAR: n=0;@+ break;
    case PINTEGER: n =strtol(t->text,NULL,10);@+ break;
    case NMACRO:
       t = SYM(t)->eq;
      CHECK(t->tag==EQEQ, "= expected in numeric macro in line %d",t->lineno);
      t = t->next; 
      if (t->tag==PMINUS) {t=t->next; n=-getval(t);}
      else n=getval(t);
      while (true)
      { if (t->next->tag==PPLUS) 
        { t=t->next->next; n=n+getval(t); }
        else if (t->next->tag==PMINUS) 
        { t=t->next->next; n=n-getval(t); }
        else break;
      }
      break;
    case OCTAL: n=strtol(t->text+2,NULL,8);@+ break;
    case HEX: n=strtol(t->text+2,NULL,16);@+ break;
    case CHAR:  n=(int)(unsigned char)t->text[1];@+ break;
    case PCONSTID: n=SYM(t)->value;@+ break;
    default: ERROR("Unable to get value for tag %s in line %d",TAG(t),t->lineno);
  }
  return n;
}
@

Notice that I assume that tokens which are tagged as constant
identifiers are expected to have a value stored in the symbol table. We
write this value using the macro |SETVAL|.

@<external declarations@>=
#define SETVAL(t,val) @[SYM(t)->value=val@]
@

\subsection{Expanding module names and macros}
\index{macro expansion}\index{module name expansion}
Now let's turn to the more complicated operations, for example the
expansion of module names. I know that I hit a module name\index{module name} 
when I encounter an ``\.{@@<}'' token. At this point, I advance
the current token pointer past the end of the module name, look up
the module in the module table, and push its first code segment.

@<special treatment for \WEB/ tokens@>=
      case ATLESS:
        { token *eq, *atgreater;
          atgreater = find_module(t)->atgreater;
          CHECK(atgreater!=NULL,"Undefined module @@<%s ...@@> in line %d",
                token2string(t->next),t->lineno);
          DBG(dbgexpand,"Expanding module @@<%s@@> in line %d\n",
                token2string(t->next),t->lineno);
          eq=atgreater->next;
          pp_stack[pp_sp].next=t->link->next;
          t=pp_push(atgreater->link,eq,0,NULL);
          continue;
        }
@

When I reach the end of the code segment, I can check the link field
to find its continuation.

@<process the end of a code segment@>=
      token *link=pp_stack[pp_sp].link;
      if (link!=NULL)
      { token *eq;
        eq=link->next;
        link=link->link;
        pp_pop();
        t=pp_push(link,eq,0,NULL);
      }
      else
        t=pp_pop();
@     

Slightly simpler are ordinary macros\index{ordinary macro}.
@<special treatment for \WEB/ tokens@>=
      case OMACRO:
      { token *eq;
        eq=SYM(t)->eq;
        pp_stack[pp_sp].next=t->next;
        DBG(dbgexpand,"Expanding ordinary macro %s in line %d\n",token2string(t),t->lineno);
        t=pp_push(NULL,eq,0,NULL);
        continue;
      }
@

There are a few macros, that are special\index{special macro}; I do not want to expand
them but instead generate special tokens in \.{web.l}\index{web.l+\.{web.l}} and expand the
\Pascal/ grammar to cope with them directly. It remains, however, to
mark them as obsolete\index{obsolete} to remove the macro definitions form the \cweb/
output.

@<finalize token list@>=
SYM_PTR("return")->obsolete=1;
SYM_PTR("endcases")->obsolete=1;
SYM_PTR("othercases")->obsolete=1;
SYM_PTR("mtype")->obsolete=1;
SYM_PTR("final_end")->obsolete=1;
@

\subsection{Expanding macros with parameters}

Now I come to the most complex case: parametrized macros\index{parametrized macro}.  
When the \WEB/ invokes a parametrized macro as part of the \Pascal/ code, the macro
identifier is followed by a ``\.{(}'' token, the parameter tokens, and
a matching ``\.{)}'' token. The \WEB/ scanner has also set the |link|
field of the ``\.{(}'' token to point to the ``\.{)}'' token. The
replacement text for the macro is found in the same way as for
ordinary macros above. The replacement text, however, may now contain
a ``\.{\#}'' token, asking for another replacement by the parameter
tokens. The whole process can be nested because the parameter tokens
may again contain a ``\.{\#}'' token.  Hence, I need to store the
parameter tokens on the stack as well as a reference to the enclosing
environment\index{environment}. I store a reference to the ``\.{(}'' 
token on the stack\index{stack},
because from it, I can get the first token and the last token of the
replacement text\index{replacement text}.

I can write now the code to expand a parametrized macro.  To cope
with cases like \.{font(x)}, \.{font == type} and
\.{type(\#)=mem[\#]}, I call |pplex| to find the opening parenthesis
before pushing the macro expansion and its parameter.
(Note: I expand \.{font} as an ordinary macro; then find \.{type}
which is a parametrized macro and end up in the ``|case PMACRO:|''
below. The ``\.{(}'' token is not the next token after \.{type}
because I am still expanding \.{font}.  Calling |pplex| will reach
the end of the expansion, pop the stack, and then find the ``\.{(}''
token.)

@<special treatment for \WEB/ tokens@>=
      case PMACRO:
      { token *open,*eq;
        int popen;
        DBG(dbgexpand,"Expanding parameter macro %s in line %d\n",
                       token2string(t),t->lineno);
        eq=SYM(t)->eq;
        pp_stack[pp_sp].next=t->next;
        popen=pplex();
        CHECK(popen==POPEN,"expected ( after macro with parameter");
        open=pplval;
        pp_stack[pp_sp].next=open->link->next;
        @<count macro parameters@>@;
        t=pp_push(NULL,eq,pp_sp,open);
        continue;
      }
@


While traversing the replacement text, I may find a ``\.{\#}'' token.
In this case, I find on the |pp_stack| the pointer to the |parameter| and,
in case the |parameter| contains again a  ``\.{\#}'' token, its |environment|.

@<special treatment for \WEB/ tokens@>=
      case HASH:
      { token *parameter=pp_stack[pp_sp].parameter;
        int environment=pp_stack[pp_sp].environment;
        pp_stack[pp_sp].next=t->next;
        t=pp_push(NULL,parameter,pp_stack[environment].environment,
                  pp_stack[environment].parameter);
        continue;
      }
@


\subsection{The function |ppparse|}
The function |ppparse|  is implemented in the 
file \.{pascal.y}\index{pascal.y+\.{pascal.y}} 
which must be processed by \.{bison}\index{bison+\.{bison}} 
(the free version of \.{yacc}\index{yacc+\.{yacc}})
to produce \.{pascal.tab.c}\index{pascal tab c+\.{pascal.tab.c}} 
and \.{pascal.tab.h}\index{pascal tab h+\.{pascal.tab.h}}. 
The former contains the definition of the parser function |ppparse|
which I call after initializing the |pp_stack| in preparation 
for the first call to |pplex|.

@<parse \Pascal/@>=
 program=first_token->link;
 pp_push(program->link, program->next, 0, NULL);
 ppparse();
@


The function |ppparse| occasionally builds a parse tree\index{parse tree}
 out of internal nodes\index{internal node} for the \Pascal/ program;
this parse tree is then used to accomplish the transformations 
needed to turn the \Pascal/ code into \CEE/ code.

@<internal node@>=
struct {
  int value;
}
@


Internal nodes are constructed using the function |join|.
@<external declarations@>=
token *join(int tag, token *left, token *right, int value);
@

@<functions@>=
token *join(int tag, token *left, token *right, int value)
{ token *n=new_token(tag);
  n->previous=left;
  n->next=right;
  n->value = value;
  DBG(dbgjoin,"tree: "); DBGTREE(dbgjoin,n);
  return n;
}
@


\section{Writing the \cweb/}
\label{writing}%

\subsection{\cweb/ output routines}

\index{output routine}The basic function to write the \cweb/ file is the function |wprint|,
along with its simpler cousins |wput| and |wputs|, and the more
specialized member of the family |wputi|.  While most of the work of
converting the visual representation of tokens to \cweb/ is left to
the function |token2string|, the basic functions take care of
inserting spaces\index{space} after a comma\index{comma} and to prevent adjacent tokens from
running together.

The variables |alfanum| and |comma| indicate that the last character
written was alphanumeric or a comma; the variable |column| counts the
characters on the current line.

@<global variables@>=
static int alfanum=0;
static int comma=0;
static int column=0;
@

@<functions@>=
static void wput(char c)
{ fputc(c,w);
  alfanum = isalnum(c);
  comma = c==',';
  if (c=='\n') column=0;@+ else column++;
}

static void wputs(char *str)
{ while (*str!=0) wput(*str++);
}

static void wputi(int i)
{ if (alfanum || comma) fputc(' ',w),column++;
  column+=fprintf(w,"%d",i);
  alfanum=true;
  comma=false;
}

static void wprint(char *str)
{ if ((alfanum || comma) && isalnum(str[0])) fputc(' ',w);
  wputs(str);
}
@


Most tokens have their string representation stored in the |info.text| field,
so I sketch the function |token2string| here and 
describe the details of conversion later.
@<internal declarations@>=
static char *token2string(token *t);
@

@<functions@>=
static char *token2string(token *t)
{ CHECK(t!=NULL,"Unable to convert NULL token to a string");
  switch (t->tag)
  { default: 
      if (t->text!=NULL)
          return t->text;
      else
          return "";
    @<convert token |t| to a string@>@;
   }
}
@


\subsection{Traversing the \WEB/}

After these preparations, I am ready to traverse the list of tokens
 again; this time not in \Pascal/ order but in the order given
 in the \WEB/ file because I want the \cweb/ file to be as close as
 possible to the original \WEB/ file.

The main loop can be performed by the function |wprint_to|. It
traverses the token list until a given |last_token| is found. Using
this function I can generate the whole \cweb/ file simply by starting
with the |first_token| and terminating with the |last_token|.

@<generate \cweb/ output@>= 
  wprint_to(first_token,last_token);
@

The function |wprint_to| delegates all the work to |wtoken| which in
turn uses |wprint| and |token2string| after converting the tokens from
\WEB/ to \cweb/ as necessary.  Besides writing out the token, |wtoken|
also advances past the written token and returns a pointer to the
token immediately following it.  The function |wtoken| will be called
recursively. For debugging\index{debugging} purposes, it maintains a counter of its
nesting |level|.

@<functions@>=
static token *wtoken(token *t)
{ static int level=0;
  level++;
  DBG(dbgcweb,"wtoken[%d] %s (%s) line %d\n",level,TAG(t),token2string(t),t->lineno);
  switch(t->tag) 
  { @<convert |t| from \WEB/ to \cweb/@>@;
    default: wprint(token2string(t));@+ t=t->next;@+ break;
  }
  level--;
  return t;
}
@

|wprint_to| is complemented by the function |wskip_to| which
 suppresses the printing of tokens.

@<internal declarations@>=
static token *wprint_to(token *t, token *end);
static token *wskip_to(token *t, token *end);
@

@<functions@>=
static token *wprint_to(token *t, token *end)
{ while(t!=end)
    t=wtoken(t);
  return t;
}

static token *wskip_to(token *t, token *end)
{ while(t!=end)
    t=t->next;
  return t;
}
@

\subsection{Simple cases of conversion}

Quite a few tokens serve a syntactical purpose in \Pascal/ but are
simply ignored when generating \CEE/ code.

@<convert |t| from \WEB/ to \cweb/@>=
 case CIGNORE: case PPROGRAM: case PLABEL: case PCONST:  case PVAR:
case PPACKED: case POF: case ATQM: case ATBACKSLASH:@/
t=t->next;@+ break;
@
The parser will change a |tag| to |CIGNORE| by using the |IGN| macro.
@<external declarations@>=
#define IGN(t) @[((t)->tag=CIGNORE)@]
@

\TeX\ uses the control sequence ``\.{@@t\\2@@>}'' after ``{\bf
forward};''.  It needs to be removed together with the forward
declaration, because it does confuse \cweb/.

@<convert |t| from \WEB/ to \cweb/@>=
case PFORWARD:
     if (t->next->tag==PSEMICOLON) wput(';'),t=t->next->next;
     else wprint("forward"),t=t->next;
     if (t->tag==ATT) t=t->next;
      break;
@


The meta-comments\index{meta-comment} of \WEB/ are translated to 
plain \CEE/ comments\index{comment} if
they are just a single line and to \.{\#if 0}\dots\.{\#endif}
otherwise.

@<convert |t| from \WEB/ to \cweb/@>=
case METACOMMENT:  
  { char *c;
    wputs("/*");
    for (c=t->text+2; c[0]!='@@' || c[1]!='}'; c++) wput(*c);
    wputs("*/");
    t=t->next;
  }
  break;
case ATLEFT:
  if (column!=0) wput('\n');
  wputs("#if 0\n");
  t=t->next;@+break;
case ATRIGHT:
  if (column!=0) wput('\n');
  wputs("#endif\n");
  t=t->next;@+break;
@

Some tokens just need a slight adjustment of their textual
representation.  In other cases, the parser changes the tag of a
token, for example to |PSEMICOLON|, without changing the textual
representation of that token. All these tokens are listed below.

@<convert |t| from \WEB/ to \cweb/@>=
case PLEFT: case MLEFT: wputs(" /*");@+t=t->next;@+ break;
case RIGHT: wputs("*/ ");@+t=t->next;@+ break;
case PSEMICOLON:  wputs(";");@+t=t->next;@+ break;
case PCOMMA:  wputs(",");@+t=t->next;@+ break;
case PMOD: wput('%');@+t=t->next;@+ break;
case PDIV: wput('/');@+t=t->next;@+ break;
case PNIL: wprint("NULL");@+t=t->next;@+ break;
case POR: wputs("||");@+t=t->next;@+ break;
case PAND: wputs("&&");@+t=t->next;@+ break;
case PNOT: wputs("!");@+t=t->next;@+ break;
case PIF: wprint("if (");@+t=t->next;@+ break;
case PTHEN: wputs(") ");@+t=t->next;@+ break;
case PASSIGN: wput('=');@+t=t->next;@+ break;
case PNOTEQ:  wputs("!=");@+t=t->next;@+ break;
case PEQ:  wputs("==");@+t=t->next;@+ break;
case EQEQ: wput('\t');@+t=t->next;@+ break;
case OCTAL: wprint("0");@+ wputs(t->text+2);@+t=t->next;@+ break;
case HEX: wprint("0x");@+ wputs(t->text+2);@+t=t->next;@+ break;
case PTYPEINT: wprint("int");@+t=t->next;@+ break;
case PTYPEREAL: wprint("double");@+t=t->next;@+ break;
case PTYPEBOOL: wprint("bool");@+t=t->next;@+ break;
case PTYPECHAR: wprint("unsigned char");@+t=t->next;@+ break;
@

I convert ``\&{begin}'' to ``\.{\LB}''. In most cases, I want an ``\.{@@+}'' to
follow; except of course if a preprocessor directive is following.

@<convert |t| from \WEB/ to \cweb/@>=
case PBEGIN:  wput('{'),t=t->next;
  if (!following_directive(t)) wputs("@@+"); 
  break;
@
@<internal declarations@>=
static bool following_directive(token *t);
@
@<functions@>=
static bool following_directive(token *t)
{ while (true)
    if (WDEBUG<=t->tag && t->tag<=WGUBED) return true;
    else if (t->tag==ATPLUS || t->tag==ATEX || t->tag==ATSEMICOLON || 
             t->tag==NL || t->tag==INDENT) t=t->next;
    else return false;
}
@

After the conversion, the \Pascal/ token ``\.{..}'' will
still occur in the file as part of code between vertical bars.
To make it print nicely in the \TeX\ output, 
it is converted to an identifier, ``\.{dotdot}''\index{dotdot+\.{dotdot}}, that is
used nowhere else. 
@<convert |t| from \WEB/ to \cweb/@>=
case PDOTDOT:  wprint("dotdot");@+t=t->next;@+ break;
@
Using the patch file, I instruct \.{cweave} to treat this identifier in a special way
and print it like ``${}\mathrel{.\,.}{}$''.

\subsection{\Pascal/ division}

In some cases build-in functions\index{build-in function} 
of \Pascal/ can be replaced by a
suitably defined macro in \CEE/. The most simple solution was to add
these definitions to the
module ``$\langle\,${\eightrm Compiler directives}$\,\rangle$'' using 
the patch file\index{patch file}. 
Using Macros instead of inline replacement has the advantage
that the visual appearance of the original code remains undisturbed.
A not so simple case is the \Pascal/ division\index{division}.

The \Pascal/ language has two different division\index{division} operators: ``{\bf
div}'' divides two integers and gives an integer result; it can be
replaced by ``|/|'' in the \CEE/ language. The \Pascal/ operator
``|/|'' divides |integer| and \&{real} values and converts both operands
to type \&{real} before doing so; replacing it simply by the \CEE/
operator ``|/|'' will give different results if both operands are
\&{integer} values because in this case \CEE/ will do an integer
division truncating the result. So expressions of the form ``|X / Y|''
should be replaced by ``|X / (double)(Y)|'' to force a 
floating point division\index{floating point division} in \CEE/

% these are the instances of real division in \.{tex.web}:
%Pascal real division / in line 13032
%if total_stretch[o]<>0 then glue_set(r):=unfloat(x/total_stretch[o])
%
%Pascal real division / in line 13091
%if total_shrink[o]<>0 then glue_set(r):=unfloat((-x)/total_shrink[o])
%
%Pascal real division / in line 13223
%if total_stretch[o]<>0 then glue_set(r):=unfloat(x/total_stretch[o])
%
%Pascal real division / in line 13262
%if total_shrink[o]<>0 then glue_set(r):=unfloat((-x)/total_shrink[o])
%
%Pascal real division / in line 15929
%  else glue_set(r):=unfloat((t-width(r))/glue_stretch(r));
%
%Pascal real division / in line 15936
%  else glue_set(r):=unfloat((width(r)-t)/glue_shrink(r));
%
%Pascal real division / in line 15950
%  else glue_set(r):=unfloat((t-height(r))/glue_stretch(r));
%
%Pascal real division / in line 15957
%  else glue_set(r):=unfloat((height(r)-t)/glue_shrink(r));
%
%Pascal real division / in line 21484
%  begin x:=x_height(f); s:=slant(f)/float_constant(65536);
%
%Pascal real division / in line 21513
%begin t:=slant(f)/float_constant(65536);
%
%Pascal real division / in line 21520
%delta:=round((w-a)/float_constant(2)+h*t-x*s);

Fortunately, all expressions in the denominator have the form
|total_stretch[o]|, |total_shrink[o]|, |glue_stretch(r)|,
|glue_shrink(r)|, or |float_constant(n)|. So no parentheses around
the denominator are required and inserting a simple |(double)| after
the |/| is sufficient. Further, the macro |float_constant| is already
a cast to \&{double}, so I can check for the corresponding identifier
and omit the extra cast.

@<global variables@>=
static int float_constant_no;
@

@<initialize token list@>=
float_constant_no=predefine("float_constant",ID,0);
@

@<convert |t| from \WEB/ to \cweb/@>=
case PSLASH:
     wput('/'); 
     if (t->next->tag!=PMACRO || t->next->sym_no!=float_constant_no) 
     { wprint("(double)"); 
       DBG(dbgslash,"Inserting (double) after / in line %d\n",t->lineno);
     }     
     t=t->next;@+break;
@


\subsection{Identifiers}

Before I can look at the identifiers\index{identifier}, I have to consider the
``\.{@@!}'' token which can precede an identifier and will cause the
identifiers to appear underlined in the index\index{index}. The ``\.{@@!}'' token
needs a special treatment.  When I convert \Pascal/ to \CEE/, I have
to rearrange the order of tokens and while I am doing so, a
``\.{@@!}'' token that precedes an identifier should stick to the
identifier and move with it. I accomplish this by suppressing the
output of the ``\.{@@!}'' token if it is followed by an identifier,
and insert it again when I output the identifier itself.

@<convert |t| from \WEB/ to \cweb/@>=
case ATEX: 
t=t->next; 
if (t->tag!=ID && t->tag!=PID && t->tag!=PFUNCID &&@/
    t->tag!=PDEFVARID  && t->tag!=PDEFPARAMID && t->tag!=PDEFTYPEID &&@/
    t->tag!=OMACRO&& t->tag!=PMACRO && t->tag!=NMACRO &&@/
    t->tag!=CINTDEF && t->tag!=CSTRDEF && t->tag!=PDIV &&@/
    t->tag!=WDEBUG && t->tag!=WINIT && t->tag!=WSTAT) 
{  wputs("@@!");
   DBG(dbgbasic,"Tag after @@! is %s in line %d\n",tagname(t->tag), t->lineno);
}
break;
@

Identifier tokens are converted by using their name.  I use a simple
function to do the name lookup and take care of adding the ``\.{@@!}''
token if necessary.

@<internal declarations@>=
static void wid(token *t);
@
@<functions@>=
void wid(token *t)
{ if (alfanum || comma) wput(' ');
  if (t->previous->tag==ATEX) wputs("@@!");
  wputs(SYM(t)->name); 
}
@
I use this function like this:
@<convert |t| from \WEB/ to \cweb/@>=
case ID:
case PID:
case OMACRO:
case PMACRO:
case NMACRO:
 wid(t);@+t=t->next;@+ break;
@

Some identifiers that \TeX\ uses are reserved words\index{reserved words} 
in \CEE/ or loose their special meaning.  So after I finish scanning the \WEB/, I
change the names of these identifiers.%
\index{xclause+\\{xclause}}%
\index{switch+\&{switch}}%
\index{continue+\&{continue}}%
\index{exit+\\{exit}}%
\index{free+\\{free}}%
\index{int+\&{int}}%
\index{remainder+\\{remainder}}%


@<finalize token list@>=
SYM_PTR("switch")->name="get_cur_chr";
SYM_PTR("continue")->name="resume";
SYM_PTR("int")->name="i";
SYM_PTR("register")->name="internal_register";
SYM_PTR("time")->name="time_of_day";
@#
SYM_PTR("exit")->name="end";
SYM_PTR("free")->name="is_free";
SYM_PTR("write")->name="pascal_write";
SYM_PTR("read")->name="pascal_read";
SYM_PTR("close")->name="pascal_close";
@#
SYM_PTR("xclause")->name="else";
SYM_PTR("remainder")->name="rem";
@

A special case is the the field identifier |int|. It can not be used
in \CEE/ because it is a very common (if not the most common) reserved
word.  I replace it with |i| which does not conflict with the
variable |i| because field names have their own name-space in \CEE/.



\subsection{Strings}

Pascal strings\index{string} need some more work. I translate them to characters or
\CEE/ strings.  Note that the parser occasionally converts |STRING| or
|CHAR| tokens to |PSTRING| tokens.

@<convert |t| from \WEB/ to \cweb/@>=
case PCHAR:
  { char *str=t->text;
     wput(' ');
     wput('\''),str++;
     if (str[0]=='\'') wputs("\\'");
     else if (str[0]=='\\') wputs("\\\\");
     else if (str[0]=='@@') wputs("@@@@");
     else wput(str[0]);
     wput('\'');
     wput(' ');
   }
   t=t->next;@+
     break; 
case PSTRING:
  { char *str=t->text;
     wput('"'),str++;
     while (*str!=0)
     { if (str[0]=='\'' && str[1]=='\'') wput('\''),str++;
       else if (str[0]=='"' && str[1]=='"') wputs("\\\""),str++;
       else if (str[0]=='\\') wputs("\\\\");
       else if (str[0]=='\'' && str[1]==0) wput('"');
       else if (str[0]=='"' && str[1]==0) wput('"');
       else if (str[0]=='"') wput('\\'), wput('"');
       else wput(str[0]);
       str++;
     }
  }
  t=t->next;@+
  break;
@

\subsection{Module names}

I have removed newlines and extra spaces from module names\index{module name}; 
now I have to insert newlines\index{newline} if the module names are too long.

@<convert |t| from \WEB/ to \cweb/@>=
case ATLESS:
     wputs("@@<");
     t=t->next;
     CHECK(t->tag==TEXT,"Module name expected instead of %s in line %d",  
          token2string(t), t->lineno);
     { char *str=t->text;
       do 
         if (str[0]=='@@' && str[1]==',') 
            str=str+2; /*control codes are forbidden in section names*/
         else if (column>80 && isspace(*str)) wput('\n'),str++; 
         else wput(*str++); 
       while (*str!=0);
     }
     t=t->next;
     if (t->tag==ELIPSIS) wputs("..."), t=t->next;
     CHECK(t->tag==ATGREATER,"@@> expected instead of %s in line %d", 
          token2string(t), t->lineno);
     wputs("@@>");
     t=t->next;
     if (t->tag==ATSLASH) wputs("@@;"),t=t->next;
     else if (t->tag==PELSE || 
         (t->tag==NL)) wputs("@@;"); 
     break;
@

Note that I replace an ``\.{@@/}'' after the module name by an
``\.{@@;}'' Because in most places this is enough to cause the
requested new line and causes the correct indentation.


\subsection{Replacing the \WEB/ string pool file}
\label{stringpool}%
\WEB/ strings need more work because I have to replace the \WEB/
string pool\index{string pool} file.  Before I start, I finish two easy cases. Single
character strings are replaced by \CEE/ character constants\index{character constant}. The
string pool checksum\index{string pool checksum} is simply replaced by zero, 
because I will not use it.

@<convert |t| from \WEB/ to \cweb/@>=
case CHAR: 
   { char c=t->text[1];
     wput('\''); 
     if (c=='\'' || c=='\\') wput('\\');
     wput(c);
     wput('\'');
     t=t->next;@+ break;    
   }
case ATDOLLAR: wputs("0");@+t=t->next;@+ break;
@     


Of course it would be possible to generate suitable initializations
for the variables |str_pool| and |str_start| and replace each string
with its corresponding index in the |str_start| array. The goal of my
project is, however, to generate readable source code and
replacing for example |"Maybe you should try asking a human?"| by
|283| is not very readable. Instead, I will create for each string a
module, in the above example named \PB{$\X1234:\PB{\.{"Maybe you
should try asking} \.{a} \.{human?"}}\X$}, that will expand to the
correct number, here |283|.

@<convert |t| from \WEB/ to \cweb/@>=
case STRING: 
  { @<convert some strings to macro names@>@;
    else
    { wputs("@@[@@<|");@+wputs(SYM(t)->name);@+wputs("|@@>@@]");@+ }
    t=t->next;@+ break; 
  }
@

There are some exceptions to the general rule, for example for the
empty string\index{empty string}.  
I define an appropriate constant |empty_string| and
use it instead of a module (which would have a rather unsightly
name). More instances of this scheme follow below.

@<convert some strings to macro names@>=
    if (t->sym_no==empty_string_no)
      wprint("empty_string");
@


To define all the other new modules, I add some code at the very end
of the output file.

@<generate \cweb/ output@>=
wputs("\n@@ Appendix: Replacement of the string pool file.\n");
{ token *str_k;
  int i, k;
  @<generate definitions for the first 256 strings@>@;
  for (str_k=first_string;str_k != NULL;str_k=str_k->link)
    @<generate definition for string |k|@>@;
  @<generate string pool initializations@>@;
}
@

The first 256 strings in the string pool\index{string pool} 
are the printable replacements
for the single character strings for all character codes from 0 to 255.

@<generate definitions for the first 256 strings@>=
wputs("@@d str_0_255 ");
for (k=0;k<256;k++)
{ if ((k&0xF)==0) wputs("\t\"");
  if ((@<Character |k| cannot be printed@>)) 
  { wputs("^^");
    if (k<0100 && k+0100=='@@') wputs("@@@@");
    else if (k<0100 && k+0100=='\\') wputs("\\\\");
    else if (k < 0100) wput(k+0100);
    else if (k<0200 && k-0100=='@@') wputs("@@@@");
    else if (k < 0200) wput(k-0100);
#define HEXDIGIT(x) ((x)<10?((x)+'0'):((x)-10+'a'))
    else wput(HEXDIGIT(k/16)),wput(HEXDIGIT(k%16));
  } 
  else if (k=='"') wputs("\\\"");
  else if (k=='\\') wputs("\\\\");
  else if (k=='@@') wputs("@@@@");
  else wput(k);
  if ((k&0xF)==0xF) wputs("\"@@/\n");
}
wputs("@@d str_start_0_255");
i=0;
for (k=0;k<256;k++)
{ if ((k&0xF)==0) wput('\t');
  wputi(i);
  if ((@<Character |k| cannot be printed@>)) 
  { if (k < 0100) i=i+3;
    else if (k < 0200) i=i+3;
    else i=i+4;
  } 
  else i=i+1;
  wput(',');
  if ((k&0xF)==0xF) wputs("@@/\n");
}
@

This condition is taken from \.{tex.web}:
@<Character |k| cannot be printed@>=
  (k < ' ')||(k > '~')
@


@<generate definition for string |k|@>=
{ symbol *s=SYM(str_k);
  if (s->value>0)
  { s->value=0;
    wputs("@@ \n");
    wputs("@@d str_"),wputi(k),wput(' '),wputs(s->name),wput('\n');
    @<generate macros for some strings@>@; 
    else
      wputs("@@<|"),wputs(s->name),wputs("|@@>=@@+"),wputi(k); 
    wput('\n');
    k++;
  }
}
@

There are, however, a few more exceptions to the general procedure.
Many of the \WEB/ strings are used simply for printing with
the procedure |print|. There is actually no need to enter all these
strings into the string pool\index{string pool}. 
Instead I add a procedure |print_str|
that prints plain zero terminated \CEE/ strings. 

Now I can convert the |STRING| argument of the procedure |print| to 
a |PSTRING| by calling the following procedures in the parser.

@<external declarations@>=
extern void pstring_args(token *id, token *arg);
extern void pstring_assign(token *id, token *val);
@

The function |pstring_args| is called with the |id| of the
function. The |arg| token points to the argument list.  A few other
functions just pass their arguments to |print|. By replacing their
call to |print| by a call to |print_str|, I can convert those
arguments as well. For example the function |overflow| expects two
arguments of which the first one is the |STRING| token. The other
functions are: |prompt_file_name|, |print_nl|, and |fatal_error|.

If a |STRING| token is found, its |value| in the symbol table is
decremented.  This |value| counts the number of occurrences; if it
goes down to zero, the |STRING| token is no longer used and no module
needs to be generated for it.

@<functions@>=
static int convert_arg( token *arg)
{ if (arg->tag==STRING)
  { symbol *s=symbol_table[arg->sym_no];
    s->value--;
    DBG(dbgstring,"Eliminating string argument %s (%d) in line %d\n",s->name,s->value,arg->lineno);
    arg->tag=PSTRING;
    return 1;
  }
  else if (arg->tag==CHAR) 
  { arg->tag=PSTRING;
    return 1;
  }
  return 0;
}
void pstring_args(token *id, token *arg)
{ if (arg->tag==PCOLON || arg->tag==CREFID) return;
  if  (id->sym_no==overflow_no || id->sym_no==prompt_file_name_no )
  { CHECK(arg->tag==PCOMMA,"function should have two arguments in line %d",id->lineno);
    convert_arg(arg->previous);
  } 
  else  if (id->sym_no==print_no)
  { if (convert_arg(arg))  id->sym_no=print_str_no;
  }
  else if (  id->sym_no==print_str_no
          || id->sym_no==print_nl_no  
          || id->sym_no==fatal_error_no
          )
    convert_arg(arg);
}
@

The function |pstring_assign| is used when |STRING| tokens are
assigned to the variable |help_line|, which I redefine as a
variable containing character pointers instead of string numbers.

@<functions@>=
void pstring_assign(token *id, token *val)
{ if (id->tag==PID && ( id->sym_no==help_line_no || id->sym_no==max_reg_help_line_no))
  { SYM(val)->value--;
    DBG(dbgstring,"Eliminating string assignment %s (%d) in line %d\n",
        SYM(val)->name,SYM(val)->value,val->lineno);
    val->tag=PSTRING;
  }
  else
    DBG(dbgstring,"No string assignment %s (%d) in line %d\n",
        SYM(val)->name,SYM(val)->value,val->lineno);
}
@
Note: |max_reg_help_line| is used in $\epsilon$-\TeX\index{e-TeX+$\epsilon$-\TeX}.

I have used these variables:
@<global variables@>=
int print_no, print_str_no, overflow_no, print_err_no, 
print_nl_no, fatal_error_no, prompt_file_name_no, 
help_line_no, empty_string_no, max_reg_help_line_no;
@
The variables are initialized like this:

@<functions@>=
int predefine(char *name, int tag, int value)
{ int sym_no= get_sym_no(name);
  symbol *s= symbol_table[sym_no]; 
  s->tag=tag; 
  s->value=value; 
  return sym_no;
}
@

@<initialize token list@>=
print_str_no=predefine("print_str",PPROCID,0); 
empty_string_no=predefine("\"\"",PID,1); 
help_line_no=predefine("help_line",ID,0); 
print_no=predefine("print",PPROCID,0);
overflow_no=predefine("overflow",PPROCID,0);
print_err_no=predefine("print_err",PPROCID,0);
print_nl_no=predefine("print_nl",PPROCID,0);
fatal_error_no=predefine("fatal_error",PPROCID,0);
prompt_file_name_no=predefine("prompt_file_name",PPROCID,0);
max_reg_help_line_no=predefine("max_reg_help_line",ID,0); 
@

There are still a few remaining problems.
First, |STRING| tokens occur occasionally as part of a 
macro replacement text\index{replacement text}.
There I can not substitute a module name\index{module name} for them.
By having introduced the function |print_str|, some
of them are now plain \CEE/ strings: 
|"pool size"| in line 1184 (|overflow|),
|"! "| in line 1750 (|print_nl|)
|"save size"| in line 5910 (|overflow|),
|"input stack size"| in line 6940 (|overflow|),
|"Font "| in line 10927 (|print_err|),
|" at "| in line 10930 (|print|),
|"pt"| in line 10930 (|print|),
|" scaled "| in line 10933 (|print|), and
|" plus "| in line 19250  (|print|).

Most other macros are numeric macros\index{numeric macro},
 and I just generate these instead of module names:
|"TeXinputs:"| in line 9992 (|TEX_area|),
|"TeXfonts:"| in line 9994  (|TEX_font_area|),
|".fmt"| in line 10082 (|format_extension|),
the |empty_string| in line 10928, and
\.{"0234000122*}\)\.{4000133**3**344*}\)\.{0400400*0000}\)\.{00234000111*}\)\.{111111}\)\.{2341011"}
in line 15049 (|math_spacing|).

I have shown already some of the handling of the empty string\index{empty string}; 
the rest follows now:

@<convert some strings to macro names@>=
    else@+ if (t->sym_no==TeXinputs_no) wprint("TEX_area");
    else if (t->sym_no==TeXfonts_no) wprint("TEX_font_area");
    else if (t->sym_no==fmt_no) wprint("format_extension");
    else if (t->sym_no==math_spacing_no) wprint("math_spacing");
@

@<generate macros for some strings@>=
    if (str_k->sym_no==empty_string_no) wputs("@@d empty_string "),wputi(k);
    else if (str_k->sym_no==TeXinputs_no) wputs("@@d TEX_area "),wputi(k);
    else if (str_k->sym_no==TeXfonts_no) wputs("@@d TEX_font_area "),wputi(k);
    else if (str_k->sym_no==fmt_no) wputs("@@d format_extension "),wputi(k);
    else if (str_k->sym_no==math_spacing_no) wputs("@@d math_spacing "),wputi(k);
@

@<global variables@>=
int TeXinputs_no, TeXfonts_no, fmt_no, math_spacing_no;
@
@<initialize token list@>=
TeXinputs_no=predefine("\"TeXinputs:\"",PID,0); 
TeXfonts_no=predefine("\"TeXfonts:\"",PID,0); 
fmt_no=predefine("\".fmt\"",PID,0); 
math_spacing_no=predefine(
  "\"0234000122*4000133**3**344*0400400*000000234000111*1111112341011\"",PID,1); 
@

I am left with the macro |ensure_dvi_open|, containing
|".dvi"| in line 10284,\index{.dvi+\.{.dvi}}
|"file name for output"| in line 10286, and
|".dvi"| in line 10286,
which I simply turn into a module of the same name using the patch file\index{patch file}.

I conclude the generation of \cweb/ output by generating
initializations for the |str_pool| and |str_start| array.
@<generate string pool initializations@>=
 wputs("\n@@ All the above strings together make up the string pool.\n" 
        "@@<|str_pool| initialization@@>=\n"
        "str_0_255\n");
  for (i=256; i<k;i++)
  { wputs("str_"),wputi(i);
    if ((i&7)==7) wputs("@@/\n");@+ else wput(' ');
  }
  wputs("\n\n@@ @@<|str_start| initialization@@>=\n"
        "str_start_0_255\n");
  for (i=256; i<k;i++)
  { wputs("str_start_"),wputi(i),wput(',');
    if ((i&3)==3) wput('\n');@+ else wput(' ');
  }
  wputs("str_start_"),wputi(k);
  wputs("\n\n"@/
        "@@ We still need to define the start locations of the strings.\n"@/
        "@@<prepare for string pool initialization@@>=\n"@/
        "typedef enum {\n"@/
        "str_start_256=sizeof(str_0_255)-1,\n");
  for (i=257; i<=k;i++)@/
    wputs("str_start_"),wputi(i),wputs("=str_start_"),wputi(i-1),
    wputs("+sizeof(str_"),wputi(i-1),wputs(")-1,@@/\n");
  
  wputs("str_start_end } str_starts;\n"@/
  "\n@@ @@<|pool_ptr| initialization@@>= str_start_"),wputi(k),wputs("\n"@/
  "\n@@ @@<|str_ptr| initialization@@>= "), wputi(k), wput('\n');@/
@


\subsection{Macro and format declarations}
When I convert a macro\index{macro declaration}\index{format declaration},
I first check if the translation has made it
obsolete\index{obsolete} in which case I skip it. Otherwise, I output the initial
part of the macro declaration up to the equal sign. From here on, I
go different routes for the different types of declarations. 

@<convert |t| from \WEB/ to \cweb/@>=
case ATD:
    { token *eq=t->next->next; 
      DBG(dbgcweb,"Macro definition in line %d\n",t->lineno);
      if (SYM(t->next)->obsolete)
        t= wskip_to(t, eq->link);
      else 
      { wputs("@@d "), t=t->next;@+
        wprint(SYM(t)->name); 
        if (t->tag==NMACRO)
          @<convert |NMACRO| from \WEB/ to \cweb/@>@;
        else if (t->tag==OMACRO)
          @<convert |OMACRO| from \WEB/ to \cweb/@>@;
        else if (t->tag==PMACRO)
          @<convert |PMACRO| from \WEB/ to \cweb/@>@;
        else
          ERROR("Macro name expected in line %d",t->lineno);
      }
      DBG(dbgcweb,"End Macro definition in line %d\n",t->lineno);
      break;
    }
case ATF:
    { token *eq=t->next->next;
       DBG(dbgcweb,"Format definition in line %d\n",t->lineno);
      if (SYM(t->next)->obsolete)
        t= wskip_to(t, eq->link);
      else
      { wputs("@@f "), t=t->next;@+
        wprint(SYM(t)->name); 
        t=wprint_to(eq->next,eq->link);
      }
      break;
    }
@       

Ordinary parameterless macros\index{parameterless macro} map directly to  \CEE/ style macros.
@<convert |OMACRO| from \WEB/ to \cweb/@>=
{ wput('\t');
  t=eq->next;
}
@

\WEB/ features numeric macros\index{numeric macro} that are evaluated to a numeric value by
\WEB/ before they are inserted into the final \Pascal/ program. When
converting such macros to \CEE/ style macros, I have to make sure
that a replacement text containing operators is evaluated as one
expression. For example when \TeX\ defines
$|single_base|\equiv|active_base|+256$, where $|active_base|\equiv 1$,
then |print_esc(p-single_base)| should be evaluated as
|print_esc(p-(1+256))| not|print_esc(p-1+256)|.  So I add an extra
pair of parentheses around the replacement text in case it contains a
plus sign or a minus sign.

@<convert |NMACRO| from \WEB/ to \cweb/@>=
     {  int has_operators;
        wput('\t');
        has_operators=0;
        for (t=eq->next;t!=eq->link && t->tag!=MLEFT && t->tag!=NL;t=t->next)
          if (t->tag==PPLUS || t->tag==PMINUS) { has_operators=1;@+ break;@+}
        if (has_operators) wput('('); 
        for (t=eq->next;t!=eq->link && t->tag!=MLEFT && t->tag!=NL;t=wtoken(t))
          continue;
        if (has_operators) wput(')'); 
      }  
@

Parametrized macros\index{parametrized macro} in \WEB/ can use any number of arguments.
In \CEE/, typical parametrized macros have a fixed number 
of arguments, variadic macros\index{variadic macro} being the exception rather
than the rule. Therefore, I count the number of macro arguments
each time I expand a macro. Since \TeX\ uses macros with a
fixed number of arguments only for 1, 2, or 3 arguments,
I use the value 4, for variadic macros.

@<count macro parameters@>=
{ token *p; int count=1;
  if (open->next->tag==HASH)
  {  DBG(dbgmacro,"Counting %s parameters (#) in line %d\n", SYM(t)->name, t->lineno); }
  else
  { for (p=open->next; p!=open->link; p=p->next)
      if (p->tag==PCOMMA) count++;
      else if (p->tag==POPEN) p=p->link;
    if (SYM(t)->value==0) SYM(t)->value=count;
    else if (SYM(t)->value!=count) SYM(t)->value=4;
    DBG(dbgmacro,"Counting %s parameters %d line %d\n", SYM(t)->name,SYM(t)->value, t->lineno);
  }
}
@

Now that I know the number of arguments, 
I can construct the macro definition\index{macro definition}.

@<convert |PMACRO| from \WEB/ to \cweb/@>=
{ static char *params[4]={"X","X","X, Y","X, Y, Z"}; /* if I have no information, I assume 1 */
  char *param;
  eq=eq->next; /* account for the \.{(\#)} token */
  if (SYM(t)->value>3)
  { param="...";@+ hash_str="__VA_ARGS__";@+}
  else            
    hash_str=param=params[SYM(t)->value];
  wput('('),wputs(param),wputs(")\t"), t=eq->next;
}
@

@<global variables@>=
static char *hash_str;
@

@<convert |t| from \WEB/ to \cweb/@>=
case HASH:
   wprint(hash_str),t=t->next;@+break;
@

\subsection{Labels}

In \CEE/, labels\index{label} are identifiers and labels do not need a declaration.
So in the parser, I mark the tokens belonging to a 
label declaration\index{label declaration}
with the tag |CIGNORE| and they will be ignored when the \cweb/ file
is written.

The tag |CLABEL| is used now to mark the labels when they are used.
In most cases the labels in \TeX\ are numeric macros. So I use the
name of the macro as the name of the |CLABEL| token and mark the
definition of the numeric macro\index{numeric macro} as obsolete\index{obsolete} 
(Occasionally these label names are modified by adding an integer). In the rare cases where
the label is indeed an integer, I use the tag |CLABELN|.  In this
case I add the prefix ``label'' to the numeric value to make it a
\CEE/ identifier.  Further, I count the number of times a label is
used. Later transformation might render a label as unused and I can
remove also the target label.  The whole bookkeeping is achieved by
calling the function |clabel| at appropriate places in the parser.

@<external declarations@>=
extern void clabel(token *t, int use);
@
@<functions@>=
void clabel(token *t, int use)
{ 
  if (t->tag==NMACRO)
  { SYM(t)->obsolete=true;
    SYM(t)->value+=use;
    t->tag=CLABEL;
  }
  else if (t->tag==CLABEL)
    SYM(t)->value+=use; 
  else if (t->tag==PRETURN)
   SYM(t)->value+=use;
  else 
  { if (t->tag==PINTEGER)
      t->tag=CLABELN; 
    return; 
  }
  DBG(dbgstring,"Using label %s (%d) in line %d\n",SYM(t)->name,SYM(t)->value,t->lineno);
}
@

A very special case is the \&{return} macro of \TeX;
it is defined as |goto exit|\index{exit+\\{exit}}. I need to deal with it in a special
way, because it usually follows the assignment of a function return
value and therefore can be converted to a \CEE/ \&{return} statement.
In the scanner, I create the PRETURN token and set its symbol number to
the |exit| symbol.

@<external declarations@>=
extern int exit_no;
#define TOK_RETURN {token *t=add_token(PRETURN); t->sym_no=exit_no; }
@

@<global variables@>=
int exit_no;
@

@<initialize token list@>=
exit_no=get_sym_no("exit");
@


While parsing, I replace the symbol number\index{symbol number} 
by the symbol pointer\index{symbol pointer}
to reflect local\index{local label} |exit| labels.

@<special treatment for \WEB/ tokens@>=
      case PRETURN: 
        t->sym_ptr=SYM(t);
        pp_stack[pp_sp].next=t->next; 
        goto found;
@



The output of the \CEE/-style labels is done with the following code.
In the case of a |CLABEL|, I check the use-count in |value| and
eliminate unused labels; I also check for a plus sign and a second
number (remember labels in \Pascal/ are numeric values) and if found
append the number to the label name.

@<convert |t| from \WEB/ to \cweb/@>=
case CLABEL:
   if (t->sym_ptr->value<=0)
    { t=t->next;
      if (t->tag==PPLUS) 
        t=t->next->next;
      if (t->tag==PCOLON)
      { t=t->next; 
        if (t->tag==CSEMICOLON)
          t=t->next;
      }
   }
   else
   { wprint(SYM(t)->name); t=t->next;
     if (t->tag==PPLUS) 
     {  t=t->next; wputs(t->text); t=t->next; }
   }
   break;
case CLABELN:
     wprint("label"); wputs(t->text); t=t->next; 
     break;
case PEXIT:
     wprint("exit(0)"); t=t->next; 
     break;
case PRETURN:
     wprint("goto end"); t=t->next; 
     break;
@

\subsection{Constant declarations}

In \TeX\ there are only two types of 
constant declarations\index{constant declaration}: integers
and strings. I also observe, that the integer declarations are
followed by at most one string declaration.  While parsing, I change
the tag of the identifier getting defined to |CINTDEF| or |CSTRDEF|.
I convert the constant declarations into an 
enumeration type\index{enumeration type} or a |const char *|.


@<convert |t| from \WEB/ to \cweb/@>=
case CINTDEF:
     wputs("enum {@@+"), wid(t), wput('=');
     t=wprint_to(t->link->next,t->link->link);
     wputs("@@+};");
     t=t->next;@+
     break;
case CSTRDEF:
     wprint("const char *"), wid(t);@+t=t->next;@+ break;
@

I have used above a technique that I will use often in the following
code.  While parsing, I use the link filed of the tokens to connect
key tokens of a certain \Pascal/ constructions. Using these links, I
can find the different parts (including the intervening \WEB/ tokens)
and rearrange them as needed.  Linking tokens is achieved with the
following macro which also checks that the link stays within the same
code sequence.

@<external declarations@>=
#define LNK(from,to) @[((from)?(seq((from),(to)),(from)->link=(to)):0)@]
@

\subsection{Variable declarations }

When I parse variable declarations\index{variable declaration}, I replace the |tag| of the first
variable identifier by |PDEFVARID| and link all the variables
following it together. The last variable is linked to the token
separating the identifier from the type\index{type}, a |PCOLON| token which the
parser has changed to a |CIGNORE| token.  The former |PCOLON| token
itself is then linked to the |PSEMICOLON| that terminates the variable
declaration.  In the special case of array variables, I have to
insert the variable identifiers inside the type definition. To
accomplish this, I set the global variable |varlist| to point to the
|PDEFVARID| token, and continue after printing the type with whatever
is left from this list.  Note the special precautions taken to get the
type of variables right that are used to control 
\&{for}-loops\index{for+\&{for}}; I deal
with this problem in section~\secref{forloop}.

@<internal declarations@>=
static token *varlist;
@
@<global variables@>=
static token *varlist=NULL;
@
Using this information I can convert the variable declaration.
@<convert |t| from \WEB/ to \cweb/@>=
case PDEFVARID:
     { token *type=t->link;
      varlist=t;
       DBG(dbgcweb,"Converting variable list in line %d\n",t->lineno); 
       while (type->tag==PID) type=type->link;
       { int replace=0;
         @<decide whether to replace a subrange type for loop control variables@>@;
         if (replace)
         { wprint("int"); 
           DBG(dbgfor,"\tReplacing subrange type by int\n");
         }
         else
           wprint_to(type,type->link);
       }
       DBG(dbgcweb,"Finished variable type in line %d\n",t->lineno); 
       if (varlist->tag== PDEFVARID)
       { wid(varlist); @+varlist=varlist->next;@+} 
       wprint_to(varlist,type);
       t=type->link;
       DBG(dbgcweb,"Finishing variable list in line %d\n",t->lineno); 
       break;
     }
@

\subsection{Types}

\Pascal/ type declarations\index{type declaration} start with the 
keyword \&{type}, then
follows a list of declarations each one starting with a 
type identifier\index{type identifier}. While parsing \Pascal/, 
I change the |tag| of the
identifier being defined to |PDEFTYPEID|. I link this token to the
first token of the type, and link the first token of the type to the
semicolon terminating the type.  When I encounter these |tags| now a
second time, I can convert them into \CEE/ \&{typedef}'s.\index{typedef+\&{typedef}}

@<convert |t| from \WEB/ to \cweb/@>=
case PDEFTYPEID:
{ token @[*type_name=t@];
  token @[*type=type_name->link@];
  DBG(dbgcweb,"Defining type %s in line %d\n",token2string(t),t->lineno); 
  wprint("typedef ");
  t=wprint_to(type,type->link);
  wprint(token2string(type_name));
  break;
}
@

The above code just uses |wprint_to| to print the type itself.  Some
types need a little help to print correctly. 
For instance, subrange types\index{subrange type} are converted 
by changing the |PEQ| token after the new type
identifier to a |CTSUBRANGE| token, with an |up|-link to the parse tree
for the subrange. Since \CEE/ does not have this kind of subrange
types, I approximate them by the standard integer types found in
\.{stdint.h}\index{stdint.h+\.{stdint.h}}.

@<convert |t| from \WEB/ to \cweb/@>=
case CTSUBRANGE:
{ int lo = t->up->previous->value;
  int hi =  t->up->next->value;
  DBG(dbgcweb,"Defining subrange type %d..%d\n",lo,hi); 
  if (lo<0 && INT8_MIN<=lo && hi <= INT8_MAX) wprint("int8_t");
  else if (0<=lo && hi <= UINT8_MAX) wprint("uint8_t");
  else if (lo<0 && INT16_MIN<=lo && hi <= INT16_MAX) wprint("int16_t");
  else if (0<=lo && hi <= UINT16_MAX) wprint("uint16_t");
  else if (lo<0 && INT32_MIN<=lo && hi <= INT32_MAX) wprint("int32_t");
  else if (0<=lo && hi <= UINT32_MAX) wprint("uint32_t");
  else ERROR("unable to convert subrange type %d..%d in line %d\n",lo,hi,t->lineno);
  t= t->link;
  break;
}
@

To set |up|-links in the parser, I use the following macro:
@<external declarations@>=
#define UP(from,to) @[((from)->up=(to))@]
@


Record types\index{record type} get converted into \CEE/
structures\index{structure type}; the variant parts\index{variant part} 
of records become \CEE/ unions\index{union type}.

@<convert |t| from \WEB/ to \cweb/@>=
case PRECORD:
     { DBG(dbgcweb,"Converting record type in line %d\n",t->lineno); 
       wprint("struct { ");
       t=wprint_to(t->next,t->link);
       DBG(dbgcweb,"Finished record type in line %d\n",t->lineno); 
       wprint("} ");
       break;
     }
case CUNION:
     { DBG(dbgcweb,"Converting union type in line %d\n",t->lineno); 
       wprint("union { ");
       t=wprint_to(t->next,t->link);
       wprint("};");
       DBG(dbgcweb,"Finished union type in line %d\n",t->lineno); 
       break;
    }
@

The conversion of the field declarations\index{field declaration} 
of a record type assumes that
the \Pascal/ parser has changed the first |PID| token to a |PDEFVARID|
token and linked it to the following |PCOLON| token; then linked the
|PCOLON| token to the |PSEMICOLON| or |PEND| token that follows the
type.

Arrays\index{array} also need special conversion.  \Pascal/ arrays specify a
subrange type\index{subrange type} while \CEE/ arrays are always zero based and specify a
size. Common to both is the specification of an element type\index{element type}.
\TeX\ does not use named array types. Array types only occur in the
definition of variables.

I link the |PARRAY| token to the |PSQOPEN| token, which I link to
either the |PDOTDOT| token or the type identifier, which I link to
the |PSQCLOSE| token, which I link to the |POF| token, which is
finally linked to the |PSEMICOLON| following the element type.

%I link the |PARRAY| token to the |POF| token preceding the 
%element type, and link the |POF| token to the |PSEMICOLON| 
%following the element type.

The |up| pointer of the |PARRAY| token points to the parse tree for
the subrange of the index type\index{index type}.

@<convert |t| from \WEB/ to \cweb/@>=
case PARRAY:
     if (t->up==NULL)  /* happens for example code which is not part of the program */
       wputs(t->text),t=t->next; 
     else
     { token *from=t->link;
       token *index=from->link;
       token *to=index->link;
       token *element_type=to->link;
       token *subrange=t->up;
       int lo, hi, zero_based;

       if (subrange->tag==PID) subrange=subrange->sym_ptr->type;
       lo = subrange->previous->value;
       hi =  subrange->next->value;

       zero_based=(subrange->previous->tag==PINTEGER && lo==0) || 
                   subrange->previous->tag==PTYPECHAR;
       DBG(dbgarray,"Converting array[%d..%d] type in line %d\n",lo,hi,t->lineno);
       t=wprint_to(element_type,element_type->link);
       while (true)
       { CHECK(varlist!=NULL,"Nonempty variable list expected in line %d",
               varlist->lineno);
         DBG(dbgarray,"Generating array variable %s in line %d\n",
               varlist->sym_ptr->name,varlist->lineno); 
         wid(varlist); 
         if (!zero_based) wput('0'); /* add a zero to the array name */
         wput('[');@+@<generate array size@>@+wput(']');
         if (!zero_based) /* now I need the array with the appropriate offset */
         { DBG(dbgarray,"Generating array pointer %s[%s=%d.. ] in line %d\n",
               varlist->sym_ptr->name,token2string(from->next),lo,varlist->lineno); 
           wputs(", *const "); 
           wid(varlist);
           wputs(" = ");
           wid(varlist),wput('0');
           @<generate array offset@>;
         }
         varlist=varlist->link;
         if (varlist->tag==PDEFVARID || varlist->tag==PID) wput(','); else break;
       }
       DBG(dbgarray,"Finished array type in line %d\n",t->lineno); 
     }
     break;
@

@<generate array size@>=
 { int hi,size;
   hi=generate_constant(subrange->next,0,0);
   size=generate_constant(subrange->previous,'-',hi);
   size=size+1;
  if (size<0) wput('-'), wputi(-size); 
  else if (size>0) 
  { if (subrange->previous->tag!=PTYPECHAR && 
        (subrange->previous->tag!=PINTEGER || subrange->next->tag!=PINTEGER)) wput('+');
    wputi(size);
  }
} 
@

@<generate array offset@>=
{ int lo=generate_constant(subrange->previous,'-',0);
  if (lo<0) wput('-'), wputi(-lo); 
  else if (lo>0) wput('+'), wputi(lo);
} 
@

I use the following function to generate a symbolic expression for
the given parse tree representing a constant integer value. The
expression contains only plus or minus operators. Parentheses are
eliminated using the |sign| parameter.  The function returns the
numeric value that needs to be printed after all the symbolic
constants, accumulating literal constants on its way.

@<functions@>=
int generate_constant(token *t, char sign, int value)
{ if (t->tag==PTYPECHAR || t->tag==PINTEGER)
  { if (sign=='-') return value-t->value; else return value+t->value; }
  else if (t->tag==NMACRO || t->tag==PCONSTID) 
  { if (sign != 0) wput(sign); wprint(token2string(t->previous));
    return value;
  }
  if (t->tag==PPLUS)
  { if (t->previous!=NULL) value=generate_constant(t->previous,sign,value);
    if (sign==0 ) sign='+';
    return generate_constant(t->next,sign,value);
  }
  if (t->tag==PMINUS)
  { if (t->previous!=NULL) value=generate_constant(t->previous,sign,value);
    if (sign==0|| sign=='+') sign='-'; else sign='+';
    return generate_constant(t->next,sign,value);
  }
  else
    ERROR("Unexpected tag %s while generating a constant expression in line %d",TAG(t),t->lineno);
}
@

@<internal declarations@>=
int generate_constant(token *t, char sign, int value);
@


\subsection{Files}

The \Pascal/ idea of a file\index{file}, let's say ``|fmt_file|: {\bf file of}
|memory_word|'', is a combination of two things: the file itself and
the file's buffer\index{file buffer} variable capable of holding one data item, in this
case one |memory_word|. In \CEE/, I can simulate such a \Pascal/ file
by a structure containing both: |FILE *f|, the file in the \CEE/
sense; and |memory_word@,d|, the data item.

@<convert |t| from \WEB/ to \cweb/@>=
case PFILE:
     { DBG(dbgcweb,"Converting file type in line %d\n",t->lineno); 
       wprint("struct {@@+FILE *f;@@+");
       t=wprint_to(t->next,t->link);
       wprint("@@,d;@@+} ");
       DBG(dbgcweb,"Finished file type in line %d\n",t->lineno); 
       break;
     }
@

As I will show in section~\secref{procedures}, it is also convenient
that \TeX\ always passes files, and only files, by reference\index{pass by reference} to
functions\index{function} or procedures\index{procedure}.
Now I can transcribe |get(fmt_file)| into
|fread(&fmt_file.d, sizeof(memory_word), 1, fmt_file.f)|.
%In the simpler case, where the data type is a single byte,
%I have for example  |dvi_file.f=fgetc(dvi_file.f)|.
I put these ``rewrite rules'' as macros in the patch file\index{patch file};
it has the advantage that the rewriting does not disturb the visual
appearance of the program code.


Access to the file's buffer\index{file buffer} variable, in \Pascal/ written as {\it f\^}
becomes simply |f.d|.

@<convert |t| from \WEB/ to \cweb/@>=
case PUP: wputs(".d");@+t=t->next;@+ break;
@


\subsection{Structured statements}

Some of the structured statements\index{structured statement} are easy to convert. 
For example the
\&{if} statement just needs an extra pair of parentheses around the
controlling expression. These small adjustment are made when dealing
with the |PIF| and |PTHEN| token. The \&{while} statement is similarly
simple, but the |PDO| token may also be part of a 
\&{for}-loop\index{for+\&{for}}.  So the
parser links the |PWHILE| token to the |PDO| token to insert the
parentheses.

@<convert |t| from \WEB/ to \cweb/@>=
case PWHILE: 
   wprint("while ");
   if (t->link!=NULL){
     wput('(');@+t=wprint_to(t->next,t->link);@+ wputs(") ");
   }
   t=t->next;@+ break;
@

Other structured statements need more work.

Let's start with the \Pascal/ \&{case} statement.  Adding parentheses
around the controlling expression is not as simple, because I lack a
unique second keyword; instead I have a |POF| token which occurs at
various places and is usually ignored.  So I link the |PCASE| token
to the corresponding |POF| token while parsing and generate 
a \&{switch} statement.

@<convert |t| from \WEB/ to \cweb/@>=
      case PCASE:
        if (t->link==NULL) 
        { wprint(t->text);@+t=t->next; }
        else
        { wprint("switch (");@+
          t=wprint_to(t->next, t->link);@+
          wputs(") {");
        }
        break;
@
The case labels\index{case label} are converted while parsing. 
While \Pascal/ requires a list of labels followed by a semicolon and a
statement, \CEE/ needs the keyword ``\&{case}'' preceding a single
label, a colon, and a statement list usually ending with ``|break;|''.
When faced with this problem, I tried a new strategy: inserting new tokens.
I insert a |CCASE| token before each \Pascal/ case label and replace
the |PCOMMA| between labels by a |CCOLON|. (While it worked quite well,
I still wished, I would have solved the problem without modifying
the token list).

To insert the |CCASE| tokens, the parser uses the function |winsert_after|.
@<external declarations@>=
extern token *winsert_after(token *t, int tag, char *text);
@

@<functions@>=
token *winsert_after(token *t, int tag, char *text)
{ token *n;
  DBG(dbgcweb,"Inserting token %s after %s in line %d\n",
      tagname(tag),TAG(t), t->lineno);
  n = new_token(tag);
  n->next=t->next;
  n->next->previous=n;
  n->previous=t;
  t->next=n;
  n->sequenceno=t->sequenceno;
  n->lineno=t->lineno;
  n->text=text;
  return n;
} 
@

Further, the parser replaces the semicolons separating the \Pascal/
case elements by a |CBREAK| token.

@<convert |t| from \WEB/ to \cweb/@>=
case CBREAK:
  if (t->previous->tag!=PSEMICOLON && t->previous->tag!=CSEMICOLON 
      &&t->previous->tag!=PEND) wputs("@@;");  
  if (!dead_end(t->up,t->lineno)) wprint("@@+break;");
  t=t->next;
  break;
@ 

The semicolon\index{semicolon} that might be necessary before the ``\&{break}'' is inserted
using a general procedure described in section~\secref{semicolon}.

\TeX\ often terminates the statement following the case label with a
\&{goto} statement. In this case of course it looks silly to add a
\&{break} statement. I can test this by calling the |dead_end| function

@<external declarations@>=
int dead_end(token *t, int lineno);
@

@<functions@>=
int dead_end(token *t, int lineno)
{ DBG(dbgbreak,"Searching for dead end in line %d:\n",lineno);
   while (true)
   { DBG(dbgbreak,"\t%s\n",TAG(t)); 
     if (t->tag==PGOTO||t->tag==PEXIT||t->tag==CPROCRETURN) return true;
     else if (t->tag==PCOLON) t=t->next;
     else if (t->tag==PBEGIN) t=t->previous;
     else if (t->tag==PSEMICOLON || t->tag==CCASE) 
     { if (t->next->tag==CEMPTY) t=t->previous; else t=t->next; }
     else return false;
   }
}
@

The ``\&{others}'' label can be
replaced by ``\&{default}''.

@<convert |t| from \WEB/ to \cweb/@>=
case POTHERS:
  wprint("default:");
  t=t->next;
  break;
@ 

I suspect that a {\sl case\_list\/}\index{case_list+{\sl case\_list\/}}
always ends with either a semicolon or
|POTHERS| without a semicolon. It could be better to generate also a
\&{break} statement at the end of the last 
case element---especially if the
order of cases gets rearranged by rearranging or adding modules.

Finally I convert the \&{repeat}-\&{until} statement.  The ``\&{repeat}''
becomes ``|do {|''\index{do+\&{do}} 
and the ``\&{until}'' becomes ``|} while|''\index{while+\&{while}}. 
All that is left is to enclose the expression following the ``\&{until}'' in a pair of
parentheses and add a |!|\index{"!+$\neg$} operator.  The opening parenthesis follows
the ``\&{while}''; but where should the closing parenthesis's go?  Here I
use the fact that in \TeX\ the condition after the ``\&{until}'' is either
followed directly by a semicolon\index{semicolon}, or by the start of a new section.

@<convert |t| from \WEB/ to \cweb/@>=
case PREPEAT: wprint("@@/do@@+{");@+ t=t->next;@+ break;
case PUNTIL:
{ int sequenceno, lineno;
  token *end;
  wputs("}@@+ while (!(");
  sequenceno=t->sequenceno;
  lineno=t->lineno;
  end=t->next;
  while(true)
  { if (end->tag==PSEMICOLON || end->tag==CSEMICOLON || end->tag==PELSE )
      break;
    else if (end->tag==ATSPACE)
    { while (true)
      { int tag=end->previous->tag;
        if (tag>FIRST_PASCAL_TOKEN || tag==OMACRO || tag==NMACRO || tag==CHAR) break;
        end=end->previous;
      }
      break;
    }
    end=end->next;
  }
  CHECK(sequenceno==end->sequenceno,"until: end of expression not found in line %d",lineno);
  t=wprint_to(t->next, end);
  wputs("))");
  break;
}
@



\subsection{{\bf for}-loops}
\label{forloop}%
To convert the \&{for} statement, I link the |PFOR| token to the |PTO|
or |PDOWNTO| token respectively, which is then linked to the |PDO|
token. The rest seems simple but it hides a surprising difficulty.

@<convert |t| from \WEB/ to \cweb/@>=
case PFOR:
{ token *id=t->next;
  token *to=t->link;
  if (to==NULL) { wprint("for"); t=t->next; break; }
  wprint("for (");
  wprint_to(id,to);
  wputs("; ");
  wid(id);
  if (to->tag==PTO) wputs("<=");
  else if (to->tag==PDOWNTO) wputs(">=");
  else ERROR("to or downto expected in line %d",to->lineno);
  wprint_to(to->next,to->link);
  wputs("; ");
  wid(id);
  if (to->tag==PTO) wputs("++");
  else  wputs("--");
  wputs(") ");
  t=to->link->next;
  break;
}
@

The above code checks that there is actually a link to the |PTO|
token. This link will exist only if the \&{for}-loop\index{for+\&{for}}
was parsed as part of
the \Pascal/ program; it will not exists if the code segment was just
part of an explanation (see for example section 823).  In this case, I
need to deal with the |PTO| and |PDO| separately.

Given a \Pascal/ variable ``{\bf var}  |i:0..255;|'' 
the \&{for}-loop\index{for+\&{for}} 
``|for i:=255| \&{downto} |0| \&{do}\dots'' will work as expected. 
If I translate the variable definition to ``|uint8_t@, i;|'' 
the translated \&{for}-loop ``|for (i=255;i>=0;i--)|\dots''
will not terminate because the loop control variable will never
be smaller than 0, instead it will wrap around.
If the variable |i| is used in such a \&{for}-loop, I should
define it simply as ``|int i;|''.

The first step is the analysis of \&{for}-loops\index{for+\&{for}} 
in the \Pascal/ parser.
To do so, I call the function |mark_for_variable| with three
parameters: |id|, the loop control variable; |lineno|, the line number
for debugging\index{debugging} purposes; |value|, the value of the limit terminating
the loop; and |direction|, indicating the type of loop.  For the
|direction|, I distinguish three cases: |TO_LOOP|, |DOWNTO_LOOP|, and
loops where the loops limit is a variable (|VAR_LOOP|).

@<external declarations@>=
#define VAR_LOOP 0
#define TO_LOOP 1
#define DOWNTO_LOOP 2
@

The function then tries to decide whether the type of the for loop
control variable should be changed from a subrange type\index{subrange type}
 to a plain integer.

If the limit controlling the loop is a variable, I can not ensure
(without reasoning about program semantics) that the limit will not
coincide with the limit of the subrange type of the control
variable. In this case I stay on the safe side and replace the
subrange type.

%It would probably also suffice, if I did
%this only for |uint8_t| or |int8_t| types.

If the limit controlling the loop is a constant, I check its value
and replace the type of the control variable only if the value
coincides with the upper (or lower) limit of the subrange type\index{subrange type} used
for the control variable. The comparison of the given loop limit with
the variables possible range limit is postponed until I generate the
variable declaration. For now, I just determine the minimum number of
|bits| needed for a suitable variable type.

@<functions@>=
void mark_for_variable(token *id, int lineno, int value, int direction)
{ int replace=0;
  int bits=0;
  if (direction==VAR_LOOP) replace=1;
  else if (direction==DOWNTO_LOOP)
  { if (value>=0) bits=0; /* lower limit of all unsigned types */
    else if (value > INT8_MIN) bits=6;
    else if (value > INT16_MIN) bits=14;
    else bits=15;
  }
  else /* |TO_LOOP| */
  { if (value < 0) bits=0;
    else if (value < INT8_MAX) bits=6;
    else if (value < UINT8_MAX) bits=7;
    else if (value < INT16_MAX) bits=14;
    else if (value < UINT16_MAX) bits=15;
    else if (value < INT32_MAX) bits=31;
    else bits=32;
  }
  SYM(id)->for_ctrl= FOR_CTRL_PACK(lineno,replace,direction,bits);
}
@

I pack the result of my analysis into the |for_ctrl| field of the
variables symbol table entry using the following macros.

@<external declarations@>=
extern void mark_for_variable(token *id, int lineno, int value, int direction);
#define FOR_CTRL_PACK(lineno,replace,direction,bits) \
  ((lineno<<16)|((replace&0x1)<<15)|((direction&0x3)<<13)|(bits&0x1FFF))
#define FOR_CTRL_LINE(X)      (((X)>>16)&0xFFFF)
#define FOR_CTRL_REPLACE(X)   (((X)>>15)&1)
#define FOR_CTRL_DIRECTION(X) (((X)>>13)&0x3)
#define FOR_CTRL_BITS(X)      ((X)&0x1FFF)
@


%These are the lines:
%Subrange for marked variable k in line 1256
%        Range 0 to 255, limit 32767 in line 1354
%        limit is variable but always below 100, so OK
%        This is OK, multiple replacement is OK
%
%Subrange for marked variable k in line 1709
%        Range 0 to 500, limit 32767 in line 1715
%        range is 0 to buf_size=500 but might be defined smaller or larger
%        the limit is last-1 where I have always last<buf_size
%        This is OK, replacement is OK
%
%Subrange for marked variable p in line 4390
%        Range 0 to 40, limit 0 in line 4397
%        the Range is 0 to nest_size which gives an uint8_t 
%        with a for loop down to 0
%        var p:0..nest_size; {index into |nest|}
%        This is NOT OK, lower limit = range, replacement OK
%
%Subrange for marked variable i in line 6867
%        Range 0 to 500, limit 32767 in line 6916
%        limit is j-1 where j is inside the buffer
%        This is OK, replacement is OK
%
%Subrange for marked variable k in line 7579
%        Range 0 to 500, limit 32767 in line 7587
%        the limit is last-1 where I have always last<buf_size, 
%        This is OK, Limit > range(500)> 255, replacement is OK 
%
%Subrange for marked variable k in line 10170
%        Range 1 to 40, limit 32767 in line 10174
%        range is 1..file_name_size
%        var k:1..file_name_size; {index into |name_of_file|}
%        the limit is name_length which might be equal to file_name_size
%        limit > 255 > range
%        this is NOT OK if file_name_size is 255, replacement is OK
%
%Subrange for marked variable k in line 10302
%        Range 0 to 500, limit 32767 in line 10318
%        Limit is l which can be as large as last-1
%        This is OK, limit > range(500) > 2^16 > 2^8, replacement is OK
%
%Subrange for marked variable k in line 12668
%        Range 0 to 9, limit 9 in line 12719
%        This is OK, limit < 255, no replacement needed
%
%Subrange for marked variable fit_class in line 16380
%        Range 0 to 3, limit 3 in line 16467
%        This is OK, limit <255, no replacement needed
%
%Subrange for marked variable j in line 17645
%        Range 0 to 65, limit 32767 in line 17657
%        Here the limit is inside the array so less then 64
%	 This is OK, limit>255>64, replacement for multiple is OK
%
%Subrange for marked variable j in line 18248
%        Range 0 to 64, limit 32767 in line 18308
%        The limit n is less than 64 
%        This is OK, limit>255>64, replacement is OK

When I finally come to the place where I generate a variable
declaration, I can decide whether to replace a subrange type for loop
control variables.  To do this I iterate over the list of variables
and if I find in the list one variable that requires replacement, I
change the type of the whole list (this is a bit more than necessary,
but it does no harm either).
     
@<decide whether to replace a subrange type for loop control variables@>=

{ token *subrange=NULL;
  if (type->tag==CTSUBRANGE)
    subrange=type->up;
  else if (type->tag==CIGNORE && type->next->tag==PID &&
           type->next->sym_ptr->type!=NULL && type->next->sym_ptr->type->tag==PDOTDOT)
    subrange=type->next->sym_ptr->type; /* subrange type identifier */
  if (subrange!=NULL)
  { token *id=t;
    while (id!=type && !replace)
    { if (id->sym_ptr->for_ctrl!=0)
      { int lo = subrange->previous->value;
        int hi =  subrange->next->value;
        int bits = FOR_CTRL_BITS(id->sym_ptr->for_ctrl);
        int direction = FOR_CTRL_DIRECTION(id->sym_ptr->for_ctrl);
        int lineno =  FOR_CTRL_LINE(id->sym_ptr->for_ctrl);
        replace = FOR_CTRL_REPLACE(id->sym_ptr->for_ctrl);
        DBG(dbgfor,"Subrange for marked variable %s in line %d\n",
                 token2string(id),id->lineno); 
        DBG(dbgfor,"\tRange %d to %d, limit %d bits, direction %d in line %d\n",
                 lo,hi, bits, direction, lineno );
        if (direction==DOWNTO_LOOP)
        { if (lo>=0 && bits==0) replace=true;
          else if (lo<0 && INT8_MIN<=lo && hi <= INT8_MAX && bits>=7) replace=true;
          else if (lo<0 && INT16_MIN<=lo && hi <= INT16_MAX && bits>=15) replace=true;
        }
        else if (direction==TO_LOOP)
        { if (lo<0 && INT8_MIN<=lo && hi <= INT8_MAX && bits>=7) replace=true;
          else if (0<=lo && hi <= UINT8_MAX && bits>=8) replace=true;
          else if (lo<0 && INT16_MIN<=lo && hi <= INT16_MAX && bits>=15) replace=true;
          else if (0<=lo && hi <= UINT16_MAX && bits>=16) replace=true;
        }
      }
      id=id->link;
    }
  }
}
@



\subsection{Semicolons}
\label{semicolon}%
In \CEE/, the semicolon\index{semicolon} is used to turn an expression, for example an
assignment\index{assignment}, into a statement; while in \Pascal/ semicolons are used to
separate statements in a statement sequence\index{statement sequence}. 
 This difference is important, because \CEE/ will need in certain cases, for example,
preceding an ``\&{else}'' or a ``\.{\RB}'' a semicolon, where \Pascal/ must not have one.

The simpler case is the semicolon that in \Pascal/ quite frequently
follows an \&{end}.  In \CEE/ this semicolon often does no harm (it
indicates an empty statement\index{empty statement}), but looks kind of strange, in other
cases, for example following a procedure body, it must be eliminated.
So I test for it and eliminate it wherever I find it.
@<convert |t| from \WEB/ to \cweb/@>=
case PEND:  wputs("} "),t=t->next;
  if (t->tag==PSEMICOLON) t=t->next;
  break;
@

Now let's turn to the more difficult case where \CEE/ needs a
semicolon and \Pascal/ does not have one: preceding an ``\&{else}'', at the
end of a {\sl case\_element}\index{case_element+{\sl case\_element}}, 
and at the end of a statement sequence
(preceding an ``\&{end}'' or ``\&{until}'').  Adding a semicolon\index{semicolon}
directly before such an ``\&{else}'' would in many cases not look very nice.
For instance when the code preceding it is in a different module.
The semicolon should instead follow immediately after the last
preceding \Pascal/ token.  I insert a |CSEMICOLON| token just there
using the function |wsemicolon|.  The function has two parameters:
|t|, the token that might require a preceding semicolon; and |p|, the
pointer to the parse tree preceding the token pointed to by |t|.


I first check the parse tree whether a semicolon\index{semicolon} is indeed needed, and
if so, I search for the proper place to insert the semicolon. The
function |wneeds_semicolon| descends into the parse tree, finds its
rightmost statement, and determines whether it needs a semicolon.  The
function |wback| searches backward to the earliest token that is
relevant for the \CEE/ parser.

The situation is slightly different for \.{ctangle}\index{ctangle+\.{ctangle}}. 
Its pattern matching algorithm does not work good, if the material, for example
preceding an else, does not look like a statement, for example
because the closing semicolon is hidden in a module or a macro. In
these cases it is appropriate to insert a ``\.{@@;}'' token. I do
this by looking at the token preceding the ``\&{else}'', skipping over index
entries, newlines, indents and such stuff, until finding the end of a
module, or macro and insert the ``\.{@@;}'' there.

@<functions@>=
bool wneeds_semicolon(token *p)
{ while (p!=NULL)
  { switch (p->tag)
    { case PCASE: case PBEGIN: case CIGNORE: return false;
      case PSEMICOLON: 
      case CCASE: case PELSE: p=p->next;@+ continue;
      case PIF: case PWHILE: case PFOR: case PCOLON:@/ p=p->previous;@+ continue;
      case PASSIGN: case PFUNCID:  case  PCALLID: case PREPEAT:
      case  PRETURN: case  CRETURN:  case  CPROCRETURN:case  PGOTO:  case  PEXIT: case CEMPTY:
      default: return true; 
    }
  }
  return false;
}

static token * wback(token *t)
{ while (true)
  { CHECK(t->previous!=NULL,"Error searching backward");
    t=t->previous;
    switch (t->tag)
    {  case PSEMICOLON: case CSEMICOLON: case PEND: return t;
       case RIGHT: while (t->tag!=PLEFT && t->tag!=MLEFT) t=t->previous;
           break;
       case ATGREATER: case EQ: case HASH: case ATDOLLAR: case NMACRO: case OMACRO: 
       case OCTAL: case HEX:  case CHAR: case STRING: case PRETURN: case CEMPTY:
         return t;
       case CIGNORE: continue;
       default: break;
    }
    if (t->tag>FIRST_PASCAL_TOKEN) 
      return t; 
  }
}

void wsemicolon(token *p, token *t)
{ t=wback(t); 
  if (t->tag!= PSEMICOLON && t->tag!=CSEMICOLON && t->tag!=PEND) 
  {  if (wneeds_semicolon(p))
     { DBG(dbgsemicolon,"inserting ; in line %d\n",t->lineno);
       if (t->next->tag==ATSEMICOLON)
       { t->next->tag=CSEMICOLON; t->next->text=";"; }
       else
         winsert_after(t,CSEMICOLON,";");
     }
     else  if (t->next->tag!=ATSEMICOLON && t->next->tag!=PSEMICOLON)
     { 
        DBG(dbgsemicolon,"inserting @@; in line %d\n",t->lineno);
        winsert_after(t,ATSEMICOLON,"@@;");
     }

  } 
} 
@

In procedures, I eliminate a final ``|exit:|'' 
because I have replaced ``|goto exit|'' by ``\&{return}''.\index{goto+\&{goto}}

%It might be a good idea to classify the modules
%as statements or expressions and enclose the
% module names in \.{@@[...@@]} or add a trailing ``\.{@@;}'' 


@<functions@>=
void wend(token *p, token *t)
{ if (p->tag==PSEMICOLON && p->next->tag==PCOLON && 
      p->next->next->tag==CEMPTY && p->next->previous->tag==CLABEL &&
      p->next->previous->sym_no==exit_no)
 { token *label=p->next->previous;
   DBG(dbgreturn,"Trailing exit: found preceding line %d\n",t->lineno);
   label->tag=CIGNORE;
   SYM(label)->value=-1000;
   CHECK(label->next->tag==PCOLON,"Expected colon after label in line %d\n",label->lineno);
   label->next->tag=CIGNORE;
   p->next->tag=CIGNORE;
 }
 else
   DBG(dbgreturn,"No trailing exit: found preceding line %d\n",t->lineno);
}

@



@<external declarations@>=
extern void wsemicolon(token *p, token *t);
extern void wend(token *p, token *t);
@

The inserted semicolons\index{semicolon} have the tag |CSEMICOLON|. 
These tokens are printed 
but---and this is new---hidden from the \Pascal/ parser. This idea might
be useful also for other inserted tokens.

@<convert token |t| to a string@>=
case CSEMICOLON:
  return ";";
@

@<special treatment for \WEB/ tokens@>=
      case CSEMICOLON:
        t=t->next;@+ 
        continue;
@

\subsection{Procedures}
\label{procedures}%
While parsing, I link the |PPROCEDURE| token to the |PSEMICOLON| or |POPEN| following
the procedure\index{procedure} name. The |PSEMICOLON|
following the heading is always changed to a |CIGNORE|.
@<convert |t| from \WEB/ to \cweb/@>=
case PPROCEDURE:
  DBG(dbgcweb,"Converting procedure heading in line %d\n",t->lineno); 
  wprint("void");
  t=wprint_to(t->next,t->link);
  if (t->tag!=POPEN) wputs("(void)");
  break;
@

The list of parameter\index{parameter} identifiers spans from the beginning parenthesis
that is pointed to by |t| to the closing parenthesis pointed to by
|t->link|.  It is handled similar to a variable declaration\index{variable declaration}.
The type identifier\index{type identifier}, however, needs to be repeated 
for each parameter in a list.  The parser has converted the parameter identifiers to either
|PDEFPARAMID| or |PDEFREFID|, linked the identifiers together with the
final link pointing to the |PCOLON| preceding the type, and it linked
the |PCOLON| to the |PSEMICOLON| or |PCLOSE| following the type. This
information is sufficient to convert the parameter list\index{parameter list}.

@<convert |t| from \WEB/ to \cweb/@>=
case PDEFPARAMID:
case PDEFREFID:
{   token *varlist=t, *type=t->link;
    DBG(dbgcweb,"Converting parameter list in line %d\n",t->lineno); 
    while (type->tag==PDEFPARAMID || type->tag==PDEFREFID) type=type->link;
    while (true) 
    { wprint_to(type,type->link);
      if (varlist->tag==PDEFREFID) wputs(" *");    
      wid(varlist); 
      varlist=varlist->link;
      if (varlist!=type) wput(',');
      else break;
    }
    t=type->link;
    DBG(dbgcweb,"Finishing parameter list in line %d\n",t->lineno); 
    break;
}
@

The parser changes the use of a reference\index{pass by reference} variable to a |CREFID|
token, and when I find one now, I dereference it.

@<convert |t| from \WEB/ to \cweb/@>=
case CREFID:
  wputs("(*"), wid(t), wput(')');
  t=t->next;@+
  break;
@ 


Now consider a procedure call\index{procedure call}. 
The most complex part about it is the
argument list\index{argument list}. If a procedure has no parameters, there is no
argument list in \Pascal/ but there is an empty argument list in
\CEE/. Further, the use of reference parameters\index{pass by reference} complicates the
processing. I need to add a ``|&|'' in front of a variable that is
passed by reference in \CEE/. To accomplish this, the parser
constructs for every procedure a |param_mask| and stores it in the
|value| field of the procedure identifiers entry in the symbol table\index{symbol table}.
A value of 1 means ``no parameter list''; all the other bits
correspond from left to right to up to 31 parameters; a bit is set if
the corresponding parameter is a reference parameter. I use these
definitions:

@<external declarations@>=
extern unsigned int param_mask, param_bit;
#define SIGN_BIT (~(((unsigned int)~0)>>1))
#define START_PARAM (param_mask=0,param_bit=SIGN_BIT)
#define NEXT_PARAM  (param_bit=param_bit>>1,CHECK(param_bit!=0,"Too many parameters"))
#define REF_PARAM   (param_mask=param_mask|param_bit)
@
@<global variables@>=
unsigned int param_mask, param_bit;
@

Due to forward declarations\index{forward declaration}, 
procedure calls\index{procedure call} can occur before the
procedure definition\index{procedure definition}.  
Therefore I can not apply my knowledge about
reference parameters when I parse the procedure call, I have to wait
for the second pass, when I convert the \WEB/ to \cweb/.  In \TeX\
the procedure identifier (for example |print|) can be a macro, so the
procedure identifier is not necessarily preceding the argument list\index{argument list}.
Hence I have to process the procedure identifier and the argument
list separately.

Let's start with the procedure identifier. When I find it, I check
for its |value|, and if the value indicates that there is an empty
argument list, I add it.

@<convert |t| from \WEB/ to \cweb/@>=
case PCALLID:
  DBG(dbgcweb,"Converting call in line %d\n",t->lineno); 
  wid(t);
  if (SYM(t)->value==1) wputs("()");
  t=t->next;@+break;
@

At a possibly different place in the \WEB/ file, I will encounter the
|POPEN| token that starts the argument list.  It is linked to the
corresponding |PCLOSE| token, and the parser takes care of setting its
|up| pointer to the corresponding |PCALLID| token if there are
reference parameters in the argument list.

@<convert |t| from \WEB/ to \cweb/@>=
case POPEN:
  wput('(');
  if (t->up==NULL || SYM(t->up)->value==0)
    t=wprint_to(t->next,t->link);
  else
  { int param_mask=SYM(t->up)->value;
    token *close=t->link;
    t=t->next;
    if (param_mask<0) wput('&');
      param_mask=param_mask<<1;
    while(t!=close)
    {  if (t->tag==PCOMMA) 
      { wputs(", ");@+t=t->next;
        if (param_mask<0) wput('&');
        param_mask=param_mask<<1;
      }
      else
        t=wtoken(t);
    }
  }
  break;
@



\subsection{Functions}

Functions\index{function} are slightly more complicated than procedures because they
feature a return type\index{return type} and a return value\index{return value}.
  Let's start with the
function header\index{function header}. To find the return type, the parser links the end of
the parameter list to the colon and the colon to the end of the return type.

@<convert |t| from \WEB/ to \cweb/@>=
case PFUNCTION:
{ token *param=t->link;
  token *type;
  DBG(dbgcweb,"Converting function heading in line %d\n",t->lineno); 
  if (param->tag==POPEN) type=param->link->link;
  else type=param;
  wprint_to(type, type->link);
  wprint_to(t->next,t->link);
  if (param->tag!=POPEN) wputs("(void)");
  else wprint_to(param,param->link->next);
  t=type->link;
  break;
}
@


Functions in \Pascal/ return values by assigning them to the function
identifier somewhere within the body of the function. In contrast,
\CEE/ uses a return statement, which also terminates the execution of
the function immediately.  The \&{return}\index{return+ \&{return}} 
statement is equivalent to the
\Pascal/ assignment only if the assignment\index{assignment} is in 
the tail position\index{tail position} of
the function. While parsing, I build a tree of the statements. This
tree is then searched for assignments to the function identifier\index{function identifier} 
in tail positions and these assignments can be converted 
to \&{return}
statements.

I start with a function that determines whether a part of the parse tree
is a ``tail'', that is it leads directly to the function return.

@<functions@>=
static bool wtail(token *t)
{ CHECK(t!=NULL,"Unexpected NULL token while searching for tail statements");
  switch(t->tag)
  { case PSEMICOLON: case PELSE:  case CCASE:
      return wtail(t->next) && wtail(t->previous);
    case PCOLON:
      return wtail(t->next);
    case PRETURN: case CIGNORE: case CEMPTY:
      return true;
    case PASSIGN: case PCALLID: 
    case PFUNCID:  case CRETURN:  case CPROCRETURN:
    case PWHILE: case PREPEAT: case PFOR: 
    case PEXIT: case PGOTO:
      return false;
    case PBEGIN: case PIF:  case PCASE:
      return wtail(t->previous);
    default: ERROR("Unexpected tag %s while searching for tail statements",TAG(t));
  }
}
@

The function |wreturn| accomplishes the main task. It is called by the
parser, when it has completed the parsing of the function body with
parameter |t| pointing to the parse tree of the entire body.  The
parameter |tail|, which tells us if the parse tree |t| is in a tail
position, is then set to true.  The link parameter, pointing to a
possible |PRETURN| token, is |NULL|.

@<external declarations@>=
extern void wreturn(token *t, int tail, token *link);
@

The function |wreturn| calls itself recursively to find and convert
all instances where a \CEE/ return statement is appropriate.  If I
convert the \TeX\ macro ``\&{return}'' to 
a \CEE/ \&{return} statement, I decrement its
use-count. If at the end it is zero, I can omit the label {\it end}
marking the end of the function body.

@<functions@>=
void wreturn(token *t, int tail, token *link)
{ CHECK(t!=NULL,"Unexpected NULL token while searching for return statements");
  switch(t->tag)
  { case PSEMICOLON:
      if (t->next->tag==PRETURN)
        wreturn(t->previous,true,t->next);
      else 
      { wreturn(t->next,tail, link);
        if (wtail(t->next)) wreturn(t->previous, tail, link);
        else wreturn(t->previous,false,NULL);
      }
      return;
    case PCOLON: 
      wreturn(t->next, tail,link);
      return;
    case PASSIGN:  case PCALLID:
    case PRETURN: case PEXIT: case PGOTO: case CIGNORE: case CEMPTY:
      return;
    case PWHILE: case PREPEAT: case PFOR:
      wreturn(t->previous, false,NULL); return; 
    case PELSE: case CCASE:
       wreturn(t->next, tail,link); wreturn(t->previous, tail,link); return; 
    case PCASE: case PIF: case PBEGIN: 
       wreturn(t->previous, tail,link); return; 
    case PFUNCID:
       if (tail)
       { DBG(dbgreturn,"Converting assignment to function in line %d\n",t->lineno); 
         t->tag=CRETURN; IGN(t->next);
         if (link!=NULL) 
         { link->sym_ptr->value--;
           t->sym_ptr=link->sym_ptr;
           IGN(link), IGN(link->next); 
           DBG(dbgreturn,"Eliminating label %s (%d) in line %d\n",
              link->sym_ptr->name,link->sym_ptr->value,t->lineno);
         }
       }
    return;
    case CRETURN: /* this happened when the return; is inside a macro */
      if (t->sym_ptr!=NULL) {
        t->sym_ptr->value--;
        DBG(dbgreturn,"Eliminating label %s (%d) in line %d\n",
           t->sym_ptr->name,t->sym_ptr->value,t->lineno);
    }
    return;
    default: ERROR("Unexpected tag %s in line %d"
             " while searching for return statements",TAG(t), t->lineno);
  }
}
@

After these precautions, there are only two functions left: |x_over_n|
in line 2273 and |xn_over_d| in line 2306.  
These need a special local
variable matching the function name in the assignment and a trailing
\&{return} statement.

I have two global variables to hold the symbol numbers of the two function names.
@<external declarations@>=
extern int x_over_n, xn_over_d;
@
@<global variables@>=
int x_over_n, xn_over_d;
@
@<initialize token list@>=
x_over_n=get_sym_no("x_over_n");
xn_over_d=get_sym_no("xn_over_d");
@

While parsing, I check for these two function names and change the
initial |PBEGIN| to an |PFBEGIN| and the trailing |PEND| to |PFEND|,
setting the |sym_no| of these tokens to the symbol number of the
function name. Now I can generate the definition of a local variable
with the same name as the function (shadowing the function name) at
the beginning and a matching return statement at the end.

@<convert |t| from \WEB/ to \cweb/@>=
case PFBEGIN:
  DBG(dbgcweb,"Adding scaled %s; in line %d\n",SYM(t)->name,t->lineno);
  wprint("scaled");wid(t); wputs("; ");
  t=t->next;
  break;
case PFEND:
  DBG(dbgcweb,"Adding return %s; in line %d\n",SYM(t)->name,t->lineno);
  wprint("return");wid(t); wputs(";}");
  t=t->next;
  break;
@

While converting the token list, I check for |PFUNCID| and |CRETURN| tokens
@<convert |t| from \WEB/ to \cweb/@>=
case PFUNCID:
  DBG(dbgcweb,"function %s in line %d assigns result variable\n",SYM(t)->name,t->lineno);
  wid(t); 
  t=t->next;
  break;
case CRETURN:
  DBG(dbgcweb,"Converted function return %s in line %d\n",SYM(t)->name,t->lineno);
  wprint("return");
  t=t->next;
  break;
case CPROCRETURN:
  if (t->sym_ptr->value <=0)  wprint("return");
  else wprint("goto end");
  t=t->next;
  break;
@ 

\subsection{The |main| program}

While parsing the \Pascal/ program, I change the |PBEGIN| token
starting the main program\index{main program+\\{main} program} 
to a |CMAIN| token. Now I replace it by the
heading of the main program.  Similarly I deal with the |PEND| ending
the main program.

@<convert |t| from \WEB/ to \cweb/@>=
case CMAIN:@+  wprint("int main(void) {");@+t=t->next;@+  break;
case CMAINEND:@+  wprint("return 0; }");@+t=t->next;@+  break;
@

\section{Predefined symbols in Pascal}

I  put predefine function- and
constant-names of \Pascal/ into the symbol table. 
I~omit predefined symbols\index{predefined symbol}
that are not used in \TeX.
\index{put+\\{put}}%
\index{get+\\{get}}%
\index{reset+\\{reset}}%
\index{rewrite+\\{rewrite}}%
\index{abs+\\{abs}}%
\index{odd+\\{odd}}%
\index{eof+\\{eof}}%
\index{eoln+\\{eoln}}%
\index{round+\\{round}}%
\index{ord+\\{ord}}%
\index{chr+\\{chr}}%
\index{close+\\{close}}%
\index{read+\\{read}}%
\index{read_ln+\\{read_ln}}%
\index{write+\\{write}}%
\index{write_ln+\\{write_ln}}%
\index{break+\\{break}}%
\index{break_in+\\{break_in}}%
\index{erstat+\\{erstat}}%
\index{false+\\{false}}%
\index{true+\\{true}}%

@<initialize token list@>=
predefine("put",PPROCID,0); 
predefine("get",PPROCID,0); 
predefine("reset",PPROCID,0); 
predefine("rewrite",PPROCID,0); 
predefine("abs",PFUNCID,0); 
predefine("odd",PFUNCID,0); 
predefine("eof",PFUNCID,0); 
predefine("eoln",PFUNCID,0); 
predefine("round",PFUNCID,0); 
predefine("ord",PFUNCID,0); 
predefine("chr",PFUNCID,0); 
predefine("close",PPROCID,0); 
predefine("read",PPROCID,0); 
predefine("read_ln",PPROCID,0); 
predefine("write",PPROCID,0); 
predefine("write_ln",PPROCID,0); 
predefine("break",PPROCID,0); 
predefine("break_in",PPROCID,0); 
predefine("erstat",PFUNCID,0); 
predefine("false",PCONSTID,0);
predefine("true",PCONSTID,1);
@

% also predefined but not needed for TeX
%predefine("type",PTYPE,0);   /* type is redefined */
%predefine("text",PTYPEID,0); /* text is used as a macro */
%predefine("succ",PFUNCID,1); 
%predefine("pred",PFUNCID,1); 
%predefine("new",PPROCID,1); 
%predefine("dispose",PPROCID,1); 
%predefine("sqr",PFUNCID,1);
%predefine("sin",PFUNCID,1); 
%predefine("cos",PFUNCID,1); 
%predefine("exp",PFUNCID,1); 
%predefine("ln",PFUNCID,1); 
%predefine("sqrt",PFUNCID,1); 
%predefine("arctan",PFUNCID,1); 
%predefine("trunc",PFUNCID,1); 
%predefine("readln",PPROCID,0); 
%predefine("writeln",PPROCID,0); 
%predefine("page",PPROCID,0); 




%Some need to be translated to C directly
%  OCTAL HEX ATDOLLAR ATLEFT ATRIGHT ATT ATEQ ATBACKSLASH 


%More complicated are (possibly) the following
% ELIPSIS ATQM

\section{Processing the command line}
The |usage| function explains command line\index{command line} 
parameters and options\index{option}\index{debugging}.
@<functions@>=
void usage(void)
{ fprintf(stderr,
  "Usage: web2w [parameters] filename.web\n"@/
  "Parameters:\n"@/
  "\t -p   \t generate a pascal output file\n"@/
  "\t -o file   \t specify an output file name\n"@/
  "\t -l   \t redirect stderr to a log file\n"@/
  "\t -y   \t generate a trace while parsing pascal\n"@/
  "\t -d XX\t hexadecimal debug value. OR together these values:\n"@/
  "\t \t   \t XX=1   basic debugging\n"@/
  "\t \t   \t XX=2   flex debugging\n"@/
  "\t \t   \t XX=4   link debugging\n"@/
  "\t \t   \t XX=8   token debugging\n"@/
  "\t \t   \t XX=10  identifier debugging\n"@/
  "\t \t   \t XX=20  pascal tokens debugging\n"@/
  "\t \t   \t XX=40  expansion debugging\n"@/
  "\t \t   \t XX=80  bison debugging\n"@/
  "\t \t   \t XX=100 pascal parser debugging\n"@/
  "\t \t   \t XX=200 cweb debugging\n"@/
  "\t \t   \t XX=400 join debugging\n"@/
  "\t \t   \t XX=800 string pool debugging\n"@/
  "\t \t   \t XX=1000 for variables debugging\n"@/
  "\t \t   \t XX=2000 for real division debugging\n"@/
  "\t \t   \t XX=4000 for macro debugging\n"@/
  "\t \t   \t XX=8000 for array debugging\n"@/
  "\t \t   \t XX=10000 for return debugging\n"@/
  "\t \t   \t XX=20000 for semicolon debugging\n"@/
  "\t \t   \t XX=40000 for break debugging\n"@/
  );  
  exit(1);
}
@
The different debug values are taken from an enumeration type.
@<external declarations@>=
typedef enum {dbgnone=0x0, 
              dbgbasic=0x1, 
              dbgflex=0x2, 
              dbglink=0x4, 
              dbgtoken=0x8, 
              dbgid=0x10, 
              dbgpascal=0x20, 
              dbgexpand=0x40, 
              dbgbison=0x80,
              dbgparse=0x100,
              dbgcweb=0x200,
              dbgjoin=0x400,
              dbgstring=0x800,
              dbgfor=0x1000,
              dbgslash=0x2000,
              dbgmacro=0x4000,
              dbgarray=0x8000,
              dbgreturn=0x10000,
              dbgsemicolon=0x20000,
	      dbgbreak=0x40000
            } debugmode;
@

Processing the command line looks for options and then sets the
basename\index{basename}.

@<external declarations@>=
extern FILE *logfile;
extern int ww_flex_debug;
extern debugmode debugflags;
@
@<global variables@>=
#define MAX_NAME 256
static char basename[MAX_NAME];
static FILE *w=NULL;
static FILE *pascal=NULL;
FILE *logfile=NULL;
debugmode debugflags=dbgnone;
@

@<process the command line@>=
{ int mk_logfile=0, mk_pascal=0, baselength=0;
  char *w_file_name=NULL;
  ww_flex_debug=0;
  ppdebug=0;
  if (argc < 2) usage();
  argv++; /* skip the program name */
  while (*argv!=NULL)
  { if ((*argv)[0]=='-')
    { char option=(*argv)[1];
      switch(option)
      { default: usage();
        case 'p': mk_pascal=1; @+break;
        case 'o': argv++;@+ w_file_name=*argv;@+ break; 
        case 'l': mk_logfile=1; @+break;
        case 'y': ppdebug=1; @+break;
        case 'd': @/
          argv++; if (*argv==NULL) usage();
          debugflags=strtol(*argv,NULL,16);
          if (debugflags&dbgflex) ww_flex_debug=1; 
          if (debugflags&dbgbison) ppdebug=1; 
          break;
      }
    }
    else
    { strncpy(basename,*argv,MAX_NAME-1);
      baselength=strlen(basename)-4;
      if (baselength<1 || strncmp(basename+baselength,".web",4)!=0) usage();
      basename[baselength]=0;
      if (*(argv+1)!=NULL) usage();
    }
    argv++;
  }
  @<open the files@>@;
}
@
After the command line has been processed, four file streams need to be opened:
|win|, the input file\index{input file};
|w|, the output file\index{output file};
|logfile|, if a log file\index{log file} is asked for;
and |pascal|, if the output of the pascal code is requested.
For technical reasons, the scanner generated by \.{flex} needs
an output file |wwout|. The log file is opened first because
this is the place where error messages\index{error message} 
should go while the other files are opened.

@<open the files@>=
  if (mk_logfile)
  { basename[baselength]=0;
    strcat(basename,".log");
    logfile=freopen(basename,"w",stderr);
    if (logfile==NULL)
    { fprintf(stderr,"Unable to open logfile %s",basename);
      logfile=stderr;
    }
    wwout=logfile;
  }
  else
  { logfile=stderr;
    wwout=stderr;
  }
  basename[baselength]=0;
  strcat(basename,".web");
  wwin=fopen(basename,"r");
  if (wwin==NULL) ERROR("Unable to open input file %s",basename);
  if (w_file_name==NULL)
  {  w_file_name=basename;
     basename[baselength]=0;
     strcat(basename,".w");
  }
  w=fopen(w_file_name,"w");
  if (w==NULL) ERROR("Unable to open output file %s",w_file_name);
  if (mk_pascal)
  { basename[baselength]=0;
    strcat(basename,".pas");
    pascal=fopen(basename,"w");
    if (pascal==NULL) ERROR("Unable to open pascal file %s",basename);
  }
@



\section{Error handling and debugging}
There is no good program without good error handling\index{error handling}\index{debugging}. 
To print messages\index{message} or indicate errors I define the following macros:
@<external declarations@>=
#include <stdlib.h>
#include <stdio.h>
#define MESSAGE(...) @[(fprintf(logfile,__VA_ARGS__),fflush(logfile))@]
#define ERROR(...)   (fprintf(logfile,"ERROR: "),\
              MESSAGE(__VA_ARGS__),fprintf(logfile,"\n"),exit(1))
#define CHECK(condition,...) (!(condition)? ERROR(__VA_ARGS__):0)
@

To display the content of a token I can use |THE_TOKEN|.
@<external declarations@>=
#define THE_TOKEN(t) @["%d\t%d: %s\t[%s]\n",\
   t->lineno,t->sequenceno,token2string(t),tagname(t->tag)@]
@

The amount of debugging\index{debugging} depends on the debugging flags.
@<external declarations@>=
#define DBG(flags,...) {@+if(debugflags & flags) MESSAGE(__VA_ARGS__);@+}
#define DBGTOKS(flags, from,to)  { if (debugflags & flags) \
{ token *t=from;  MESSAGE("<<");\
  while (t!=to) {  MESSAGE("%s",token2string(t)); t=t->next;}\
MESSAGE(">>\n"); }}

#define TAG(t) (t?tagname(t->tag):"NULL")

#define DBGTREE(flags,t) DBG(flags,"%s -> %s | %s | %d\n",TAG(t),\
        TAG(t->previous),TAG(t->next),t->value)

@



\section{The scanner}
\label{scanner}%
{\index{scanner}\index{web.l+\.{web.l}}\small
\input web.l.tex
}

\section{The parser}
\label{parser}%
The following code is contained in the 
file \.{pascal.y}\index{parser}\index{pascal.y+\.{pascal.y}}.
It represents a modified grammar\index{grammar} for the \Pascal/ language.
Here and throughout of this document,
terminal symbols\index{terminal symbols}, or tokens\index{token}, are shown using a small caps font;
for nonterminal symbols\index{nonterminal symbol} 
I use a slanted font.

\medskip
{\small
\input pascal.y.tex
}

\section{Generating \TeX, Running \TeX, and Passing the Trip Test}
\label{triptest}%
Here I give a step by step instruction on how to get \TeX\ up and 
running\index{running TeX+running \TeX} 
and finally, how to pass Donald Knuth's trip test\index{trip test}.

I assume that you have a Unix/Linux system with a terminal window but other
operating systems might work as well as long as you have access to the internet (I need
files from \.{www.ctan.org}\index{CTAN}), an \.{unzip} program (because packages on \.{www.ctan.org}
come in \.{.zip} files), and a \CEE/ compiler.

The recommended, short, and easy way is to start with the file \.{ctex.w} 
the \cweb/ version of \.{tex.web}. 
After all, this is the reason for the whole \web2w/ project:
to provide you with a \cweb/ version of \TeX\ that is much easier to use
than the original \WEB/ version of \TeX. But if you insist, there is also
a subsection below that explains how to get \web2w/ up and
running and use it to generate the \.{ctex.w} file.

\subsection{Generating \TeX}
\enumerate
\index{generating TeX+generating \TeX}
\item
\label{start}%
Download the \web2w/ package from \.{www.ctan.org} and
expand the files. Open a terminal window and navigate to
the root directory of the package. This directory will
be called the \.{web2w} directory in the following.
It contains a \.{Makefile} that contains most of the commands
that are explained in the following.


\item
In the \.{web2w} directory are the files 
\.{ctex.c}\index{ctex.c+\.{ctex.c}} and \.{ctex.tex}\index{ctex.tex+\.{ctex.tex}}. If you
want to use them, go to step \enumref{compile}; if you want to build
them yourself, continue with the next step.

\item 
\label{cweb1}%
\TeX\ and \web2w/ are written as literate programs. To use them,
you need the \.{cweb}\index{cweb+\.{cweb}} tools \.{ctangle}\index{ctangle+\.{ctangle}} 
and \.{cweave}\index{cweave+\.{cweave}} that I build now.
 
Since the \TeX\ program is
a pretty big file, you can not use the standard configuration
even if you have   \.{ctangle} and \.{cweave} already installed.

Now download the \.{cweb} package from \.{www.ctan.org} and expand
the files in the \.{web2w} directory creating the subdirectory \.{cweb}.

Change to this subdirectory and try \.{make}. If it builds \.{ctangle}
and \.{cweave} (using the preinstalled programs) skip the next step.

\item 
\label{cweb2}%
If it complains that it can not find \.{ctangle} then it's trying
to bootstrap \.{ctangle} from \.{ctangle.w} without having \.{ctangle}
to begin with.  Try \.{touch *.c} and try \.{make} again. This time it
should try to make \.{ctangle} from \.{ctangle.c} and \.{common.c},
running:

\.{cc -g  -c -o ctangle.o ctangle.c}

\.{cc -g -DCWEBINPUTS="/usr/local/lib/cweb" -c common.c}

\.{cc -g -o ctangle ctangle.o common.o}

\noindent
Now you should have \.{ctangle}. Then building \.{cweave} should be no problem
by running \.{make}.


\item 
\label{cweb3}%
Next I need to patch \.{ctangle.w}, \.{cweave.w}, and \.{common.w}
to enlarge the settings for various parameters. Change to the \.{cweb} subdirectory
and run the commands

\.{patch --verbose cweave.w ../cweave.patch}

\.{patch --verbose ctangle.w ../ctangle.patch}

\.{patch --verbose common.w ../common.patch}

\.{make}

\noindent
If you do not have the \.{patch} program, look at the patch files
and read them as instructions how to change the settings in
 \.{ctangle.w}, \.{cweave.w}, and \.{common.w}; you can do these small changes easily
with any text editor yourself.

The final \.{make} should produce a new \.{ctangle} and \.{cweave} by running the
old \.{ctangle} on the new \.{ctangle.w}, \.{cweave.w}, and
\.{common.w}.
The \.{cweb} directory contains change files to adapt the programs to particular
operating systems and it might be a good idea to use them. On an Win32 machine, for
example, you might want to write

\.{./ctangle ctangle.w ctang-w32.ch}

\.{./ctangle cweave.w cweav-w32.ch}

\.{./ctangle common.w comm-w32.ch}

Then run the \CEE/ compiler again as in the previous step.

\item
\label{creating}%
Now you use your extra powerful \.{ctangle} and \.{cweave} from step~\enumref{cweb3},
return to the \.{web2w} directory, 
and generate \.{ctex.c} and \.{ctex.tex} simply by running the
commands

\.{cweb/ctangle ctex.w}

\.{cweb/cweave ctex.w}


\item
\label{compile}%
Compiling\index{compiling} \.{ctex.c} is pretty easy: use the command

\.{cc ctex.c -lm -o ctex}

\noindent
The \.{-lm} tells it to link in the \CEE/ math library. 
You may add other options like \.{-g} or \.{-O3} as you like.
What you have now is the virgin \TeX\ program (also called \.{VIRTEX}).

\item
If you have \TeX\ on your system, you can generate the documentation with the command

\.{tex ctex.tex} \quad or\quad \.{pdftex ctex.tex}.

\noindent
Otherwise, you will have to wait until step~\enumref{documentation}.

Note that the above commands will need the files \.{ctex.idx} and \.{ctex.scn}.
These are part of the \.{web2w} package and are produced as a side effect of 
running \.{cweave} on \.{ctex.w}.


\advance\leftskip by-\parindent
\subsection{Running \TeX}
\advance\leftskip by\parindent
\item Producing ``Hello world!'' with \.{ctex}.\index{running TeX+running \TeX}

There are some differences between the plain \TeX\ that you have
generated now and the \TeX\ that you get if you install one of the
large and convenient \TeX\ distributions.  First, there is no
sophisticated searching for font files, formats, and tex input files
(as usually provided by the \.{kpathsea} library), instead files are
looked up in the current directory or in the subdirectories
\.{TeXfonts}\index{TeXfonts+\.{TeXfonts}}, \.{TeXformats}\index{TeXformats+\.{TeXformats}}, 
and \.{TeXinputs}\index{TeXinputs+\.{TeXinputs}}. Second, the plain 
\TeX\ that you have now does not come with preloadable format files, 
you have to generate them first. So let's get started with populating
the subdirectories just mentioned with the necessary files from
the \.{www.ctan.org} archives.

The first file is the \.{plain.tex}\index{plain.tex+\.{plain.tex}} file. 
You find it  on  \.{www.ctan.org}
in the \.{lib} subdirectory
of \.{systems/knuth/dist/}. This file defines the plain \TeX\ format; save it to
the \.{TeXinputs} subdirectory. 

Now, do the same for the file \.{hyphen.tex}\index{hyphen.tex+\.{hyphen.tex}}
(same source same destination directory) containing basic hyphenation patterns.


\item Next, you need the \TeX\ font metric files\index{font metric file}.
Download the  package ``\.{cm-tfm}---Metric files for the Computer Modern fonts''
from \.{www.ctan.org} and unpack the files in \.{tfm.zip} into the
\.{TeXfonts} subdirectory.

\item Now you need to create \.{cinitex}\index{cinitex+\.{cinitex}}, a special version of \TeX\ that is
able to initialize all its internal data structures and therefore does not depend
on format files; instead it can be used to create format files.
Special versions of \.{ctex} can be created by defining the \CEE/ macros \.{DEBUG},
\.{INIT}, or \.{STAT} on the command line. So (compare step~\enumref{compile}) run the command

\.{cc -DINIT ctex.c -lm -o cinitex}

\item Ready? Start \.{cinitex} and see what happens.
The dialog with \.{cinitex} should follow the
outline below. \TeX's output is shown in typewriter style, your input is shown in italics.

\.{This is TeX, Version 3.14159265 (HINT) (INITEX)}\par
\.{**}{\it plain}\par
\.{(TeXinputs/plain.tex Preloading the plain format: codes,}\par
\.{registers, parameters, fonts, more fonts, macros,}\par
\.{math definitions, output routines,}\par
\.{hyphenation (TeXinputs/hyphen.tex))}\par
\.{*}{\it Hello world!}\par
\.{}\par
\.{*}{\it $\backslash$end}\par
\.{[1]}\par
\.{Output written on plain.dvi (1 page, 224 bytes).}\par
\.{Transcript written on plain.log.}\par

\noindent
Well that's it. You should now have a file \.{plain.dvi} which you can open with any
run-of-the-mill dvi-viewer.

\item 
\label{format}%
To do the same with the virgin \.{ctex} program, you need a \.{plain.fmt} file
which I produce next. Start \.{cinitex} again. This time your dialog should be as follows:

\.{This is TeX, Version 3.14159265 (HINT) (INITEX)}\par
\.{**}{\it plain $\backslash$dump}\par
\.{(TeXinputs/plain.tex Preloading the plain format: codes,}\par
\.{registers, parameters, fonts, more fonts, macros,}\par
\.{math definitions, output routines,}\par
\.{hyphenation (TeXinputs/hyphen.tex))}\par
\.{Beginning to dump on file plain.fmt}\par
\.{ (preloaded format=plain 1776.7.4)}\par
\.{1338 strings of total length 8447}\par
\.{4990 memory locations dumped; current usage is 110\AM4877}\par
\.{926 multiletter control sequences}\par
\.{\BS font\BS nullfont=nullfont}\par
{\medskip$\qquad\vcenter{\vdots}$\smallskip}
\.{\font\preloaded=manfnt}\par
\.{14707 words of font info for 50 preloaded fonts}\par
\.{14 hyphenation exceptions}\par
\.{Hyphenation trie of length 6075 has 181 ops out of 500}\par
\.{  181 for language 0}\par
\.{No pages of output.}\par
\.{Transcript written on plain.log}\par

\noindent
Now you should have a file \.{plain.fmt}. Move it to the \.{TeXformats/} subdirectory,
where plain \.{ctex} will find it, and you are ready for the final ``Hello world!'' step.

\item  Start the virgin \.{ctex} program and answer as follows:

\.{This is TeX, Version 3.14159265 (HINT) (no format preloaded)}\par
\.{**}{\it $\AM$plain}\par
\.{*}{\it Hello world!}\par
\.{*}{\it $\backslash$end}\par
\.{[1]}\par
\.{Output written on texput.dvi (1 page, 224 bytes).}\par
\.{Transcript written on texput.log}\par

\noindent
The  ``$\AM$'' preceding ``{\it plain}'' tells \TeX\ that this is a format file.
Your dvi output is now in the \.{texput.dvi} file.

\item If you have \.{ctex.tex} from step~\enumref{creating},
\.{ctex} from step~\enumref{compile}, and \.{plain.fmt} from step~\enumref{format}, 
producing \.{ctex.dvi} using \.{ctex} itself seems like a snap.
Running \.{ctex} on \.{ctex.tex} will, however, need the include file \.{cwebmac.tex} which
you should have downloaded already with the \.{cweb} sources in step~\enumref{cweb1};
copy it to the \.{TeXinputs/} subdirectory.  Then \.{ctex.tex} will further need the
\.{logo10.tfm} file from the mflogo fonts package. Download the file from the
\.{fonts/mflogo/tfm} directory (part of the mflogo package) on  \.{www.ctan.org}
and place it in the \.{TeXfonts} subdirectory.

Unfortunately \TeX\ is a real big program and you need not only a super \.{ctangle}
and \.{cweave}, you need also a super \TeX\ to process it. The out-of-the box \.{ctex}
will end with a  ``{\tt ! TeX capacity exceeded, sorry [main memory size=30001].}''

So the next step describes how to get this super \TeX.

\item
\label{documentation}%
Take your favorite text editor and open the file \.{ctex.w}.
Locate the line  (this should be line 397) where it says \.{enum \{@@+@@!mem\_max=30000@@+\};}
and change the size to 50000. (You see how easy it is to change the code of \TeX\ now?)
It remains to run \.{ctangle} and \.{cc} to get the super \.{ctex}:

\.{cweb/ctangle ctex.w}\par
\.{cc ctex.c -lm -o ctex}\par

Now start super \.{ctex} and answer
{\it $\AM$plain ctex}. You should get \.{ctex.dvi} 

\advance\leftskip by-\parindent
\subsection{Passing the Trip Test}
\advance\leftskip by+\parindent
\item 
\label{proof}
Passing the trip test\index{trip test} is the last proof of concept!
 
Download the  package \.{tex.zip} from \.{www.ctan.org} 
which contains the files of \.{systems/knuth/dist/tex} (this is the
original \TeX\ distribution by Donald E. Knuth\index{Knuth, Donald E.}) and extract the files
into the \.{tex} subdirectory of \.{web2w} (see also step~\enumref{gettex} below).

Perform all the steps described in \.{tripman.tex} in the 
\.{tex} subdirectory (you might want to create a dvi file  with \.{ctex} before reading it)
replacing ``\.{tex.web}'' by ``\.{ctex.w}'' and  ``\.{tangle}'' by ``\.{ctangle}''. 
You should encounter
no difficulties (if yes, let me know) if you observe the following hints:
\itemize

\item Make a copy of \.{ctex.w} and modify the setting of constants as
required by step 2 of Knuths instructions. If you have the \.{patch} program,
you might want to use the file \.{triptest.patch} to get these changes.
 
\item After generating \.{ctex.c} from the modified \.{ctex.w} by running \.{ctangle},
compile \.{ctex.c}
with the options \.{-DINIT} and \.{-DSTAT} like this:

\.{cc -DINIT -DSTAT ctex.c -lm -o cinitex}\par

\noindent
Instead of setting \&{init} and \&{stats} in \.{ctex.w}, use the \.{-D} command line options.
\enditemize


\advance\leftskip by-\parindent
\subsection{Generating {\tt ctex.w} from {\tt tex.web}}
\advance\leftskip by+\parindent


\item To create \.{ctex.w} from \.{tex.web}, you need to build \.{web2w}, which
is written as a literate program. So you can start building it from the file 
\.{web2w.w} or use the file \.{web2w.c} which comes with the \.{web2w} package.
In the latter case, you can skip the next step.

\item
\label{web2w}%
You create \.{web2w.c}\index{web2w.c+\.{web2w.c}} and \.{web2w.h}\index{web2w.h+\.{web2w.h}} from \.{web2w.w} by running

\.{ctangle web2w.w}\quad or \quad \.{cweb/ctangle web2w.w}

\noindent
Any \.{ctangle} program should work here, but it doesn't harm if you use
your own \.{ctangle} created in step~\enumref{cweb3}. 

I do not describe how to produce \.{web2w.pdf} from \.{web2w.w}: First, because
you seem to have that file already if you are reading this, and second, because
it is a much more complicated process. In addition, if you like reading on paper
and prefer a nicely bound book over a mess of photocopies, you can buy this document
also as a book titled ``WEB to cweb''\cite{Ruckert:web2w}.

\item From \.{web2w.c}, \.{web2w.h}, \.{web.l}, and \.{pascal.y}, you get \.{web2w} by running

\.{flex -o web.lex.c web.l}

\.{bison -d -v  pascal.y}

\.{cc -o web2w web2w.c web.lex.c pascal.tab.c}

The first command produces the scanner \.{web.lex.c}; 
the second command produces the parser in two files 
\.{pascal.tab.c} and  \.{pascal.tab.h}.
If your version of \.{bison} does not support an api prefix, you can use the option \.{-p pp}
instead.
The last command invokes the \CEE/ compiler to create \.{web2w}.

\item 
\label{gettex}%
Next I want to run \.{tex.web} through \.{web2w}. To obtain \.{tex.web}
download the  package \.{tex.zip} from \.{www.ctan.org} 
which contains the files of the
original \TeX\ distribution by Donald E. Knuth
in directory \.{systems/knuth/dist/tex} and extract the files
into the \.{tex} subdirectory of \.{web2w} (see also step~\enumref{proof}).

\item Now I am ready to apply \.{web2w}. Run

\.{./web2w -o tex.w tex/tex.web}

\noindent
This command will produce \.{tex.w}, but I am not yet finished. I have to apply 
the patch file\index{patch file} \.{ctex.patch} to get the finished \.{ctex.w} like this:

\.{patch --verbose -o ctex.w tex.w ctex.patch}

\noindent
And \.{ctex.w} has been created.


\endenumerate





\plainsection{References}

{\baselineskip=11pt
\def\bfblrm{\small\rm}%
\def\bblem{\small\it}%
\bibliography{web2w}
\bibliographystyle{plain}
}
\plainsection{Index}
{
\def\_{{\tt \UL}} % underline in a string
\catcode`\_=\active \let_=\_ % underline is a letter
\input web2w.ind
}
