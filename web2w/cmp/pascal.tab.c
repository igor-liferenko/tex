/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Substitute the type names.  */
#define YYSTYPE         PPSTYPE
/* Substitute the variable and function names.  */
#define yyparse         ppparse
#define yylex           pplex
#define yyerror         pperror
#define yydebug         ppdebug
#define yynerrs         ppnerrs

#define yylval          pplval
#define yychar          ppchar

/* Copy the first part of user declarations.  */
#line 20 "pascal.y" /* yacc.c:339  */

#include <stdio.h>
#include "web2w.h"

/* the tag=token number of the left hand side symbol of a rule */
#define LHSS (yyr1[yyn]+FIRST_PASCAL_TOKEN-3)

static int function=0;


#line 86 "pascal.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 1
#endif

/* In a future release of Bison, this section will be replaced
   by #include "pascal.tab.h".  */
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
#line 31 "pascal.y" /* yacc.c:355  */
 
#define PPSTYPE token *
#define YYSTYPE PPSTYPE

  extern int ppparse(void);
  extern int ppdebug;
 

#line 133 "pascal.tab.c" /* yacc.c:355  */

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

/* Copy the second part of user declarations.  */

#line 322 "pascal.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined PPSTYPE_IS_TRIVIAL && PPSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  5
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   581

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  165
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  97
/* YYNRULES -- Number of rules.  */
#define YYNRULES  251
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  457

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   419

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,   133,   134,
     135,   136,   137,   138,   139,   140,   141,   142,   143,   144,
     145,   146,   147,   148,   149,   150,   151,   152,   153,   154,
     155,   156,   157,   158,   159,   160,   161,   162,   163,   164
};

#if PPDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   219,   219,   226,   229,   232,   233,   236,   237,   240,
     241,   242,   243,   246,   247,   248,   251,   252,   255,   260,
     266,   267,   270,   271,   274,   282,   292,   294,   299,   300,
     302,   306,   307,   308,   313,   314,   315,   318,   319,   322,
     322,   324,   325,   326,   327,   331,   333,   335,   340,   341,
     347,   348,   349,   354,   355,   358,   362,   363,   367,   371,
     378,   379,   380,   386,   390,   395,   397,   400,   408,   409,
     412,   413,   416,   418,   420,   425,   426,   430,   431,   432,
     435,   436,   440,   441,   444,   445,   446,   450,   451,   454,
     455,   458,   460,   462,   466,   467,   470,   471,   478,   481,
     483,   486,   486,   489,   489,   509,   510,   511,   514,   516,
     521,   524,   530,   531,   535,   539,   540,   543,   544,   549,
     551,   553,   554,   557,   559,   560,   561,   565,   566,   571,
     572,   573,   574,   578,   581,   582,   587,   588,   589,   593,
     594,   595,   596,   602,   603,   604,   605,   610,   610,   612,
     612,   612,   612,   612,   614,   616,   617,   618,   622,   623,
     624,   626,   627,   631,   631,   631,   633,   636,   636,   638,
     639,   643,   645,   649,   650,   652,   656,   657,   660,   661,
     663,   666,   667,   668,   670,   672,   674,   675,   676,   677,
     681,   681,   681,   683,   686,   689,   694,   699,   706,   706,
     706,   706,   708,   709,   710,   711,   712,   715,   716,   719,
     720,   721,   725,   728,   731,   732,   733,   736,   736,   736,
     736,   736,   736,   738,   739,   740,   741,   744,   744,   746,
     746,   746,   748,   749,   752,   753,   754,   755,   756,   758,
     759,   760,   761,   762,   766,   767,   768,   769,   770,   771,
     774,   775
};
#endif

#if PPDEBUG || YYERROR_VERBOSE || 1
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "$undefined", "\"end of web\"", "HEAD",
  "BAR", "PLEFT", "MLEFT", "RIGHT", "OPEN", "CLOSE", "TEXT", "NL", "HASH",
  "NMACRO", "OMACRO", "PMACRO", "PARAM", "EQ", "EQEQ", "ATSTAR", "ATSPACE",
  "ATD", "ATF", "ATLESS", "ATGREATER", "ELIPSIS", "ATP", "OCTAL", "HEX",
  "ATAT", "ATDOLLAR", "ATLEFT", "ATRIGHT", "ATINDEX", "ATINDEXTT",
  "ATINDEX9", "ATT", "ATEQ", "ATAND", "ATBACKSLASH", "ATEX", "ATQM",
  "ATCOMMA", "ATSLASH", "ATBAR", "ATHASH", "ATPLUS", "ATSEMICOLON",
  "STRING", "CHAR", "INDENT", "METACOMMENT", "CSEMICOLON", "ID", "WDEBUG",
  "WSTAT", "WINIT", "WTINI", "WTATS", "WGUBED", "\"return\"",
  "FIRST_PASCAL_TOKEN", "\"+\"", "\"-\"", "\"*\"", "\"/\"", "\"=\"",
  "\"<>\"", "\"<\"", "\">\"", "\"<=\"", "\">=\"", "\"(\"", "\")\"",
  "\"[\"", "\"]\"", "\":=\"", "\".\"", "\",\"", "\";\"", "\"mod\"",
  "\"div\"", "\"nil\"", "\"or\"", "\"and\"", "\"not\"", "\"if\"",
  "\"then\"", "\"else\"", "\"repeat\"", "\"until\"", "\"while\"", "\"do\"",
  "\"for\"", "\"to\"", "\"downto\"", "\"begin\"", "\"end\"", "\"goto\"",
  "\"0-9\"", "\"real\"", "\"others\"", "\"'...'\"", "\"'.'\"",
  "\"char type\"", "\"bool type\"", "\"integer type\"", "\"real type\"",
  "\"index type\"", "\"identifier\"", "\"variable definition\"",
  "\"parameter definition\"", "\"reference parameter definition\"",
  "\"constant\"", "\"constant definition\"", "\"typename definition\"",
  "\"subrange typename definition\"", "\"array of file type\"",
  "\"array of file name\"", "\"functionname\"",
  "\"functionname definition\"", "\"procedurename\"", "\"call\"",
  "\"return value\"", "\"final_end\"", "\"function begin\"",
  "\"function end\"", "\"..\"", "\":\"", "\"^\"", "\"in\"", "\"case\"",
  "\"of\"", "\"with\"", "\"const\"", "\"var\"", "\"type\"", "\"array\"",
  "\"record\"", "\"set\"", "\"file\"", "\"function\"", "\"procedure\"",
  "\"label\"", "\"packed\"", "\"program\"", "\"forward\"", "CIGNORE",
  "CLABEL", "CLABELN", "CINTDEF", "CSTRDEF", "CMAIN", "CMAINEND", "CUNION",
  "CTSUBRANGE", "CINT", "\"reference variable\"", "\"C function return\"",
  "\"C procedure return\"", "\"C case\"", "\"C :\"", "\"break\"",
  "\"empty statement\"", "$accept", "program", "programheading", "globals",
  "labels", "labellist", "labeldecl", "constants", "constdefinitions",
  "constdefinition", "conststringdefinition", "types", "typedefinitions",
  "typedefinition", "subrange", "iconst", "signed_iconst", "simple_iconst",
  "file_type", "packed", "typename", "record_type", "fields",
  "recordsection", "recids", "variant_part", "variants", "variant", "type",
  "array_type", "variables", "vardeclarations", "vardeclaration", "varids",
  "procedures", "locals", "locallabellist", "locallabeldecl",
  "localvariables", "localvardeclarations", "localvardeclaration",
  "localvarids", "localentire_var", "procedure", "function", "$@1", "$@2",
  "pid", "pheading", "fheading", "formals", "formalparameters", "params",
  "param", "proc_stmt", "function_call", "args", "arg", "write_arg",
  "statements", "statement", "goto_stmt", "label", "stmt", "simple_stmt",
  "empty_stmt", "assign_stmt", "return_stmt", "structured_stmt",
  "compound_stmt", "conditional_stmt", "if_stmt", "case_stmt", "case_list",
  "case_element", "case_labels", "case_label", "repetitive_stmt",
  "while_stmt", "repeat_stmt", "for_stmt", "varlimit", "variable",
  "entire_var", "indexed_var", "field_var", "file_var", "expression",
  "relop", "simple_expr", "sign", "addop", "term", "mulop", "factor",
  "unsigned_const", "real", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321,   322,   323,   324,
     325,   326,   327,   328,   329,   330,   331,   332,   333,   334,
     335,   336,   337,   338,   339,   340,   341,   342,   343,   344,
     345,   346,   347,   348,   349,   350,   351,   352,   353,   354,
     355,   356,   357,   358,   359,   360,   361,   362,   363,   364,
     365,   366,   367,   368,   369,   370,   371,   372,   373,   374,
     375,   376,   377,   378,   379,   380,   381,   382,   383,   384,
     385,   386,   387,   388,   389,   390,   391,   392,   393,   394,
     395,   396,   397,   398,   399,   400,   401,   402,   403,   404,
     405,   406,   407,   408,   409,   410,   411,   412,   413,   414,
     415,   416,   417,   418,   419
};
# endif

