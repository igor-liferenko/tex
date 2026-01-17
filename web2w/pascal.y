%{
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

#include <stdio.h>
#include "web2w.h"

/* the tag=token number of the left hand side symbol of a rule */
#define LHSS (yyr1[yyn]+FIRST_PASCAL_TOKEN-3)

  static int function=0;

%}

%code requires { 
#define PPSTYPE token *
#define YYSTYPE PPSTYPE

  extern int ppparse(void);
  extern int ppdebug;
 }

%token-table
%defines
%error_verbose
%debug
%define api.prefix "pp"
%expect 1

%token PEOF 0    "end of file"
%token WEBEOF      "end of web"
%token HEAD
%token BAR
%token PLEFT 
%token MLEFT 
%token RIGHT
%token OPEN 
%token CLOSE
%token TEXT
%token NL 
%token HASH
%token NMACRO
%token OMACRO
%token PMACRO
%token PARAM
%token EQ 
%token EQEQ
%token ATSTAR
%token ATSPACE
%token ATD
%token ATF
%token ATLESS 
%token ATGREATER
%token ELIPSIS
%token ATP
%token OCTAL
%token HEX
%token ATAT
%token ATDOLLAR 
%token ATLEFT
%token ATRIGHT
%token ATINDEX
%token ATINDEXTT
%token ATINDEX9
%token ATT 
%token ATEQ
%token ATAND
%token ATBACKSLASH
%token ATEX
%token ATQM
%token ATCOMMA
%token ATSLASH
%token ATBAR
%token ATHASH
%token ATPLUS
%token ATSEMICOLON
%token STRING
%token CHAR
%token INDENT
%token METACOMMENT
%token CSEMICOLON
%token ID 

%token WDEBUG
%token WSTAT
%token WINIT
%token WTINI
%token WTATS
%token WGUBED

%token PRETURN  "return"

%token FIRST_PASCAL_TOKEN 

%token PPLUS	"+"
%token PMINUS	"-"
%token PSTAR	"*"
%token PSLASH	"/"
%token PEQ	"="
%token PNOTEQ	"<>"
%token PLESS	"<"
%token PGREATER	">"
%token PLESSEQ	"<="
%token PGREATEREQ	">="
%token POPEN	"("
%token PCLOSE	")"
%token PSQOPEN	"["
%token PSQCLOSE	"]"
%token PASSIGN	":="
%token PDOT	"."
%token PCOMMA	","
%token PSEMICOLON	";" 
%token PMOD	"mod"
%token PDIV	"div"
%token PNIL	"nil"
%token POR	"or"
%token PAND	"and"
%token PNOT	"not"
%token PIF	"if"
%token PTHEN	"then"
%token PELSE	"else"
%token PREPEAT	"repeat"
%token PUNTIL	"until"
%token PWHILE	"while"
%token PDO	"do"
%token PFOR	"for"
%token PTO	"to"
%token PDOWNTO	"downto" 
%token PBEGIN	"begin"
%token PEND	"end"
%token PGOTO	"goto"
%token PINTEGER	"0-9"
%token PREAL	"real"
%token POTHERS	"others"
%token PSTRING	"'...'"
%token PCHAR	"'.'"
%token PTYPECHAR "char type"
%token PTYPEBOOL "bool type"
%token PTYPEINT "integer type"
%token PTYPEREAL "real type"
%token PTYPEINDEX "index type"

%token PID	"identifier"
%token PDEFVARID "variable definition"
%token PDEFPARAMID "parameter definition"
%token PDEFREFID "reference parameter definition"
%token PCONSTID	"constant"
%token PDEFCONSTID	"constant definition"
%token PDEFTYPEID	"typename definition"
%token PDEFTYPESUBID	"subrange typename definition"
%token PARRAYFILETYPEID "array of file type"
%token PARRAYFILEID "array of file name"
%token PFUNCID	"functionname"
%token PDEFFUNCID	"functionname definition"
%token PPROCID	"procedurename"
%token PCALLID  "call"
%token PRETURNID "return value"


