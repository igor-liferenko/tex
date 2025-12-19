/*
This file is part of web2w.
Copyright 2017 Martin Ruckert

web2w is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

web2w is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with web2w.  If not, see <http://www.gnu.org/licenses/>.
 
Martin Ruckert, Hochschule Muenchen, Lothstrasse 64, 80336 Muenchen
*/
%{
#include "web2w.h"
#include "pascal.tab.h"
%}

%option prefix="ww"
%option noyywrap yylineno nounput noinput batch
%option debug

%x PASCAL MIDDLE DEFINITION FORMAT NAME

CONTROL        [^@\n]*
ID             [a-zA-Z][a-zA-Z0-9_]*
SP             [[:blank:]]*
STARSECTION    @\*{SP}(\\\[[0-9a-z]+\])?
SPACESECTION   @[[:space:]]{SP}
REAL           [0-9]+(\.[0-9]+(E[+-]?[0-9]+)?|E[+-]?[0-9]+)
DDD            {SP}\.\.\.{SP}
%%
                     /* WEB codes, see WEB User Manual page 7 ff*/
<INITIAL>{
{SPACESECTION}       EOS;TOK("@ ",ATSPACE);BOS;
{STARSECTION}        EOS;TOK("@*",ATSTAR); BOS;
@[dD]                EOS;TOK("@d ",ATD);BEGIN(DEFINITION);
@[fF]                EOS;TOK("@f ",ATF);BEGIN(FORMAT);
@[pP]                EOS;TOK("@p",ATP);PROGRAM;PUSH;SEQ;BEGIN(PASCAL);
@\<{SP}              EOS;TOK("@<",ATLESS);PUSH;BOS;BEGIN(NAME);

\{                   ADD;PUSH_NULL;
\}                   POP_LEFT;

\|                   EOS;TOK("|",BAR);PUSH;BEGIN(PASCAL);


@'[0-7]+             EOS;TOK(COPY,OCTAL);BOS;
@\"[0-9a-fA-F]+      EOS;TOK(COPY,HEX);BOS;
@\^{CONTROL}@\>      EOS;TOK(COPY,ATINDEX); BOS;
@\.{CONTROL}@\>      EOS;TOK(COPY,ATINDEXTT); BOS;
@\:{CONTROL}@\>      EOS;TOK(COPY,ATINDEX9); BOS;
@!                   EOS;TOK("@!",ATEX); BOS;
@\?                  EOS;TOK("@?",ATQM); BOS;
@@                   EOS;TOK("@@",ATAT);BOS;


\n                   ADD;
([^\\%@|{}.\n])*     ADD; /* we do not analyze TEX parts any further */
\\[\\%@|{}]          ADD;
\\                   ADD;
\%.*                 ADD;
.                    ADD;

<<EOF>>              EOS;TOK("",WEBEOF);return 0;
}