#define YYPACT_NINF -318

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-318)))

#define YYTABLE_NINF -13

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     -97,   -29,    65,   -50,    53,  -318,     5,    85,    59,  -318,
    -318,  -318,  -318,    87,   141,    64,   119,   107,     5,  -318,
     151,   200,  -318,   341,    64,   341,   164,    64,    19,  -318,
    -318,   207,   209,   220,   236,   193,   341,   188,  -318,  -318,
     178,  -318,  -318,   -37,  -318,  -318,   215,  -318,  -318,  -318,
    -318,  -318,  -318,  -318,  -318,  -318,  -318,  -318,  -318,  -318,
    -318,    71,  -318,  -318,  -318,   266,   240,  -318,   247,   223,
     141,  -318,   263,  -318,  -318,  -318,   341,   367,   283,  -318,
    -318,  -318,  -318,   299,   303,  -318,    75,   278,   465,   367,
     288,  -318,  -318,  -318,   108,   290,   313,   -32,  -318,  -318,
     341,   341,   157,   157,   421,   258,  -318,   341,    64,   317,
     421,   248,   274,   297,  -318,   298,   343,  -318,  -318,   344,
     247,  -318,    27,  -318,  -318,   334,  -318,   312,   157,   157,
      64,  -318,  -318,   364,  -318,  -318,  -318,  -318,  -318,  -318,
     341,   341,   288,  -318,  -318,  -318,  -318,  -318,   367,   341,
      64,   341,  -318,   339,  -318,  -318,  -318,   -16,  -318,  -318,
     289,   185,  -318,     4,   273,  -318,  -318,  -318,   346,   347,
    -318,   316,  -318,  -318,   345,    52,   184,  -318,  -318,  -318,
      27,  -318,   -44,  -318,    66,  -318,  -318,   204,   221,   335,
    -318,   113,   367,   288,  -318,  -318,  -318,   222,  -318,  -318,
     157,   341,  -318,   261,   365,    64,     8,   -54,  -318,   -45,
    -318,   281,  -318,  -318,   357,  -318,   353,  -318,    14,    14,
    -318,  -318,  -318,  -318,  -318,  -318,  -318,  -318,   354,   -17,
    -318,  -318,  -318,  -100,  -318,  -318,   358,  -318,    27,   184,
     146,   146,  -318,  -318,   -57,    96,  -318,  -318,    64,   288,
     117,    10,  -318,  -318,    16,   423,   429,  -318,   383,  -318,
      -1,  -318,     4,    -4,    64,    -4,  -318,  -318,  -318,  -318,
    -318,  -318,    14,    14,    10,   -73,   314,  -318,  -318,   368,
     169,   369,   370,  -318,  -318,  -318,   -53,    99,    64,    60,
       7,   372,   359,  -318,   360,  -318,   -13,   361,   175,   162,
    -318,  -318,   399,  -318,   449,  -318,  -318,  -318,  -318,  -318,
    -318,  -318,  -318,   279,  -318,   355,   -27,  -318,   -43,   371,
     395,  -318,   391,  -318,  -318,    37,   293,    37,  -318,   130,
    -318,  -318,    60,  -318,    -2,  -318,   409,   410,   412,   306,
    -318,  -318,    64,    64,  -318,   341,    64,    64,   341,   341,
      64,   462,  -318,   350,   -73,  -318,   374,   184,  -318,  -318,
    -318,   282,    27,   -12,  -318,    62,  -318,  -318,   398,    95,
     400,  -318,    60,   184,   379,     7,   349,   139,   154,    64,
    -318,  -318,  -318,  -318,  -318,  -318,  -318,   388,  -318,   393,
    -318,  -318,  -318,   413,   416,    -7,  -318,   375,    37,    37,
     293,  -318,   414,  -318,  -318,   417,   418,   426,   430,  -318,
      60,  -318,   427,   432,   174,   381,   388,  -318,  -318,   363,
     384,    10,   293,  -318,  -318,  -318,  -318,  -318,  -318,  -318,
      60,  -318,  -318,   434,   443,  -318,   196,   184,     6,   439,
    -318,   411,  -318,  -318,  -318,   389,  -318,   205,   184,   444,
     411,  -318,  -318,  -318,   452,   447,  -318
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,     5,     0,     1,     0,     0,    13,     3,
       9,    10,    11,     0,     7,   154,     0,    20,     0,     6,
       0,   144,   142,     0,   154,     0,     0,   154,     0,   143,
     202,     0,     0,   121,   122,     0,     0,     0,   145,   203,
     161,   162,   153,     0,   134,   152,     0,   136,   147,   149,
     150,   151,   148,   163,   164,   167,   168,   165,   190,   191,
     192,     0,   204,   205,   206,     0,    14,    16,     0,    68,
       8,    12,     0,   246,   227,   228,     0,     0,   245,   250,
     247,   248,   249,   125,   126,   242,   239,     0,   214,     0,
     223,   232,   240,   244,     0,     0,     0,     0,   140,   139,
       0,     0,     0,     0,   154,     0,   141,     0,   154,     0,
     154,     0,     0,     0,   213,     0,     0,    17,    15,     0,
      21,    22,     0,    77,   146,     0,   243,     0,     0,     0,
     154,   229,   230,   217,   218,   219,   221,   220,   222,   231,
       0,     0,   224,   234,   235,   237,   236,   238,     0,     0,
     154,     0,   166,     0,   158,   131,   132,     0,   127,   130,
     129,     0,   138,     0,   159,   135,     2,   137,     0,     0,
     156,     0,   155,   212,     0,     0,    40,    23,   207,   208,
      69,    70,     0,    75,     4,   241,   251,     0,     0,   169,
     216,   215,     0,   225,   233,   194,   193,     0,   211,   119,
       0,     0,   120,   182,   181,   154,     0,     0,   173,     0,
     178,     0,   210,   209,     0,    18,     0,    35,     0,     0,
      34,    27,    43,    41,    42,    44,    36,    39,     0,     0,
      28,    31,    61,     0,    60,    62,     0,    71,     0,    40,
       0,     0,    78,    79,     0,     0,   123,   124,   154,   226,
       0,     0,   128,   133,     0,     0,     0,   177,   186,   187,
       0,   171,     0,     0,   154,     0,   160,   157,    19,    32,
      33,    24,     0,     0,     0,    50,     0,    25,    76,     0,
       0,     0,     0,   105,   107,   106,     0,     0,   154,     0,
       0,     0,     0,   101,     0,   170,     0,     0,   198,     0,
     184,   185,     0,   183,     0,   172,   174,   175,   179,   176,
     180,    29,    30,    26,    53,     0,     0,    48,     0,     0,
       0,    74,     0,    72,    73,     0,     0,     0,   108,     0,
      96,    97,    80,    89,     0,    94,    84,    85,     0,     0,
      82,   100,   154,   154,   103,     0,   154,   154,     0,     0,
     154,     0,   188,     0,    50,    45,     0,    40,    46,    38,
      37,     0,     0,     0,   112,     0,   115,   117,     0,     0,
       0,    90,     0,    40,     0,     0,    87,     0,     0,   154,
     201,   196,   195,   200,   199,   197,   189,     0,    49,     0,
      54,    52,    51,     0,     0,     0,   118,     0,     0,     0,
       0,   110,     0,    99,    95,     0,     0,     0,    86,    83,
       0,    81,     0,     0,     0,     0,    55,    56,    47,     0,
       0,     0,     0,   113,   116,   114,   109,    93,    91,    92,
      88,    98,   102,     0,     0,    57,    40,    40,     0,     0,
     104,    50,    67,    66,    65,     0,   111,     0,    40,     0,
      50,    64,    63,    58,     0,     0,    59
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -318,  -318,  -318,  -318,  -318,  -318,    54,  -318,  -318,   457,
    -318,  -318,  -318,   419,  -237,  -243,  -318,    -3,  -318,  -228,
    -288,  -318,  -318,  -312,  -318,   176,  -318,   122,  -234,   172,
    -318,  -318,   362,  -318,  -318,   301,  -318,   173,  -318,   137,
    -317,  -318,   179,  -318,  -318,  -318,  -318,   309,  -318,  -318,
     225,   156,  -318,   158,  -318,  -318,   -74,   356,  -318,   -23,
    -105,  -318,   527,   177,  -318,  -318,  -318,  -318,  -318,  -318,
    -318,  -318,  -318,  -318,    39,  -318,    51,  -318,  -318,  -318,
    -318,  -318,   -15,  -116,  -318,  -318,  -318,    -9,  -318,   420,
     422,  -318,   -66,  -318,   -60,  -318,  -318
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,     7,     8,    13,   338,    17,    66,    67,
     118,    69,   120,   121,   228,   229,   230,   231,   232,   233,
     234,   235,   316,   317,   318,   319,   416,   417,   236,   282,
     123,   180,   181,   182,   184,   292,   339,   340,   411,   332,
     333,   334,   335,   242,   243,   343,   379,   286,   244,   245,
     363,   364,   365,   366,    42,    85,   157,   158,   159,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,   207,   208,   209,   210,    57,    58,    59,
      60,   297,    86,   367,    62,    63,    64,   160,   140,    88,
      89,   141,    90,   148,    91,    92,    93
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      61,    94,   279,   165,    97,   281,   183,   296,   299,    61,
     203,   280,    61,   203,    87,   371,    95,   126,   203,    10,
     325,   336,   258,   142,   217,   189,   260,   105,   217,   161,
     300,   313,   360,    21,   263,   238,   356,   314,   368,   275,
     288,   276,   388,   108,   261,   196,   272,   273,   108,     1,
     272,   273,   345,   354,   187,   188,   272,   273,   199,   315,
      14,   109,   397,   200,   183,     5,   152,   125,   398,   272,
     273,   355,    70,   218,   219,   193,   326,   372,    21,   289,
     346,     4,   445,   359,   264,   239,   357,   290,   194,    61,
     291,   153,   154,    61,     6,    61,   204,   305,   164,   204,
     257,   205,   169,   172,   204,    11,   205,   337,   259,   262,
     220,   274,   425,   371,   220,    61,   301,   265,   395,    29,
     391,   421,   278,   392,   226,    22,   249,   373,   226,   447,
      12,   217,    12,     9,   439,    61,   405,   178,   454,   406,
     195,   399,   197,   295,    98,   280,   111,   178,   112,   113,
     111,    23,   174,   113,    24,   216,    25,   206,    26,   309,
     206,    27,   125,    28,    29,   206,    18,    19,    38,   402,
     330,    73,   327,   362,    30,   398,   131,   132,   438,   328,
     218,   219,    15,    31,    32,   179,    33,    34,   108,    35,
      61,   400,   253,   293,    16,   179,    36,   139,   217,   149,
     443,   114,   442,   444,    20,   114,   155,   156,   240,   241,
     108,   451,    37,    38,   452,   269,   270,   220,   331,   108,
      74,    75,    39,    40,    41,   272,   273,    30,   370,    65,
      76,   226,   289,    61,   108,   298,    31,   412,   348,   349,
     290,   381,   382,    77,    68,   385,   396,   218,   219,    61,
     111,    71,   413,   113,   108,   350,   283,    78,    79,   202,
      80,    81,    73,    72,   200,   329,   284,    30,   285,   311,
     312,    82,   433,    61,    96,    39,    31,    83,   246,   449,
      84,   162,   100,   200,   220,   450,   101,   167,    73,   221,
     222,   223,   224,   102,   225,   247,   217,   168,   226,   306,
     200,   307,   222,   223,   224,   114,   225,   322,   275,   103,
     276,    74,    75,   106,   308,    39,   310,   250,   251,   377,
     378,    76,   104,   170,   254,   255,   107,    61,    61,   227,
      73,    61,    61,   115,    77,    61,   380,    74,    75,   383,
     384,   227,   272,   273,   110,   218,   219,   171,    78,    79,
     116,    80,    81,   143,   144,    73,   414,   119,    30,   122,
      77,   127,    82,   124,    61,   214,   130,    31,    83,   145,
     146,    84,   128,   147,    78,    79,   129,    80,    81,    74,
      75,    73,   220,   150,    30,   375,   376,   393,    82,    76,
     151,   163,   394,    31,    83,   166,   226,    84,   174,   222,
     223,   224,    77,   225,    74,    75,    39,   173,   185,   217,
     175,   176,   186,   190,    76,   198,    78,    79,   201,    80,
      81,   211,   212,   213,   248,   215,    30,    77,   256,   266,
      82,   267,    39,   268,   271,    31,    83,   302,   277,    84,
      76,    78,    79,   303,    80,    81,   304,   320,   321,   323,
     324,    30,   341,    77,   347,    82,   342,   344,   218,   219,
      31,    83,   351,   352,    84,   353,   361,    78,    79,   358,
      80,    81,    -9,   -10,    39,   374,   386,    30,   401,   408,
     403,    82,    22,   387,   390,   410,    31,    83,   415,   419,
      84,   418,   420,   -12,   426,   220,   436,   427,   428,    39,
     221,   222,   223,   224,   422,   225,   429,   431,    23,   226,
     434,    24,   432,    25,   440,    26,   441,   437,    27,   446,
      28,   314,   448,   117,   453,    39,   455,   456,   131,   132,
     389,    30,   133,   134,   135,   136,   137,   138,   435,   177,
      31,    32,   237,    33,    34,   407,   294,   430,   409,   139,
     287,   404,   369,    36,   423,    99,   252,   424,     0,     0,
     191,     0,     0,   192,     0,     0,     0,     0,     0,    37,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    39,
      40,    41
};