%token PEXIT    "final_end"
%token PFBEGIN  "function begin"
%token PFEND    "function end"
%token PDOTDOT	".."
%token PCOLON	":"
%token PUP	"^"
%token PIN	"in"
%token PCASE	"case"
%token POF	"of"
%token PWITH	"with"
%token PCONST	"const"
%token PVAR	"var"
%token PTYPE	"type"
%token PARRAY	"array"
%token PRECORD	"record"
%token PSET	"set"
%token PFILE	"file"
%token PFUNCTION	"function" 
%token PPROCEDURE	"procedure"
%token PLABEL	"label"
%token PPACKED	"packed"
%token PPROGRAM	"program"
%token PFORWARD	"forward"

%token CIGNORE
%token CLABEL
%token CLABELN
%token CINTDEF
%token CSTRDEF
%token CMAIN
%token CMAINEND
%token CUNION
%token CTSUBRANGE
%token CINT
%token CREFID "reference variable"
%token CRETURN  "C function return"
%token CPROCRETURN  "C procedure return"
%token CCASE    "C case"
%token CCOLON   "C :"
%token CBREAK   "break"
%token CEMPTY   "empty statement"
%%

program: programheading  globals  
         PBEGIN statements PEND PDOT 
         { CHGTAG($3,CMAIN); CHGTAG($5,CMAINEND); IGN($6); 
           wsemicolon($4,$5);
         }
       ;

programheading: PPROGRAM PID PSEMICOLON  {IGN($2); IGN($3); }
              ;

globals: labels constants types variables procedures ;


labels:
      | PLABEL labellist PSEMICOLON  { IGN($3); }
      ;

labellist: labeldecl
         | labellist PCOMMA labeldecl  { IGN($2); }  
         ;

labeldecl: NMACRO  {IGN($1); SYM($1)->obsolete=1; } 
         | PINTEGER  {IGN($1); }
         | PEXIT  {IGN($1); } 
         | labeldecl PPLUS PINTEGER  {IGN($2); IGN($3); } 
         ; 

constants: 
         | PCONST constdefinitions
         | PCONST constdefinitions conststringdefinition
         ; 

constdefinitions:  constdefinition
                |  constdefinitions  constdefinition 
                ;

constdefinition: PID PEQ PINTEGER PSEMICOLON { LNK($1,$2); LNK($2,$4);  
                   SETVAL($1,getval($3)); CHGID($1,PCONSTID);
                   CHGTAG($1,CINTDEF); }
               ;

conststringdefinition: PID PEQ PSTRING PSEMICOLON 
               { seq($1,$4); CHGID($1,PCONSTID);
                 CHGTAG($1,CSTRDEF);CHGTAG($2,PASSIGN); } 
                     ;


types:
     | PTYPE  typedefinitions { IGN($1); }
     ;

typedefinitions: typedefinition
               | typedefinitions typedefinition
               ;

typedefinition: PID PEQ subrange PSEMICOLON 
                                           { DBG(dbgparse,"New Subrange Type: %s\n",
						  SYM($1)->name);
                                              LNK($1,$2); IGN($2);LNK($2,$4);
                                              CHGTYPE($1,$3); 
                                              CHGTAG($1,PDEFTYPEID);
                                              CHGTAG($2,CTSUBRANGE); UP($2,$3);
                                             }
              | PID PEQ type PSEMICOLON 
                                           { DBG(dbgparse,"New Type: %s\n",
					      SYM($1)->name);
                                              LNK($1,$2); IGN($2); LNK($2,$4); 
                                              CHGTYPE($1,$3); LNK($3,$4);
                                              CHGTAG($1,PDEFTYPEID);
                                            }
              ;


subrange: iconst PDOTDOT iconst  
          {$$=join(PDOTDOT,$1,$3,$3->value-$1->value+1); }
        | PTYPECHAR  
          {$$=join(PDOTDOT,join(PTYPECHAR,$1,$1,0),
                           join(PTYPECHAR,$1,$1,255),256); }
        ;