<MIDDLE>{
{SPACESECTION}       TOK("@ ",ATSPACE);POP;BOS;BEGIN(TEX);
{STARSECTION}        TOK("@*",ATSTAR); POP;BOS;BEGIN(TEX);
@[dD]                TOK("@d ",ATD);POP;BEGIN(DEFINITION);
@[fF]                TOK("@f ",ATF);POP;BEGIN(FORMAT);
@[pP]                TOK("@p",ATP);POP;PROGRAM;PUSH;SEQ;BEGIN(PASCAL);
@\<{SP}              TOK("@<",ATLESS);POP;PUSH;BOS;BEGIN(NAME);
\{                   TOK(" {",MLEFT);PUSH;BEGIN(TEX);BOS;
}

<DEFINITION>{
{ID}                  SYMBOL;
\(#\)                 TOK("(#)",PARAM);
=                     TOK("=",EQEQ);PUSH;DEF_MACRO(NMACRO);BEGIN(MIDDLE);
==                    TOK("==",EQEQ);PUSH;DEF_MACRO(OMACRO);BEGIN(MIDDLE);
[[:space:]]             ;
}

<FORMAT>{
begin                 TOK("if",PIF);
end                   TOK("if",PIF);
{ID}                  SYMBOL;
==                    TOK("==",EQEQ);PUSH;
\{                    TOK(" {",MLEFT);PUSH;BEGIN(TEX);BOS;
\n                    TOK("\n",NL);BEGIN(MIDDLE);
[[:space:]]           ;
}

<NAME>{
{SP}@\>                 EOS;AT_GREATER;BEGIN(PASCAL);
{DDD}@\>                EOS;TOK("...",ELIPSIS);AT_GREATER;BEGIN(PASCAL);
{SP}@\>{SP}=            EOS;AT_GREATER_EQ;BEGIN(PASCAL);
{DDD}@\>{SP}=           EOS;TOK("...",ELIPSIS);AT_GREATER_EQ;BEGIN(PASCAL);
[[:space:]]+            add_string(" ");
.                       ADD;
}


<PASCAL>{         
{SPACESECTION}    TOK("@ ",ATSPACE);POP;BOS;BEGIN(TEX);
{STARSECTION}     TOK("@*",ATSTAR);POP;BOS;BEGIN(TEX);
@\<{SP}           TOK("@<",ATLESS);PUSH;BOS;BEGIN(NAME);
\{                TOK(" {",PLEFT);PUSH;BEGIN(TEX);BOS;
}

<MIDDLE,PASCAL>{  
<<EOF>>              TOK("",WEBEOF);POP;return 0;

@'[0-7]+             TOK(COPY,OCTAL);
@\"[0-9a-fA-F]+      TOK(COPY,HEX);
@!                   TOK("@!",ATEX);
@\?                  TOK("@?",ATQM);
\|                   TOK("|",BAR);POP;BEGIN(TEX);BOS;
@t{CONTROL}@\>       TOK(COPY,ATT);
@={CONTROL}@\>       TOK(COPY,ATEQ);


\}                   ERROR("Unexpected }");
\(                   TOK("(",POPEN);PUSH; 
\)		     TOK(")",PCLOSE);POP;
#                    TOK("#",HASH);/* used in macros */



                     /* non Pascal tokens */ 
\n                   TOK("\n",NL);
@\^{CONTROL}@\>      TOK(COPY,ATINDEX);
@\.{CONTROL}@\>      TOK(COPY,ATINDEXTT);
@\:{CONTROL}@\>      TOK(COPY,ATINDEX9);
@\$                  TOK("@$",ATDOLLAR);
@\{                  TOK("@{",ATLEFT);
@\}                  TOK("@}",ATRIGHT);
@\{[^\n]*@\}         TOK(COPY,METACOMMENT);
@\&                  TOK("@&",ATAND);
@\\                  TOK("@\\",ATBACKSLASH);
@,                   TOK("@,",ATCOMMA);
@\/                  TOK("@/",ATSLASH);
@\|                  TOK("@|",ATBAR);
@\#                  TOK("@#",ATHASH);
@\+                  TOK("@+",ATPLUS);
@\;                 TOK("@;",ATSEMICOLON);

                /* Pascal tokens */
=		TOK("=",PEQ);
\+              TOK("+",PPLUS);
\-              TOK("-",PMINUS);
\*              TOK("*",PSTAR);
\/              TOK("/",PSLASH);
\<\>		TOK(" <> ",PNOTEQ);
\<		TOK(" < ",PLESS);
\>		TOK(" > ",PGREATER);
\<=             TOK(" <= ",PLESSEQ);
\>=             TOK(" >= ",PGREATEREQ);
\[		TOK("[",PSQOPEN); 
\]		TOK("]",PSQCLOSE);
:=		TOK(":=",PASSIGN);
\.		TOK(".",PDOT); 
\.\.		TOK("..",PDOTDOT);
,		TOK(",",PCOMMA); 
;		TOK(";",PSEMICOLON);
:		TOK(": ",PCOLON); 
\^		TOK("^",PUP);

		/* special coding trick in line 676 of tex.web */
t@&y@&p@&e	TOK("type",PTYPE);

                /* pascal keywords */
"mod"      TOK("mod",PMOD);
"div"      TOK("div",PDIV);
"nil"      TOK("nil",PNIL);
"in"      TOK("in",PIN); 
"or"      TOK("or",POR); 
"and"      TOK("and",PAND);
"not"      TOK("not",PNOT);
"if"      TOK("if",PIF); 
"then"      TOK("then",PTHEN);
"else"      TOK("else",PELSE); 
"case"      TOK("case",PCASE); 
"of"      TOK("of",POF); 
"others"      TOK("others",POTHERS);
"forward"      TOK("forward",PFORWARD);  
"repeat"      TOK("repeat",PREPEAT); 
"until"      TOK("until",PUNTIL); 
"while"      TOK("while",PWHILE); 
"do"      TOK("do",PDO);
"for"      TOK("for",PFOR);
"to"      TOK("to",PTO); 
"downto"      TOK("downto",PDOWNTO); 
"begin"      TOK("begin",PBEGIN); 
"end"      TOK("end",PEND); 
"with"      TOK("with",PWITH);
"goto"      TOK("goto",PGOTO);
"const"      TOK("const",PCONST);
"var"      TOK("var",PVAR);
"array"      TOK("array",PARRAY);
"record"      TOK("record",PRECORD);
"set"      TOK("set",PSET); 
"file"      TOK("file",PFILE); 
"function"      TOK("function",PFUNCTION); 
"procedure"      TOK("procedure",PPROCEDURE);
"label"      TOK("label",PLABEL); 
"packed"      TOK("packed",PPACKED);
"program"      TOK("program",PPROGRAM);
"char"         TOK("char",PTYPECHAR);
"integer"         TOK("integer",PTYPEINT);
"real"         TOK("real",PTYPEREAL);
"boolean"      TOK("boolean",PTYPEBOOL);

"endcases"     TOK("endcases",PEND);
"othercases"   TOK("othercases",POTHERS);
"mtype"        TOK("type",PTYPE);
"final_end"    TOK("final_end",PEXIT);

"return"       TOK_RETURN;

"debug"        TOK("debug",WDEBUG);
"gubed"        TOK("debug",WGUBED);
"stat"         TOK("stat",WSTAT);
"tats"         TOK("tats",WTATS);
"init"         TOK("init",WINIT);
"tini"         TOK("tini",WTINI);

{ID}                         SYMBOL;
\"([^"\n]|\"\")\"            TOK(COPY,CHAR);  /* single character string */
\"([^"\n]|\"\")*\"           WWSTRING; /* multiple character string */
\'([^'\n]|\'\'|@@)\'         TOK(COPY,PCHAR);
\'([^'\n]|\'\')*\'           TOK(COPY,PSTRING);
[0-9]+                       TOK(COPY,PINTEGER);
{REAL}                       TOK(COPY,PREAL);

^[[:space:]]+                TOK(COPY,INDENT);
[[:space:]]                  ; /* in Pascal mode we ignore spaces */


}





           /* anything that gets to this line 
              is an illegal character */
<*>.       { ERROR("Illegal %c (0x%02x) in line %d mode %d",
             yytext[0],yytext[0],yylineno, YY_START);}


%%