static const yytype_int16 yycheck[] =
{
      15,    24,   239,   108,    27,   239,   122,   250,   251,    24,
      14,   239,    27,    14,    23,   332,    25,    77,    14,    14,
      73,    14,    14,    89,    14,   130,    80,    36,    14,   103,
      14,   274,   320,    14,    79,    79,    79,   110,   326,   139,
      97,   141,   354,    80,    98,   150,    63,    64,    80,   146,
      63,    64,    65,    80,   128,   129,    63,    64,    74,   132,
       6,    98,    74,    79,   180,     0,    98,    76,    80,    63,
      64,    98,    18,    63,    64,   141,   129,    79,    14,   136,
      93,   110,    76,   320,   129,   129,   129,   144,   148,   104,
     147,   100,   101,   108,   144,   110,   100,    98,   107,   100,
     205,   102,   111,   112,   100,   100,   102,   100,   100,   163,
     100,   128,   400,   430,   100,   130,   100,   162,   361,   100,
     357,   128,   238,   357,   114,    61,   192,   129,   114,   441,
     125,    14,   125,    80,   422,   150,   373,   110,   450,   373,
     149,    79,   151,   248,   125,   373,    75,   110,    77,    78,
      75,    87,   100,    78,    90,   103,    92,   161,    94,   264,
     161,    97,   171,    99,   100,   161,    79,    80,   149,    74,
     110,    14,    73,   136,   110,    80,    63,    64,   421,    80,
      63,    64,    97,   119,   120,   158,   122,   123,    80,   125,
     205,   129,   201,    97,   135,   158,   132,    84,    14,    91,
     437,   130,   436,   437,    63,   130,    49,    50,   142,   143,
      80,   448,   148,   149,   448,   218,   219,   100,   158,    80,
      63,    64,   158,   159,   160,    63,    64,   110,    98,   110,
      73,   114,   136,   248,    80,   250,   119,    98,    63,    64,
     144,   346,   347,    86,   137,   350,   362,    63,    64,   264,
      75,   100,    98,    78,    80,    93,   110,   100,   101,    74,
     103,   104,    14,    63,    79,   288,   120,   110,   122,   272,
     273,   114,    98,   288,   110,   158,   119,   120,    74,    74,
     123,   104,    75,    79,   100,    80,    77,   110,    14,   105,
     106,   107,   108,    73,   110,    74,    14,    49,   114,   260,
      79,   262,   106,   107,   108,   130,   110,   138,   139,    73,
     141,    63,    64,   125,   263,   158,   265,    95,    96,   342,
     343,    73,   129,    49,    63,    64,   148,   342,   343,   145,
      14,   346,   347,    67,    86,   350,   345,    63,    64,   348,
     349,   145,    63,    64,   129,    63,    64,    73,   100,   101,
     110,   103,   104,    65,    66,    14,   379,   110,   110,   136,
      86,    78,   114,   100,   379,    49,    88,   119,   120,    81,
      82,   123,    73,    85,   100,   101,    73,   103,   104,    63,
      64,    14,   100,    93,   110,    79,    80,   105,   114,    73,
      77,   133,   110,   119,   120,    78,   114,   123,   100,   106,
     107,   108,    86,   110,    63,    64,   158,   110,    74,    14,
      67,    67,   100,    49,    73,    76,   100,   101,   129,   103,
     104,   148,    76,    76,    89,    80,   110,    86,    63,   148,
     114,    74,   158,    80,    80,   119,   120,    14,    80,   123,
      73,   100,   101,    14,   103,   104,    63,   133,    80,    80,
      80,   110,    80,    86,    93,   114,    97,    97,    63,    64,
     119,   120,    63,    14,   123,   110,    75,   100,   101,    98,
     103,   104,    63,    63,   158,    63,    14,   110,    80,   100,
      80,   114,    61,   133,   110,   136,   119,   120,   100,    76,
     123,    98,    76,    63,    80,   100,   133,    80,    80,   158,
     105,   106,   107,   108,   129,   110,    80,    80,    87,   114,
     129,    90,    80,    92,    80,    94,    73,   133,    97,    80,
      99,   110,   133,    66,    80,   158,    74,    80,    63,    64,
     354,   110,    67,    68,    69,    70,    71,    72,   416,   120,
     119,   120,   180,   122,   123,   373,   245,   410,   375,    84,
     241,   372,   327,   132,   398,    28,   200,   399,    -1,    -1,
     140,    -1,    -1,   141,    -1,    -1,    -1,    -1,    -1,   148,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   158,
     159,   160
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,   146,   166,   167,   110,     0,   144,   168,   169,    80,
      14,   100,   125,   170,   171,    97,   135,   172,    79,    80,
      63,    14,    61,    87,    90,    92,    94,    97,    99,   100,
     110,   119,   120,   122,   123,   125,   132,   148,   149,   158,
     159,   160,   219,   224,   225,   226,   227,   228,   229,   230,
     231,   232,   233,   234,   235,   236,   237,   242,   243,   244,
     245,   247,   249,   250,   251,   110,   173,   174,   137,   176,
     171,   100,    63,    14,    63,    64,    73,    86,   100,   101,
     103,   104,   114,   120,   123,   220,   247,   252,   254,   255,
     257,   259,   260,   261,   224,   252,   110,   224,   125,   227,
      75,    77,    73,    73,   129,   252,   125,   148,    80,    98,
     129,    75,    77,    78,   130,    67,   110,   174,   175,   110,
     177,   178,   136,   195,   100,   252,   259,    78,    73,    73,
      88,    63,    64,    67,    68,    69,    70,    71,    72,    84,
     253,   256,   257,    65,    66,    81,    82,    85,   258,    91,
      93,    77,    98,   252,   252,    49,    50,   221,   222,   223,
     252,   221,   228,   133,   252,   225,    78,   228,    49,   252,
      49,    73,   252,   110,   100,    67,    67,   178,   110,   158,
     196,   197,   198,   248,   199,    74,   100,   221,   221,   225,
      49,   254,   255,   257,   259,   252,   225,   252,    76,    74,
      79,   129,    74,    14,   100,   102,   161,   238,   239,   240,
     241,   148,    76,    76,    49,    80,   103,    14,    63,    64,
     100,   105,   106,   107,   108,   110,   114,   145,   179,   180,
     181,   182,   183,   184,   185,   186,   193,   197,    79,   129,
     142,   143,   208,   209,   213,   214,    74,    74,    89,   257,
      95,    96,   222,   252,    63,    64,    63,   225,    14,   100,
      80,    98,   163,    79,   129,   162,   148,    74,    80,   182,
     182,    80,    63,    64,   128,   139,   141,    80,   248,   179,
     184,   193,   194,   110,   120,   122,   212,   212,    97,   136,
     144,   147,   200,    97,   200,   225,   180,   246,   247,   180,
      14,   100,    14,    14,    63,    98,   239,   239,   241,   225,
     241,   182,   182,   180,   110,   132,   187,   188,   189,   190,
     133,    80,   138,    80,    80,    73,   129,    73,    80,   224,
     110,   158,   204,   205,   206,   207,    14,   100,   171,   201,
     202,    80,    97,   210,    97,    65,    93,    93,    63,    64,
      93,    63,    14,   110,    80,    98,    79,   129,    98,   179,
     185,    75,   136,   215,   216,   217,   218,   248,   185,   215,
      98,   205,    79,   129,    63,    79,    80,   224,   224,   211,
     252,   225,   225,   252,   252,   225,    14,   133,   188,   190,
     110,   179,   193,   105,   110,   180,   248,    74,    80,    79,
     129,    80,    74,    80,   207,   179,   193,   194,   100,   202,
     136,   203,    98,    98,   224,   100,   191,   192,    98,    76,
      76,   128,   129,   216,   218,   185,    80,    80,    80,    80,
     204,    80,    80,    98,   129,   192,   133,   133,   180,   185,
      80,    73,   193,   179,   193,    76,    80,   188,   133,    74,
      80,   179,   193,    80,   188,    74,    80
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   165,   166,   167,   168,   169,   169,   170,   170,   171,
     171,   171,   171,   172,   172,   172,   173,   173,   174,   175,
     176,   176,   177,   177,   178,   178,   179,   179,   180,   180,
     180,   181,   181,   181,   182,   182,   182,   183,   183,   184,
     184,   185,   185,   185,   185,   186,   186,   186,   187,   187,
     188,   188,   188,   189,   189,   190,   191,   191,   192,   192,
     193,   193,   193,   194,   194,   194,   194,   194,   195,   195,
     196,   196,   197,   197,   197,   198,   198,   199,   199,   199,
     200,   200,   201,   201,   202,   202,   202,   203,   203,   204,
     204,   205,   205,   205,   206,   206,   207,   207,   208,   208,
     208,   210,   209,   211,   209,   212,   212,   212,   213,   213,
     214,   214,   215,   215,   216,   217,   217,   218,   218,   219,
     219,   219,   219,   220,   220,   220,   220,   221,   221,   222,
     222,   222,   222,   223,   224,   224,   225,   225,   225,   226,
     226,   226,   226,   227,   227,   227,   227,   228,   228,   229,
     229,   229,   229,   229,   230,   231,   231,   231,   232,   232,
     232,   232,   232,   233,   233,   233,   234,   235,   235,   236,
     236,   237,   237,   238,   238,   238,   239,   239,   240,   240,
     240,   241,   241,   241,   241,   241,   241,   241,   241,   241,
     242,   242,   242,   243,   244,   245,   245,   245,   246,   246,
     246,   246,   247,   247,   247,   247,   247,   248,   248,   249,
     249,   249,   250,   251,   252,   252,   252,   253,   253,   253,
     253,   253,   253,   254,   254,   254,   254,   255,   255,   256,
     256,   256,   257,   257,   258,   258,   258,   258,   258,   259,
     259,   259,   259,   259,   260,   260,   260,   260,   260,   260,
     261,   261
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     6,     3,     5,     0,     3,     1,     3,     1,
       1,     1,     3,     0,     2,     3,     1,     2,     4,     4,
       0,     2,     1,     2,     4,     4,     3,     1,     1,     3,
       3,     1,     2,     2,     1,     1,     1,     4,     4,     1,
       0,     1,     1,     1,     1,     4,     4,     6,     1,     3,
       0,     3,     3,     1,     3,     4,     1,     2,     6,     8,
       1,     1,     1,     9,     9,     7,     7,     7,     0,     2,
       1,     2,     4,     4,     4,     1,     3,     0,     2,     2,
       2,     4,     1,     3,     1,     1,     3,     0,     2,     1,
       2,     4,     4,     4,     1,     3,     1,     1,     6,     5,
       3,     0,     6,     0,     7,     1,     1,     1,     3,     6,
       5,     8,     1,     3,     3,     1,     3,     1,     2,     4,
       4,     1,     1,     4,     4,     1,     1,     1,     3,     1,
       1,     1,     1,     3,     1,     3,     1,     3,     3,     2,
       2,     2,     1,     1,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     0,     3,     3,     5,     3,     3,
       5,     1,     1,     1,     1,     1,     3,     1,     1,     4,
       6,     5,     6,     1,     3,     3,     3,     2,     1,     3,
       3,     1,     1,     3,     3,     3,     2,     2,     4,     5,
       1,     1,     1,     4,     4,     8,     8,     8,     1,     3,
       3,     3,     1,     1,     1,     1,     1,     1,     1,     4,
       4,     4,     3,     2,     1,     3,     3,     1,     1,     1,
       1,     1,     1,     1,     2,     3,     4,     1,     1,     1,
       1,     1,     1,     3,     1,     1,     1,     1,     1,     1,
       1,     3,     1,     2,     1,     1,     1,     1,     1,     1,
       1,     3
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if PPDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !PPDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !PPDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 221 "pascal.y" /* yacc.c:1646  */
    { CHGTAG((yyvsp[-3]),CMAIN); CHGTAG((yyvsp[-1]),CMAINEND); IGN((yyvsp[0])); 
           wsemicolon((yyvsp[-2]),(yyvsp[-1]));
         }
#line 1814 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 3:
#line 226 "pascal.y" /* yacc.c:1646  */
    {IGN((yyvsp[-1])); IGN((yyvsp[0])); }
#line 1820 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 233 "pascal.y" /* yacc.c:1646  */
    { IGN((yyvsp[0])); }
#line 1826 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 237 "pascal.y" /* yacc.c:1646  */
    { IGN((yyvsp[-1])); }
#line 1832 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 240 "pascal.y" /* yacc.c:1646  */
    {IGN((yyvsp[0])); SYM((yyvsp[0]))->obsolete=1; }
#line 1838 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 241 "pascal.y" /* yacc.c:1646  */
    {IGN((yyvsp[0])); }
#line 1844 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 242 "pascal.y" /* yacc.c:1646  */
    {IGN((yyvsp[0])); }
#line 1850 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 243 "pascal.y" /* yacc.c:1646  */
    {IGN((yyvsp[-1])); IGN((yyvsp[0])); }
#line 1856 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 255 "pascal.y" /* yacc.c:1646  */
    { LNK((yyvsp[-3]),(yyvsp[-2])); LNK((yyvsp[-2]),(yyvsp[0]));  
                   SETVAL((yyvsp[-3]),getval((yyvsp[-1]))); CHGID((yyvsp[-3]),PCONSTID);
                   CHGTAG((yyvsp[-3]),CINTDEF); }
#line 1864 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 261 "pascal.y" /* yacc.c:1646  */
    { seq((yyvsp[-3]),(yyvsp[0])); CHGID((yyvsp[-3]),PCONSTID);
                 CHGTAG((yyvsp[-3]),CSTRDEF);CHGTAG((yyvsp[-2]),PASSIGN); }
#line 1871 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 267 "pascal.y" /* yacc.c:1646  */
    { IGN((yyvsp[-1])); }
#line 1877 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 275 "pascal.y" /* yacc.c:1646  */
    { DBG(dbgparse,"New Subrange Type: %s\n",
						  SYM((yyvsp[-3]))->name);
                                              LNK((yyvsp[-3]),(yyvsp[-2])); IGN((yyvsp[-2]));LNK((yyvsp[-2]),(yyvsp[0]));
                                              CHGTYPE((yyvsp[-3]),(yyvsp[-1])); 
                                              CHGTAG((yyvsp[-3]),PDEFTYPEID);
                                              CHGTAG((yyvsp[-2]),CTSUBRANGE); UP((yyvsp[-2]),(yyvsp[-1]));
                                             }
#line 1889 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 283 "pascal.y" /* yacc.c:1646  */
    { DBG(dbgparse,"New Type: %s\n",
					      SYM((yyvsp[-3]))->name);
                                              LNK((yyvsp[-3]),(yyvsp[-2])); IGN((yyvsp[-2])); LNK((yyvsp[-2]),(yyvsp[0])); 
                                              CHGTYPE((yyvsp[-3]),(yyvsp[-1])); LNK((yyvsp[-1]),(yyvsp[0]));
                                              CHGTAG((yyvsp[-3]),PDEFTYPEID);
                                            }
#line 1900 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 293 "pascal.y" /* yacc.c:1646  */
    {(yyval)=join(PDOTDOT,(yyvsp[-2]),(yyvsp[0]),(yyvsp[0])->value-(yyvsp[-2])->value+1); }
#line 1906 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 295 "pascal.y" /* yacc.c:1646  */
    {(yyval)=join(PDOTDOT,join(PTYPECHAR,(yyvsp[0]),(yyvsp[0]),0),
                           join(PTYPECHAR,(yyvsp[0]),(yyvsp[0]),255),256); }
#line 1913 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 299 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 1919 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 301 "pascal.y" /* yacc.c:1646  */
    {(yyval)=join(PPLUS,(yyvsp[-2]),(yyvsp[0]),(yyvsp[-2])->value+(yyvsp[0])->value); }
#line 1925 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 303 "pascal.y" /* yacc.c:1646  */
    {(yyval)=join(PMINUS,(yyvsp[-2]),(yyvsp[0]),(yyvsp[-2])->value-(yyvsp[0])->value); }
#line 1931 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 306 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 1937 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 307 "pascal.y" /* yacc.c:1646  */
    {(yyval)=join(PPLUS,NULL,(yyvsp[0]),(yyvsp[0])->value); }
#line 1943 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 309 "pascal.y" /* yacc.c:1646  */
    {(yyval)=join(PMINUS,NULL,(yyvsp[0]),-((yyvsp[0])->value)); }
#line 1949 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 313 "pascal.y" /* yacc.c:1646  */
    {(yyval)=join(PINTEGER,(yyvsp[0]),NULL,getval((yyvsp[0]))); }
#line 1955 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 314 "pascal.y" /* yacc.c:1646  */
    {(yyval)=join(NMACRO,(yyvsp[0]),NULL,getval((yyvsp[0]))); }
#line 1961 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 315 "pascal.y" /* yacc.c:1646  */
    {(yyval)=join(PCONSTID,(yyvsp[0]),NULL,getval((yyvsp[0]))); }
#line 1967 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 318 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[-2]); }
#line 1973 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 319 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[-2]); }
#line 1979 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 324 "pascal.y" /* yacc.c:1646  */
    {(yyval)=NULL; }
#line 1985 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 325 "pascal.y" /* yacc.c:1646  */
    {(yyval)=NULL; }
#line 1991 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 326 "pascal.y" /* yacc.c:1646  */
    {(yyval)=NULL; }
#line 1997 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 327 "pascal.y" /* yacc.c:1646  */
    {(yyval)=NULL; }
#line 2003 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 331 "pascal.y" /* yacc.c:1646  */
    { LNK((yyvsp[-2]),(yyvsp[0])); LNK((yyvsp[-1]),(yyvsp[0]));  
                                        if ((yyvsp[-1])) CHGTAG((yyvsp[0]),PSEMICOLON); else IGN((yyvsp[0])); (yyval)=NULL; }
#line 2010 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 334 "pascal.y" /* yacc.c:1646  */
    { LNK((yyvsp[-2]),(yyvsp[0])); LNK((yyvsp[-1]),(yyvsp[0]));  IGN((yyvsp[0])); (yyval)=NULL; }
#line 2016 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 336 "pascal.y" /* yacc.c:1646  */
    { LNK((yyvsp[-4]),(yyvsp[0])); LNK((yyvsp[-3]),(yyvsp[-2])); LNK((yyvsp[-1]),(yyvsp[0])); IGN((yyvsp[0])); (yyval)=NULL; }
#line 2022 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 340 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2028 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 341 "pascal.y" /* yacc.c:1646  */
    { LNK((yyvsp[-2]),(yyvsp[-1])); (yyval)=(yyvsp[0]); }
#line 2034 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 347 "pascal.y" /* yacc.c:1646  */
    {(yyval)=NULL; }
#line 2040 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 348 "pascal.y" /* yacc.c:1646  */
    {LNK((yyvsp[-2]),(yyvsp[-1])); IGN((yyvsp[-1])); (yyval)=(yyvsp[-1]); }
#line 2046 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 350 "pascal.y" /* yacc.c:1646  */
    {LNK((yyvsp[-2]),(yyvsp[-1])); CHGTAG((yyvsp[-1]),CTSUBRANGE); UP((yyvsp[-1]),(yyvsp[0])); (yyval)=(yyvsp[-1]); }
#line 2052 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 354 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]);  CHGTAG((yyvsp[0]),PDEFVARID); }
#line 2058 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 355 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[-2]); }
#line 2064 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 358 "pascal.y" /* yacc.c:1646  */
    {IGN((yyvsp[-3]));IGN((yyvsp[-2])); 
                                       CHGTAG((yyvsp[-1]),CUNION); (yyval)=(yyvsp[-1]); }
#line 2071 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 368 "pascal.y" /* yacc.c:1646  */
    { IGN((yyvsp[-5])); IGN((yyvsp[-4])); IGN((yyvsp[-3])); 
                   LNK((yyvsp[-2]),(yyvsp[-1])); 
                   IGN((yyvsp[-1])); }
#line 2079 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 373 "pascal.y" /* yacc.c:1646  */
    { IGN((yyvsp[-7])); IGN((yyvsp[-6])); CHGTAG((yyvsp[-5]),PRECORD);  
                   LNK((yyvsp[-5]),(yyvsp[0])); LNK((yyvsp[-4]),(yyvsp[-3])); LNK((yyvsp[-2]),(yyvsp[-1])); CHGTAG((yyvsp[-1]),PSEMICOLON); }
#line 2086 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 387 "pascal.y" /* yacc.c:1646  */
    {LNK((yyvsp[-7]),(yyvsp[-6])); 
                 UP((yyvsp[-7]),join(PDOTDOT,(yyvsp[-5]),(yyvsp[-3]),(yyvsp[-3])->value-(yyvsp[-5])->value+1)); 
                 LNK((yyvsp[-6]),(yyvsp[-4])); LNK((yyvsp[-4]),(yyvsp[-2])); LNK((yyvsp[-2]),(yyvsp[-1]));(yyval)=(yyvsp[-1]); }
#line 2094 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 391 "pascal.y" /* yacc.c:1646  */
    {LNK((yyvsp[-7]),(yyvsp[-6])); 
                 UP((yyvsp[-7]),join(PDOTDOT,(yyvsp[-5]),(yyvsp[-3]),(yyvsp[-3])->value-(yyvsp[-5])->value+1)); 
                 LNK((yyvsp[-6]),(yyvsp[-4])); LNK((yyvsp[-4]),(yyvsp[-2])); LNK((yyvsp[-2]),(yyvsp[-1]));
                 CHGTAG((yyvsp[-1]),CTSUBRANGE); UP((yyvsp[-1]),(yyvsp[0]));(yyval)=(yyvsp[-1]); }
#line 2103 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 395 "pascal.y" /* yacc.c:1646  */
    {LNK((yyvsp[-5]),(yyvsp[-4])); 
                 UP((yyvsp[-5]),(yyvsp[-3]));LNK((yyvsp[-4]),(yyvsp[-3])); LNK((yyvsp[-3]),(yyvsp[-2])); LNK((yyvsp[-2]),(yyvsp[-1]));(yyval)=(yyvsp[-1]); }
#line 2110 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 398 "pascal.y" /* yacc.c:1646  */
    {LNK((yyvsp[-5]),(yyvsp[-4])); UP((yyvsp[-5]),(yyvsp[-3])); LNK((yyvsp[-4]),(yyvsp[-3])); LNK((yyvsp[-3]),(yyvsp[-2])); 
              LNK((yyvsp[-2]),(yyvsp[-1])); CHGTAG((yyvsp[-1]),CTSUBRANGE); UP((yyvsp[-1]),(yyvsp[0]));(yyval)=(yyvsp[-1]); }
#line 2117 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 401 "pascal.y" /* yacc.c:1646  */
    {LNK((yyvsp[-5]),(yyvsp[-4])); UP((yyvsp[-5]),join(PDOTDOT,
            join(PTYPECHAR,(yyvsp[-6]),(yyvsp[-6]),0),join(PTYPECHAR,(yyvsp[-6]),(yyvsp[-6]),255),256)); 
            (yyvsp[-4])->link=join(PTYPECHAR,(yyvsp[-4]),(yyvsp[-2]),256); (yyvsp[-4])->link->link=(yyvsp[-2]); 
             /* the PTYPECHAR comes from a macroexpansion, so we can not 
             link it directly */ LNK((yyvsp[-2]),(yyvsp[-1])); (yyval)=(yyvsp[-1]); }
#line 2127 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 409 "pascal.y" /* yacc.c:1646  */
    { IGN((yyvsp[-1])); }
#line 2133 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 72:
#line 416 "pascal.y" /* yacc.c:1646  */
    { LNK((yyvsp[-3]),(yyvsp[-2]));
                                                IGN((yyvsp[-2])); LNK((yyvsp[-2]),(yyvsp[0])); }
#line 2140 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 73:
#line 418 "pascal.y" /* yacc.c:1646  */
    { LNK((yyvsp[-3]),(yyvsp[-2]));
                                                      IGN((yyvsp[-2])); LNK((yyvsp[-1]),(yyvsp[0])); LNK((yyvsp[-2]),(yyvsp[0])); }
#line 2147 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 74:
#line 420 "pascal.y" /* yacc.c:1646  */
    { LNK((yyvsp[-3]),(yyvsp[-2])); 
                                                    CHGTAG((yyvsp[-2]),CTSUBRANGE); UP((yyvsp[-2]),(yyvsp[-1])); LNK((yyvsp[-2]),(yyvsp[0])); }
#line 2154 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 75:
#line 425 "pascal.y" /* yacc.c:1646  */
    {CHGTAG((yyvsp[0]),PDEFVARID); (yyval)=(yyvsp[0]); }
#line 2160 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 76:
#line 426 "pascal.y" /* yacc.c:1646  */
    {LNK((yyvsp[-2]),(yyvsp[0]));(yyval)=(yyvsp[0]); }
#line 2166 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 80:
#line 435 "pascal.y" /* yacc.c:1646  */
    { CHGTAG((yyvsp[-1]),PBEGIN); }
#line 2172 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 81:
#line 437 "pascal.y" /* yacc.c:1646  */
    { CHGTAG((yyvsp[-3]),PBEGIN); IGN((yyvsp[-1])); }
#line 2178 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 83:
#line 441 "pascal.y" /* yacc.c:1646  */
    {IGN((yyvsp[-1])); }
#line 2184 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 84:
#line 444 "pascal.y" /* yacc.c:1646  */
    {IGN((yyvsp[0]));  SYM((yyvsp[0]))->obsolete=1; localize((yyvsp[0])); }
#line 2190 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 85:
#line 445 "pascal.y" /* yacc.c:1646  */
    {IGN((yyvsp[0])); }
#line 2196 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 86:
#line 446 "pascal.y" /* yacc.c:1646  */
    {IGN((yyvsp[-1])); IGN((yyvsp[0])); }
#line 2202 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 88:
#line 451 "pascal.y" /* yacc.c:1646  */
    { IGN((yyvsp[-1])); }
#line 2208 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 91:
#line 459 "pascal.y" /* yacc.c:1646  */
    { LNK((yyvsp[-3]),(yyvsp[-2])); IGN((yyvsp[-2])); LNK((yyvsp[-2]),(yyvsp[0])); }
#line 2214 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 92:
#line 461 "pascal.y" /* yacc.c:1646  */
    { LNK((yyvsp[-3]),(yyvsp[-2])); IGN((yyvsp[-2])); LNK((yyvsp[-1]),(yyvsp[0])); LNK((yyvsp[-2]),(yyvsp[0])); }
#line 2220 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 93:
#line 463 "pascal.y" /* yacc.c:1646  */
    { LNK((yyvsp[-3]),(yyvsp[-2])); CHGTAG((yyvsp[-2]),CTSUBRANGE); 
                   UP((yyvsp[-2]),(yyvsp[-1])); LNK((yyvsp[-2]),(yyvsp[0])); }
#line 2227 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 94:
#line 466 "pascal.y" /* yacc.c:1646  */
    {CHGTAG((yyvsp[0]),PDEFVARID); (yyval)=(yyvsp[0]); }
#line 2233 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 95:
#line 467 "pascal.y" /* yacc.c:1646  */
    {LNK((yyvsp[-2]),(yyvsp[0]));(yyval)=(yyvsp[0]); }
#line 2239 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 96:
#line 470 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); localize((yyvsp[0])); }
#line 2245 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 97:
#line 471 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); CHGTAG((yyvsp[0]),PID); 
            CHGID((yyvsp[0]),PID); localize((yyvsp[0])); }