iconst: signed_iconst   {$$=$1; }
      | iconst PPLUS simple_iconst  
          {$$=join(PPLUS,$1,$3,$1->value+$3->value); }
      | iconst PMINUS simple_iconst  
          {$$=join(PMINUS,$1,$3,$1->value-$3->value); }
      ;

signed_iconst: simple_iconst   {$$=$1; }
             | PPLUS simple_iconst   {$$=join(PPLUS,NULL,$2,$2->value); }
             | PMINUS simple_iconst 
               {$$=join(PMINUS,NULL,$2,-($2->value)); }
             ;


simple_iconst: PINTEGER   {$$=join(PINTEGER,$1,NULL,getval($1)); }
             | NMACRO    {$$=join(NMACRO,$1,NULL,getval($1)); }
             | PCONSTID  {$$=join(PCONSTID,$1,NULL,getval($1)); }
             ;

file_type: packed PFILE POF typename  {$$=$2; }
         |packed PFILE POF subrange  {$$=$2; }
         ;

packed: PPACKED | ;

typename:  PTYPEINT {$$=NULL; }
        | PTYPEREAL  {$$=NULL; }
        | PTYPEBOOL  {$$=NULL; }
        | PID  {$$=NULL; }
        ;


record_type: packed PRECORD fields PEND  { LNK($2,$4); LNK($3,$4);  
                                        if ($3) CHGTAG($4,PSEMICOLON); else IGN($4); $$=NULL; }
           | packed PRECORD variant_part PEND  
             { LNK($2,$4); LNK($3,$4);  IGN($4); $$=NULL; }
           | packed PRECORD fields PSEMICOLON variant_part PEND 
             { LNK($2,$6); LNK($3,$4); LNK($5,$6); IGN($6); $$=NULL; }
           ;


fields: recordsection {$$=$1; }
      | fields PSEMICOLON recordsection  { LNK($1,$2); $$=$3; }
      ;

/* in a recordsection the first PID links to the PCOLON, 
   the recordsection points to the PCOLON 
*/
recordsection: {$$=NULL; }
             | recids PCOLON type {LNK($1,$2); IGN($2); $$=$2; }
             | recids PCOLON subrange 
               {LNK($1,$2); CHGTAG($2,CTSUBRANGE); UP($2,$3); $$=$2; }
             ;
      
/* recids point to the first PID which is changed to PDEFVARID */
recids: PID  {$$=$1;  CHGTAG($1,PDEFVARID); }
      | recids PCOMMA PID  {$$=$1; }
      ;

variant_part: PCASE PID POF variants {IGN($1);IGN($2); 
                                       CHGTAG($3,CUNION); $$=$3; }
            ;

variants: variant
        | variants variant 
        ;


variant: PINTEGER PCOLON POPEN recordsection PCLOSE  PSEMICOLON  
                 { IGN($1); IGN($2); IGN($3); 
                   LNK($4,$5); 
                   IGN($5); }
       | PINTEGER PCOLON POPEN recordsection  PSEMICOLON 
                               recordsection PCLOSE  PSEMICOLON 
                 { IGN($1); IGN($2); CHGTAG($3,PRECORD);  
                   LNK($3,$8); LNK($4,$5); LNK($6,$7); CHGTAG($7,PSEMICOLON); } 
       ;


type: typename
    | file_type 
    | record_type 
    ;




