/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_PP_PASCAL_TAB_H_INCLUDED
# define YY_PP_PASCAL_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef PPDEBUG
# if defined YYDEBUG
#if YYDEBUG
#   define PPDEBUG 1
#  else
#   define PPDEBUG 0
#  endif
# else /* ! defined YYDEBUG */
#  define PPDEBUG 1
# endif /* ! defined YYDEBUG */
#endif  /* ! defined PPDEBUG */
#if PPDEBUG
extern int ppdebug;
#endif
/* "%code requires" blocks.  */
#line 31 "pascal.y" /* yacc.c:1909  */
 
#define PPSTYPE token *
#define YYSTYPE PPSTYPE

  extern int ppparse(void);
  extern int ppdebug;
 

#line 61 "pascal.tab.h" /* yacc.c:1909  */

/* Token type.  */
#ifndef PPTOKENTYPE
# define PPTOKENTYPE
  enum pptokentype
  {
    PEOF = 0,
    WEBEOF = 258,
    HEAD = 259,
    BAR = 260,
    PLEFT = 261,
    MLEFT = 262,
    RIGHT = 263,
    OPEN = 264,
    CLOSE = 265,
    TEXT = 266,
    NL = 267,
    HASH = 268,
    NMACRO = 269,
    OMACRO = 270,
    PMACRO = 271,
    PARAM = 272,
    EQ = 273,
    EQEQ = 274,
    ATSTAR = 275,
    ATSPACE = 276,
    ATD = 277,
    ATF = 278,
    ATLESS = 279,
    ATGREATER = 280,
    ELIPSIS = 281,
    ATP = 282,
    OCTAL = 283,
    HEX = 284,
    ATAT = 285,
    ATDOLLAR = 286,
    ATLEFT = 287,
    ATRIGHT = 288,
    ATINDEX = 289,
    ATINDEXTT = 290,
    ATINDEX9 = 291,
    ATT = 292,
    ATEQ = 293,
    ATAND = 294,
    ATBACKSLASH = 295,
    ATEX = 296,
    ATQM = 297,
    ATCOMMA = 298,
    ATSLASH = 299,
    ATBAR = 300,
    ATHASH = 301,
    ATPLUS = 302,
    ATSEMICOLON = 303,
    STRING = 304,
    CHAR = 305,
    INDENT = 306,
    METACOMMENT = 307,
    CSEMICOLON = 308,
    ID = 309,
    WDEBUG = 310,
    WSTAT = 311,
    WINIT = 312,
    WTINI = 313,
    WTATS = 314,
    WGUBED = 315,
    PRETURN = 316,
    FIRST_PASCAL_TOKEN = 317,
    PPLUS = 318,
    PMINUS = 319,
    PSTAR = 320,
    PSLASH = 321,
    PEQ = 322,
    PNOTEQ = 323,
    PLESS = 324,
    PGREATER = 325,
    PLESSEQ = 326,
    PGREATEREQ = 327,
    POPEN = 328,
    PCLOSE = 329,
    PSQOPEN = 330,
    PSQCLOSE = 331,
    PASSIGN = 332,
    PDOT = 333,
    PCOMMA = 334,
    PSEMICOLON = 335,
    PMOD = 336,
    PDIV = 337,
    PNIL = 338,
    POR = 339,
    PAND = 340,
    PNOT = 341,
    PIF = 342,
    PTHEN = 343,
    PELSE = 344,
    PREPEAT = 345,
    PUNTIL = 346,
    PWHILE = 347,
    PDO = 348,
    PFOR = 349,
    PTO = 350,
    PDOWNTO = 351,
    PBEGIN = 352,
    PEND = 353,
    PGOTO = 354,
    PINTEGER = 355,
    PREAL = 356,
    POTHERS = 357,
    PSTRING = 358,
    PCHAR = 359,
    PTYPECHAR = 360,
    PTYPEBOOL = 361,
    PTYPEINT = 362,
    PTYPEREAL = 363,
    PTYPEINDEX = 364,
    PID = 365,
    PDEFVARID = 366,
    PDEFPARAMID = 367,
    PDEFREFID = 368,
    PCONSTID = 369,
    PDEFCONSTID = 370,
    PDEFTYPEID = 371,
    PDEFTYPESUBID = 372,
    PARRAYFILETYPEID = 373,
    PARRAYFILEID = 374,
    PFUNCID = 375,
    PDEFFUNCID = 376,
    PPROCID = 377,
    PCALLID = 378,
    PRETURNID = 379,
    PEXIT = 380,
    PFBEGIN = 381,
    PFEND = 382,
    PDOTDOT = 383,
    PCOLON = 384,
    PUP = 385,
    PIN = 386,
    PCASE = 387,
    POF = 388,
    PWITH = 389,
    PCONST = 390,
    PVAR = 391,
    PTYPE = 392,
    PARRAY = 393,
    PRECORD = 394,
    PSET = 395,
    PFILE = 396,
    PFUNCTION = 397,
    PPROCEDURE = 398,
    PLABEL = 399,
    PPACKED = 400,
    PPROGRAM = 401,
    PFORWARD = 402,
    CIGNORE = 403,
    CLABEL = 404,
    CLABELN = 405,
    CINTDEF = 406,
    CSTRDEF = 407,
    CMAIN = 408,
    CMAINEND = 409,
    CUNION = 410,
    CTSUBRANGE = 411,
    CINT = 412,
    CREFID = 413,
    CRETURN = 414,
    CPROCRETURN = 415,
    CCASE = 416,
    CCOLON = 417,
    CBREAK = 418,
    CEMPTY = 419
  };
#endif

/* Value type.  */
#if ! defined PPSTYPE && ! defined PPSTYPE_IS_DECLARED
typedef int PPSTYPE;
# define PPSTYPE_IS_TRIVIAL 1
# define PPSTYPE_IS_DECLARED 1
#endif


extern PPSTYPE pplval;

int ppparse (void);

#endif /* !YY_PP_PASCAL_TAB_H_INCLUDED  */