#line 2252 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 98:
#line 479 "pascal.y" /* yacc.c:1646  */
    {IGN((yyvsp[-3])); IGN((yyvsp[0]));  wend((yyvsp[-2]),(yyvsp[-1])); wsemicolon((yyvsp[-2]),(yyvsp[-1])); 
           scope_close(); }
#line 2259 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 99:
#line 482 "pascal.y" /* yacc.c:1646  */
    { IGN((yyvsp[0])); wend((yyvsp[-2]),(yyvsp[-1])); wsemicolon((yyvsp[-2]),(yyvsp[-1]));  scope_close(); }
#line 2265 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 100:
#line 483 "pascal.y" /* yacc.c:1646  */
    { scope_close(); }
#line 2271 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 101:
#line 486 "pascal.y" /* yacc.c:1646  */
    {function=1; }
#line 2277 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 102:
#line 487 "pascal.y" /* yacc.c:1646  */
    {function=0; wreturn((yyvsp[-2]), 1,NULL); IGN((yyvsp[0]));
               wsemicolon((yyvsp[-2]),(yyvsp[-1])); scope_close(); }
#line 2284 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 103:
#line 489 "pascal.y" /* yacc.c:1646  */
    {function=1; }
#line 2290 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 104:
#line 491 "pascal.y" /* yacc.c:1646  */
    { int f_no=(yyvsp[-6])->sym_no;
          function=0; 
          if (f_no==x_over_n || f_no==xn_over_d)
          { DBG(dbgcweb,"Discovered function %s; in line %d\n",
               SYM((yyvsp[-6]))->name,(yyvsp[-6])->lineno);
            CHGTAG((yyvsp[-4]),PFBEGIN); (yyvsp[-4])->sym_no=f_no;
            CHGTAG((yyvsp[-1]),PFEND); (yyvsp[-1])->sym_no=f_no; 
	  }
	  else
	    { IGN((yyvsp[-4]));
	      wreturn((yyvsp[-2]),1,NULL);
	    } 
	  wsemicolon((yyvsp[-2]),(yyvsp[-1]));
	  IGN((yyvsp[0]));
	  scope_close();
	}