array_type: packed PARRAY PSQOPEN iconst PDOTDOT iconst PSQCLOSE 
            POF type {LNK($2,$3); 
                 UP($2,join(PDOTDOT,$4,$6,$6->value-$4->value+1)); 
                 LNK($3,$5); LNK($5,$7); LNK($7,$8);$$=$8; }
          | packed PARRAY PSQOPEN iconst PDOTDOT iconst PSQCLOSE 
            POF subrange {LNK($2,$3); 
                 UP($2,join(PDOTDOT,$4,$6,$6->value-$4->value+1)); 
                 LNK($3,$5); LNK($5,$7); LNK($7,$8);
                 CHGTAG($8,CTSUBRANGE); UP($8,$9);$$=$8; }
          | packed PARRAY PSQOPEN PID      PSQCLOSE POF type {LNK($2,$3); 
                 UP($2,$4);LNK($3,$4); LNK($4,$5); LNK($5,$6);$$=$6; }
          | packed PARRAY PSQOPEN PID      PSQCLOSE POF subrange 
             {LNK($2,$3); UP($2,$4); LNK($3,$4); LNK($4,$5); 
              LNK($5,$6); CHGTAG($6,CTSUBRANGE); UP($6,$7);$$=$6; }
          | packed PARRAY PSQOPEN PTYPECHAR  PSQCLOSE 
            POF type {LNK($2,$3); UP($2,join(PDOTDOT,
            join(PTYPECHAR,$1,$1,0),join(PTYPECHAR,$1,$1,255),256)); 
            $3->link=join(PTYPECHAR,$3,$5,256); $3->link->link=$5; 
             /* the PTYPECHAR comes from a macroexpansion, so we can not 
             link it directly */ LNK($5,$6); $$=$6; }
          ;

variables:
         | PVAR vardeclarations { IGN($1); }
         ;

vardeclarations: vardeclaration
               | vardeclarations vardeclaration  
               ;

vardeclaration: varids PCOLON type PSEMICOLON { LNK($1,$2);
                                                IGN($2); LNK($2,$4); }
              | varids PCOLON array_type PSEMICOLON { LNK($1,$2);
                                                      IGN($2); LNK($3,$4); LNK($2,$4); }
              | varids PCOLON subrange PSEMICOLON { LNK($1,$2); 
                                                    CHGTAG($2,CTSUBRANGE); UP($2,$3); LNK($2,$4); }
             ;
  

varids: entire_var  {CHGTAG($1,PDEFVARID); $$=$1; }
      | varids PCOMMA entire_var  {LNK($1,$3);$$=$3; }
      ;


procedures:
          | procedures procedure 
          | procedures function 
          ;

locals: PVAR localvardeclarations { CHGTAG($1,PBEGIN); } 
      | PLABEL locallabellist PSEMICOLON localvariables 
        { CHGTAG($1,PBEGIN); IGN($3); }
      ;

locallabellist: locallabeldecl
         | locallabellist PCOMMA locallabeldecl  {IGN($2); }  
         ;

locallabeldecl: NMACRO  {IGN($1);  SYM($1)->obsolete=1; localize($1); } 
         | PINTEGER  {IGN($1); }  
         | labeldecl PPLUS PINTEGER  {IGN($2); IGN($3); } 
         ; 


localvariables:
         | PVAR localvardeclarations { IGN($1); }
         ;

localvardeclarations: localvardeclaration
               | localvardeclarations localvardeclaration  
               ;

localvardeclaration: localvarids PCOLON type PSEMICOLON 
                 { LNK($1,$2); IGN($2); LNK($2,$4); }
              | localvarids PCOLON array_type PSEMICOLON 
                 { LNK($1,$2); IGN($2); LNK($3,$4); LNK($2,$4); }
              | localvarids PCOLON subrange PSEMICOLON 
                 { LNK($1,$2); CHGTAG($2,CTSUBRANGE); 
                   UP($2,$3); LNK($2,$4); }
             ;
localvarids: localentire_var  {CHGTAG($1,PDEFVARID); $$=$1; }
      | localvarids PCOMMA localentire_var  {LNK($1,$3);$$=$3; }
      ;

localentire_var: PID {$$=$1; localize($1); }
         | CREFID {$$=$1; CHGTAG($1,PID); 
            CHGID($1,PID); localize($1); } 
          ;




procedure: pheading locals  PBEGIN statements PEND  PSEMICOLON 
          {IGN($3); IGN($6);  wend($4,$5); wsemicolon($4,$5); 
           scope_close(); }
         | pheading PBEGIN statements PEND  PSEMICOLON 
	 { IGN($5); wend($3,$4); wsemicolon($3,$4);  scope_close(); }
         | pheading PFORWARD  PSEMICOLON { scope_close(); }
         ;
 
function: fheading  PBEGIN {function=1; } statements PEND  PSEMICOLON 
              {function=0; wreturn($4, 1,NULL); IGN($6);
               wsemicolon($4,$5); scope_close(); }
        | fheading locals   PBEGIN {function=1; } 
          statements PEND  PSEMICOLON 
	{ int f_no=$1->sym_no;
          function=0; 
          if (f_no==x_over_n || f_no==xn_over_d)
          { DBG(dbgcweb,"Discovered function %s; in line %d\n",
               SYM($1)->name,$1->lineno);
            CHGTAG($3,PFBEGIN); $3->sym_no=f_no;
            CHGTAG($6,PFEND); $6->sym_no=f_no; 
	  }
	  else
	    { IGN($3);
	      wreturn($5,1,NULL);
	    } 
	  wsemicolon($5,$6);
	  IGN($7);
	  scope_close();
	}
        ;

pid: PID {scope_open(); $$=$1; START_PARAM; }
   |PPROCID  {scope_open(); $$=$1; START_PARAM; } 
   |PFUNCID  {scope_open(); $$=$1; START_PARAM; } 
   ;

pheading: PPROCEDURE pid PSEMICOLON  
           { LNK($1,$3); CHGID($2,PPROCID); CHGVALUE($2,1); IGN($3); }
        | PPROCEDURE pid POPEN formals PCLOSE PSEMICOLON  
          { LNK($1,$3); CHGID($2,PPROCID); CHGVALUE($2,param_mask);
	    LNK($4,$5); IGN($6); }
        ;

fheading: PFUNCTION pid PCOLON typename PSEMICOLON  
          {$$=$2; LNK($1,$3); CHGID($2,PFUNCID); 
           CHGVALUE($2,1);IGN($3); LNK($3,$5); IGN($5); }
        | PFUNCTION pid POPEN formals PCLOSE 
          PCOLON typename PSEMICOLON {$$=$2; LNK($1,$3); 
             CHGID($2,PFUNCID); CHGVALUE($2,param_mask); 
              LNK($4,$5); LNK($5,$6); IGN($6); LNK($6,$8); IGN($8); }
        ;

formals: formalparameters {$$=$1; }
       | formals PSEMICOLON  formalparameters 
         { LNK($1,$2); CHGTAG($2,PCOMMA); $$=$3; }
       ;  

formalparameters: params PCOLON typename 
         { LNK($1,$2); IGN($2); $$=$2; } 
                ;

params: param {$$=$1; }
        | params PCOMMA param  {LNK($1,$3);$$=$3; }
        ;

param: entire_var  {NEXT_PARAM; CHGTAG($1,PDEFPARAMID); $$=$1; }
     | PVAR entire_var  {REF_PARAM; NEXT_PARAM; IGN($1);
        CHGTAG($2,PDEFREFID);CHGID($2,CREFID); $$=$2; }
     ;


proc_stmt: PPROCID POPEN args PCLOSE {CHGTAG($1,PCALLID); $$=$1; 
           UP($2,$1); pstring_args($1,$3); }
         | PCALLID POPEN args PCLOSE  
           {$$=$1; UP($2,$1); pstring_args($1,$3); }
         | PPROCID  {CHGTAG($1,PCALLID); $$=$1; }
         | PCALLID  { $$=$1; }
         ;

function_call: PFUNCID POPEN args PCLOSE  
               {CHGTAG($1,PCALLID); $$=$4; UP($2,$1); }
             | PCALLID POPEN args PCLOSE  { $$=$4; UP($2,$1); }
             | PFUNCID  {CHGTAG($1,PCALLID);$$=$1; }
             | PCALLID  {$$=$1; }
             ;


args: arg  {$$=$1; }
    | args PCOMMA arg  
      {if ($3==NULL) $$=$1; else if ($1==NULL) $$=$3; 
       else $$=join(PCOMMA,$1,$3,0); }
      ;