#line 2311 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 105:
#line 509 "pascal.y" /* yacc.c:1646  */
    {scope_open(); (yyval)=(yyvsp[0]); START_PARAM; }
#line 2317 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 106:
#line 510 "pascal.y" /* yacc.c:1646  */
    {scope_open(); (yyval)=(yyvsp[0]); START_PARAM; }
#line 2323 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 107:
#line 511 "pascal.y" /* yacc.c:1646  */
    {scope_open(); (yyval)=(yyvsp[0]); START_PARAM; }
#line 2329 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 108:
#line 515 "pascal.y" /* yacc.c:1646  */
    { LNK((yyvsp[-2]),(yyvsp[0])); CHGID((yyvsp[-1]),PPROCID); CHGVALUE((yyvsp[-1]),1); IGN((yyvsp[0])); }
#line 2335 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 109:
#line 517 "pascal.y" /* yacc.c:1646  */
    { LNK((yyvsp[-5]),(yyvsp[-3])); CHGID((yyvsp[-4]),PPROCID); CHGVALUE((yyvsp[-4]),param_mask);
	    LNK((yyvsp[-2]),(yyvsp[-1])); IGN((yyvsp[0])); }
#line 2342 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 110:
#line 522 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[-3]); LNK((yyvsp[-4]),(yyvsp[-2])); CHGID((yyvsp[-3]),PFUNCID); 
           CHGVALUE((yyvsp[-3]),1);IGN((yyvsp[-2])); LNK((yyvsp[-2]),(yyvsp[0])); IGN((yyvsp[0])); }