arg: expression {$$=$1; }
     | write_arg  {$$=$1; }
     | STRING  {$$=$1; }
     | CHAR  {$$=$1; }
     ;


write_arg: expression PCOLON expression {$$=$2; }
            ;

statements: statement {$$=$1; }
          | statements PSEMICOLON statement 
           {$$=join(PSEMICOLON,$1,$3,0); }

          ;

statement: stmt {$$=$1; }
         | label PCOLON stmt  { clabel($1,0);$$=join(PCOLON,$1,$3,0); } 
         | PEXIT PCOLON stmt  
           { IGN($1); IGN($2); $$=join(PCOLON,$1,$3,0); }
         ;

goto_stmt: PGOTO label  { clabel($2,1); $$=join(PGOTO,$2,NULL,0); }
         | PGOTO PEXIT  { IGN($1); $$=$2; }
         | CIGNORE PEXIT  { $$=$2; }
         | PRETURN  { if (function) clabel($1,1); 
           else { CHGTAG($1,CPROCRETURN);$1->sym_ptr->value++; }
                  $$=$1; }
         ;


label: PINTEGER 
     | NMACRO 
     | CLABEL 
     | NMACRO PPLUS PINTEGER  {seq($1,$3); $$=$1; }
     ; 



stmt: simple_stmt | structured_stmt ;

simple_stmt:  empty_stmt | assign_stmt | return_stmt | goto_stmt | proc_stmt  ;

empty_stmt: {$$=join(CEMPTY,NULL,NULL,0); } ;

assign_stmt: variable PASSIGN expression {$$=$2; }
           | variable PASSIGN STRING {$$=$2; pstring_assign($1,$3); }
           | variable PASSIGN POPEN STRING PCLOSE
             {$$=$2;  pstring_assign($1,$4); }
           ;

return_stmt: PFUNCID PASSIGN expression  { $$=$1; }
           | CRETURN CIGNORE expression {$$=$1; }
           | CRETURN CIGNORE expression CIGNORE CIGNORE 
             {$$=join(CRETURN,NULL,NULL,0);  }
           | CRETURN {$$=$1; }
           | CPROCRETURN {$$=$1; }
           ;
          

structured_stmt: compound_stmt | conditional_stmt | repetitive_stmt  ;

compound_stmt: PBEGIN statements PEND 
               {$$=join(PBEGIN,$2,NULL,0); wsemicolon($2,$3); } ;

conditional_stmt: if_stmt | case_stmt;

if_stmt: PIF expression PTHEN statement {$$=join(PIF,$4,NULL,0); }
       | PIF expression PTHEN statement PELSE statement 
       {wsemicolon($4,$5);  $$=join(PELSE,$4,$6,0); } 
       ;

case_stmt: PCASE expression POF case_list PEND {LNK($1,$3);
                wsemicolon($4,$5);$$=join(PCASE,$4,NULL,0); }
         | PCASE expression POF case_list PSEMICOLON PEND 
           {LNK($1,$3);$$=join(PCASE,$4,NULL,0); }
         ;

case_list: case_element 
         | case_list PSEMICOLON case_element {$$=join(CCASE,$1,$3,0); 
                                              wsemicolon($1,$2); CHGTAG($2,CBREAK); UP($2,$1); }
          | case_list CBREAK case_element
            {$$=join(CCASE,$1,$3,0); /* etex parses same module twice */ }
         ;

case_element: case_labels PCOLON statement { $$=$3; }
            | POTHERS statement {$$=$2; }
            ;

case_labels: case_label
           | case_labels PCOMMA  case_label 
             {CHGTAG($2,CCOLON); CHGTEXT($2,": "); }
           | case_labels CCOLON  case_label
           ;