#line 2349 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 111:
#line 525 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[-6]); LNK((yyvsp[-7]),(yyvsp[-5])); 
             CHGID((yyvsp[-6]),PFUNCID); CHGVALUE((yyvsp[-6]),param_mask); 
              LNK((yyvsp[-4]),(yyvsp[-3])); LNK((yyvsp[-3]),(yyvsp[-2])); IGN((yyvsp[-2])); LNK((yyvsp[-2]),(yyvsp[0])); IGN((yyvsp[0])); }
#line 2357 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 112:
#line 530 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2363 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 113:
#line 532 "pascal.y" /* yacc.c:1646  */
    { LNK((yyvsp[-2]),(yyvsp[-1])); CHGTAG((yyvsp[-1]),PCOMMA); (yyval)=(yyvsp[0]); }
#line 2369 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 114:
#line 536 "pascal.y" /* yacc.c:1646  */
    { LNK((yyvsp[-2]),(yyvsp[-1])); IGN((yyvsp[-1])); (yyval)=(yyvsp[-1]); }
#line 2375 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 115:
#line 539 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2381 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 116:
#line 540 "pascal.y" /* yacc.c:1646  */
    {LNK((yyvsp[-2]),(yyvsp[0]));(yyval)=(yyvsp[0]); }
#line 2387 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 117:
#line 543 "pascal.y" /* yacc.c:1646  */
    {NEXT_PARAM; CHGTAG((yyvsp[0]),PDEFPARAMID); (yyval)=(yyvsp[0]); }