case_label: PINTEGER { winsert_after($1->previous,CCASE,"case "); }
          | NMACRO { winsert_after($1->previous,CCASE,"case "); }
          | PINTEGER PPLUS NMACRO  
            {winsert_after($1->previous,CCASE,"case "); }
          | NMACRO PPLUS NMACRO  
            {winsert_after($1->previous,CCASE,"case "); }
          | NMACRO PPLUS PINTEGER  
            {winsert_after($1->previous,CCASE,"case "); }
          | CCASE NMACRO
          | CCASE PINTEGER
          | CCASE NMACRO PPLUS NMACRO 
          | NMACRO PMINUS NMACRO PPLUS NMACRO  
	  {winsert_after($1->previous,CCASE,"case ");  /* etex */ }
          ;

repetitive_stmt: while_stmt | repeat_stmt | for_stmt ;

while_stmt: PWHILE expression PDO statement 
            {LNK($1,$3); $$=join(PWHILE,$4,NULL,0); } ;

repeat_stmt: PREPEAT statements PUNTIL expression  
            { wsemicolon($2,$3); $$=join(PREPEAT,$2,NULL,0); } ;

for_stmt: PFOR PID PASSIGN expression PTO varlimit PDO statement
              { mark_for_variable($2,$1->lineno,0,VAR_LOOP); 
                DBG(dbgfor,"for variable %s, limit variable in line %d\n",
                SYM($2)->name,$2->lineno);
                $$=join(PFOR,$8,NULL,0);LNK($1,$5);LNK($5,$7); } 
        | PFOR PID PASSIGN expression PTO iconst PDO statement 
	      { mark_for_variable($2,$1->lineno,$6->value,TO_LOOP); 
                DBG(dbgfor,"for variable %s, limit up in line %d\n",
                SYM($2)->name,$2->lineno);
                $$=join(PFOR,$8,NULL,0);LNK($1,$5);LNK($5,$7); } 
        | PFOR PID PASSIGN expression PDOWNTO iconst PDO statement
	      { mark_for_variable($2,$1->lineno,$6->value,DOWNTO_LOOP); 
                DBG(dbgfor,"for variable %s, limit down in line %d\n",
                SYM($2)->name,$2->lineno);
                $$=join(PFOR,$8,NULL,0);LNK($1,$5);LNK($5,$7); } 
        ;

varlimit: variable | variable PMINUS expression | variable PPLUS expression| iconst PSTAR expression;

variable: PID
        | CREFID
        | indexed_var 
        | field_var 
        | file_var;


entire_var: PID {$$=$1; }
         | CREFID {$$=$1; CHGTAG($1,PID); CHGID($1,PID); } 
          ;

indexed_var: variable PSQOPEN expression PSQCLOSE 
           | variable PSQOPEN STRING PSQCLOSE 
           | PARRAYFILEID PSQOPEN expression PSQCLOSE 
           ;


field_var: variable PDOT PID 
         ;

file_var: variable PUP 
        ;

expression: simple_expr {$$=$1; }
          | simple_expr relop simple_expr {$$=$3; }
          | simple_expr PEQ STRING {$$=$3; }
          ;

relop: PEQ | PNOTEQ | PLESS | PLESSEQ | PGREATER | PGREATEREQ;

simple_expr: term  {$$=$1; }
           | sign term  {$$=$2; }
           | simple_expr addop term {$$=$3; }
           | simple_expr addop sign term  {$$=$4; }
           ;

sign: PPLUS | PMINUS ;

addop: PPLUS | PMINUS | POR ;

term: factor {$$=$1; }
    | term mulop factor  {$$=$3; }
    ;

mulop: PSTAR 
     | PSLASH { DBG(dbgslash,"Pascal / in line %d\n",$1->lineno); }
     | PDIV 
     | PMOD 
     | PAND ;

factor: variable 
      | unsigned_const
      | POPEN expression PCLOSE {$$=$3; }
      | function_call
      | PNOT factor  {$$=$2; }
      ;


unsigned_const: real
              | PINTEGER
              | NMACRO
              | PSTRING
              | PCHAR
              | PCONSTID
              ;

real: PREAL
    | PINTEGER PDOT PINTEGER  {$$=$3; /* used in line 2361 */};
 

%%

const char *tagname(int tag)
{ return yytname[YYTRANSLATE(tag)];
}