#line 2393 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 118:
#line 544 "pascal.y" /* yacc.c:1646  */
    {REF_PARAM; NEXT_PARAM; IGN((yyvsp[-1]));
        CHGTAG((yyvsp[0]),PDEFREFID);CHGID((yyvsp[0]),CREFID); (yyval)=(yyvsp[0]); }
#line 2400 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 119:
#line 549 "pascal.y" /* yacc.c:1646  */
    {CHGTAG((yyvsp[-3]),PCALLID); (yyval)=(yyvsp[-3]); 
           UP((yyvsp[-2]),(yyvsp[-3])); pstring_args((yyvsp[-3]),(yyvsp[-1])); }
#line 2407 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 120:
#line 552 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[-3]); UP((yyvsp[-2]),(yyvsp[-3])); pstring_args((yyvsp[-3]),(yyvsp[-1])); }
#line 2413 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 121:
#line 553 "pascal.y" /* yacc.c:1646  */
    {CHGTAG((yyvsp[0]),PCALLID); (yyval)=(yyvsp[0]); }
#line 2419 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 122:
#line 554 "pascal.y" /* yacc.c:1646  */
    { (yyval)=(yyvsp[0]); }
#line 2425 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 123:
#line 558 "pascal.y" /* yacc.c:1646  */
    {CHGTAG((yyvsp[-3]),PCALLID); (yyval)=(yyvsp[0]); UP((yyvsp[-2]),(yyvsp[-3])); }
#line 2431 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 124:
#line 559 "pascal.y" /* yacc.c:1646  */
    { (yyval)=(yyvsp[0]); UP((yyvsp[-2]),(yyvsp[-3])); }
#line 2437 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 125:
#line 560 "pascal.y" /* yacc.c:1646  */
    {CHGTAG((yyvsp[0]),PCALLID);(yyval)=(yyvsp[0]); }
#line 2443 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 126:
#line 561 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2449 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 127:
#line 565 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2455 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 128:
#line 567 "pascal.y" /* yacc.c:1646  */
    {if ((yyvsp[0])==NULL) (yyval)=(yyvsp[-2]); else if ((yyvsp[-2])==NULL) (yyval)=(yyvsp[0]); 
       else (yyval)=join(PCOMMA,(yyvsp[-2]),(yyvsp[0]),0); }
#line 2462 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 129:
#line 571 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2468 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 130:
#line 572 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2474 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 131:
#line 573 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2480 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 132:
#line 574 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2486 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 133:
#line 578 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[-1]); }
#line 2492 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 134:
#line 581 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2498 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 135:
#line 583 "pascal.y" /* yacc.c:1646  */
    {(yyval)=join(PSEMICOLON,(yyvsp[-2]),(yyvsp[0]),0); }
#line 2504 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 136:
#line 587 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2510 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 137:
#line 588 "pascal.y" /* yacc.c:1646  */
    { clabel((yyvsp[-2]),0);(yyval)=join(PCOLON,(yyvsp[-2]),(yyvsp[0]),0); }
#line 2516 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 138:
#line 590 "pascal.y" /* yacc.c:1646  */
    { IGN((yyvsp[-2])); IGN((yyvsp[-1])); (yyval)=join(PCOLON,(yyvsp[-2]),(yyvsp[0]),0); }
#line 2522 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 139:
#line 593 "pascal.y" /* yacc.c:1646  */
    { clabel((yyvsp[0]),1); (yyval)=join(PGOTO,(yyvsp[0]),NULL,0); }
#line 2528 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 140:
#line 594 "pascal.y" /* yacc.c:1646  */
    { IGN((yyvsp[-1])); (yyval)=(yyvsp[0]); }
#line 2534 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 141:
#line 595 "pascal.y" /* yacc.c:1646  */
    { (yyval)=(yyvsp[0]); }
#line 2540 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 142:
#line 596 "pascal.y" /* yacc.c:1646  */
    { if (function) clabel((yyvsp[0]),1); 
           else { CHGTAG((yyvsp[0]),CPROCRETURN);(yyvsp[0])->sym_ptr->value++; }
                  (yyval)=(yyvsp[0]); }
#line 2548 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 146:
#line 605 "pascal.y" /* yacc.c:1646  */
    {seq((yyvsp[-2]),(yyvsp[0])); (yyval)=(yyvsp[-2]); }
#line 2554 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 154:
#line 614 "pascal.y" /* yacc.c:1646  */
    {(yyval)=join(CEMPTY,NULL,NULL,0); }
#line 2560 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 155:
#line 616 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[-1]); }
#line 2566 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 156:
#line 617 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[-1]); pstring_assign((yyvsp[-2]),(yyvsp[0])); }
#line 2572 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 157:
#line 619 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[-3]);  pstring_assign((yyvsp[-4]),(yyvsp[-1])); }
#line 2578 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 158:
#line 622 "pascal.y" /* yacc.c:1646  */
    { (yyval)=(yyvsp[-2]); }
#line 2584 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 159:
#line 623 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[-2]); }
#line 2590 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 160:
#line 625 "pascal.y" /* yacc.c:1646  */
    {(yyval)=join(CRETURN,NULL,NULL,0);  }
#line 2596 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 161:
#line 626 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2602 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 162:
#line 627 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2608 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 166:
#line 634 "pascal.y" /* yacc.c:1646  */
    {(yyval)=join(PBEGIN,(yyvsp[-1]),NULL,0); wsemicolon((yyvsp[-1]),(yyvsp[0])); }
#line 2614 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 169:
#line 638 "pascal.y" /* yacc.c:1646  */
    {(yyval)=join(PIF,(yyvsp[0]),NULL,0); }
#line 2620 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 170:
#line 640 "pascal.y" /* yacc.c:1646  */
    {wsemicolon((yyvsp[-2]),(yyvsp[-1]));  (yyval)=join(PELSE,(yyvsp[-2]),(yyvsp[0]),0); }
#line 2626 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 171:
#line 643 "pascal.y" /* yacc.c:1646  */
    {LNK((yyvsp[-4]),(yyvsp[-2]));
                wsemicolon((yyvsp[-1]),(yyvsp[0]));(yyval)=join(PCASE,(yyvsp[-1]),NULL,0); }
#line 2633 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 172:
#line 646 "pascal.y" /* yacc.c:1646  */
    {LNK((yyvsp[-5]),(yyvsp[-3]));(yyval)=join(PCASE,(yyvsp[-2]),NULL,0); }
#line 2639 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 174:
#line 650 "pascal.y" /* yacc.c:1646  */
    {(yyval)=join(CCASE,(yyvsp[-2]),(yyvsp[0]),0); 
                                              wsemicolon((yyvsp[-2]),(yyvsp[-1])); CHGTAG((yyvsp[-1]),CBREAK); UP((yyvsp[-1]),(yyvsp[-2])); }
#line 2646 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 175:
#line 653 "pascal.y" /* yacc.c:1646  */
    {(yyval)=join(CCASE,(yyvsp[-2]),(yyvsp[0]),0); /* etex parses same module twice */ }
#line 2652 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 176:
#line 656 "pascal.y" /* yacc.c:1646  */
    { (yyval)=(yyvsp[0]); }
#line 2658 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 177:
#line 657 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2664 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 179:
#line 662 "pascal.y" /* yacc.c:1646  */
    {CHGTAG((yyvsp[-1]),CCOLON); CHGTEXT((yyvsp[-1]),": "); }
#line 2670 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 181:
#line 666 "pascal.y" /* yacc.c:1646  */
    { winsert_after((yyvsp[0])->previous,CCASE,"case "); }
#line 2676 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 182:
#line 667 "pascal.y" /* yacc.c:1646  */
    { winsert_after((yyvsp[0])->previous,CCASE,"case "); }
#line 2682 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 183:
#line 669 "pascal.y" /* yacc.c:1646  */
    {winsert_after((yyvsp[-2])->previous,CCASE,"case "); }
#line 2688 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 184:
#line 671 "pascal.y" /* yacc.c:1646  */
    {winsert_after((yyvsp[-2])->previous,CCASE,"case "); }
#line 2694 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 185:
#line 673 "pascal.y" /* yacc.c:1646  */
    {winsert_after((yyvsp[-2])->previous,CCASE,"case "); }
#line 2700 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 189:
#line 678 "pascal.y" /* yacc.c:1646  */
    {winsert_after((yyvsp[-4])->previous,CCASE,"case ");  /* etex */ }
#line 2706 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 193:
#line 684 "pascal.y" /* yacc.c:1646  */
    {LNK((yyvsp[-3]),(yyvsp[-1])); (yyval)=join(PWHILE,(yyvsp[0]),NULL,0); }
#line 2712 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 194:
#line 687 "pascal.y" /* yacc.c:1646  */
    { wsemicolon((yyvsp[-2]),(yyvsp[-1])); (yyval)=join(PREPEAT,(yyvsp[-2]),NULL,0); }
#line 2718 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 195:
#line 690 "pascal.y" /* yacc.c:1646  */
    { mark_for_variable((yyvsp[-6]),(yyvsp[-7])->lineno,0,VAR_LOOP); 
                DBG(dbgfor,"for variable %s, limit variable in line %d\n",
                SYM((yyvsp[-6]))->name,(yyvsp[-6])->lineno);
                (yyval)=join(PFOR,(yyvsp[0]),NULL,0);LNK((yyvsp[-7]),(yyvsp[-3]));LNK((yyvsp[-3]),(yyvsp[-1])); }
#line 2727 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 196:
#line 695 "pascal.y" /* yacc.c:1646  */
    { mark_for_variable((yyvsp[-6]),(yyvsp[-7])->lineno,(yyvsp[-2])->value,TO_LOOP); 
                DBG(dbgfor,"for variable %s, limit up in line %d\n",
                SYM((yyvsp[-6]))->name,(yyvsp[-6])->lineno);
                (yyval)=join(PFOR,(yyvsp[0]),NULL,0);LNK((yyvsp[-7]),(yyvsp[-3]));LNK((yyvsp[-3]),(yyvsp[-1])); }
#line 2736 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 197:
#line 700 "pascal.y" /* yacc.c:1646  */
    { mark_for_variable((yyvsp[-6]),(yyvsp[-7])->lineno,(yyvsp[-2])->value,DOWNTO_LOOP); 
                DBG(dbgfor,"for variable %s, limit down in line %d\n",
                SYM((yyvsp[-6]))->name,(yyvsp[-6])->lineno);
                (yyval)=join(PFOR,(yyvsp[0]),NULL,0);LNK((yyvsp[-7]),(yyvsp[-3]));LNK((yyvsp[-3]),(yyvsp[-1])); }
#line 2745 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 207:
#line 715 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2751 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 208:
#line 716 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); CHGTAG((yyvsp[0]),PID); CHGID((yyvsp[0]),PID); }
#line 2757 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 214:
#line 731 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2763 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 215:
#line 732 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2769 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 216:
#line 733 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2775 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 223:
#line 738 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2781 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 224:
#line 739 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2787 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 225:
#line 740 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2793 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 226:
#line 741 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2799 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 232:
#line 748 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2805 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 233:
#line 749 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2811 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 235:
#line 753 "pascal.y" /* yacc.c:1646  */
    { DBG(dbgslash,"Pascal / in line %d\n",(yyvsp[0])->lineno); }
#line 2817 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 241:
#line 760 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2823 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 243:
#line 762 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); }
#line 2829 "pascal.tab.c" /* yacc.c:1646  */
    break;

  case 251:
#line 775 "pascal.y" /* yacc.c:1646  */
    {(yyval)=(yyvsp[0]); /* used in line 2361 */}
#line 2835 "pascal.tab.c" /* yacc.c:1646  */
    break;


#line 2839 "pascal.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 778 "pascal.y" /* yacc.c:1906  */


const char *tagname(int tag)
{ return yytname[YYTRANSLATE(tag)];
}
