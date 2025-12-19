/*2:*/
#line 532 "web2w.w"

/*5:*/
#line 585 "web2w.w"

#define TEX INITIAL
/*:5*//*6:*/
#line 644 "web2w.w"

typedef struct token{
int tag;
struct token*next,*previous,*link,*up;
union{
/*7:*/
#line 661 "web2w.w"

struct{
int sequenceno;
int lineno;
/*8:*/
#line 675 "web2w.w"

char*text;
/*:8*//*37:*/
#line 995 "web2w.w"

int sym_no;
struct symbol*sym_ptr;
/*:37*/
#line 665 "web2w.w"

}
/*:7*/
#line 649 "web2w.w"
;
/*93:*/
#line 2012 "web2w.w"

struct{
int value;
}
/*:93*/
#line 650 "web2w.w"
;
};
}token;
/*:6*//*9:*/
#line 685 "web2w.w"

extern const char*tagname(int tag);
/*:9*//*14:*/
#line 719 "web2w.w"

extern int wwlineno;
/*:14*//*16:*/
#line 728 "web2w.w"

extern int sequenceno;
#define SEQ (sequenceno++)
/*:16*//*17:*/
#line 736 "web2w.w"

void seq(token*t,token*s);
/*:17*//*19:*/
#line 749 "web2w.w"

extern token*add_token(int tag);
/*:19*//*21:*/
#line 761 "web2w.w"

extern token*last_token;
/*:21*//*24:*/
#line 794 "web2w.w"

#define TOK(string,tag)  (add_token(tag)->text= string)
/*:24*//*25:*/
#line 807 "web2w.w"

#define COPY  copy_string(wwtext)
/*:25*//*26:*/
#line 819 "web2w.w"

#define BOS      new_string()
#define ADD      add_string(wwtext)
#define EOS      (string_length()> 0?TOK(end_string(),TEXT):0)
/*:26*//*27:*/
#line 831 "web2w.w"

extern char*new_string(void);
extern void add_string(char*str);
extern char*end_string(void);
extern char*copy_string(char*str);
extern int string_length(void);
/*:27*//*32:*/
#line 920 "web2w.w"

typedef struct symbol{
char*name;
int tag;
int obsolete;
int for_ctrl;
int value;
struct symbol*link;
token*type;
token*eq;
}symbol;
extern int get_sym_no(char*name);
extern symbol*symbol_table[];
/*:32*//*38:*/
#line 1001 "web2w.w"

#define SYM_PTR(name) symbol_table[get_sym_no(name)]
#define SYMBOL {int s= get_sym_no(yytext);add_token(symbol_table[s]->tag)->sym_no= s;}
#define SYM(t) (symbol_table[(t)->sym_no])
/*:38*//*40:*/
#line 1030 "web2w.w"

extern void localize(token*t);
/*:40*//*41:*/
#line 1037 "web2w.w"

extern void scope_open(void);
extern void scope_close(void);
/*:41*//*46:*/
#line 1137 "web2w.w"

extern void ww_push(token*t);
extern token*ww_pop(token*t);
extern int ww_is(int tag);
/*:46*//*48:*/
#line 1180 "web2w.w"

#define PUSH      ww_push(last_token)
#define PUSH_NULL ww_push(NULL)
#define POP       ww_pop(last_token)
#define POP_NULL  (ADD, POP)
#define POP_MLEFT (EOS, TOK("}",RIGHT), BEGIN(MIDDLE), POP)
#define POP_PLEFT (EOS, TOK("}",RIGHT), BEGIN(PASCAL), POP)
#define POP_LEFT  (ww_is(MLEFT)? POP_MLEFT : (ww_is(PLEFT)? POP_PLEFT: POP_NULL))
/*:48*//*49:*/
#line 1204 "web2w.w"

extern void wwstring(char*wwtext);
#define WWSTRING  wwstring(wwtext)
/*:49*//*55:*/
#line 1268 "web2w.w"

typedef struct module{
token*atless;
token*atgreater;
struct module*left,*right;
}module;
extern void add_module(token*atless);
extern module*find_module(token*atless);
/*:55*//*59:*/
#line 1336 "web2w.w"

#define AT_GREATER_EQ TOK("@>",ATGREATER), add_module(POP), TOK("=",EQ), PUSH, SEQ
#define AT_GREATER    TOK("@>",ATGREATER), find_module(POP)
/*:59*//*60:*/
#line 1349 "web2w.w"

extern token*program;
#define PROGRAM (program->link= last_token,program= last_token),TOK("",EQ)
/*:60*//*63:*/
#line 1378 "web2w.w"

#define CHGTAG(t,x) ((t)->tag= (x))
#define CHGID(t,x)  (SYM(t)->tag= (x))
#define CHGTYPE(t,x)  (SYM(t)->type= (x))
#define CHGVALUE(t,x)  (SYM(t)->value= (x))
#define CHGTEXT(t,x) ((t)->text= (x))
/*:63*//*65:*/
#line 1408 "web2w.w"

extern void def_macro(token*eq,int tag);
#define DEF_MACRO(tag)   def_macro(last_token,tag),SEQ
/*:65*//*68:*/
#line 1470 "web2w.w"

extern int pplex(void);
extern void pperror(const char*message);
/*:68*//*83:*/
#line 1819 "web2w.w"

extern int getval(token*t);
/*:83*//*85:*/
#line 1856 "web2w.w"

#define SETVAL(t,val) SYM(t)->value= val
/*:85*//*94:*/
#line 2020 "web2w.w"

token*join(int tag,token*left,token*right,int value);
/*:94*//*105:*/
#line 2178 "web2w.w"

#define IGN(t) ((t)->tag= CIGNORE)
/*:105*//*130:*/
#line 2656 "web2w.w"

extern void pstring_args(token*id,token*arg);
extern void pstring_assign(token*id,token*val);
/*:130*//*148:*/
#line 2988 "web2w.w"

extern void clabel(token*t,int use);
/*:148*//*150:*/
#line 3019 "web2w.w"

extern int exit_no;
#define TOK_RETURN {token *t= add_token(PRETURN); t->sym_no= exit_no; }
/*:150*//*156:*/
#line 3111 "web2w.w"

#define LNK(from,to) ((from)?(seq((from),(to)),(from)->link= (to)):0)
/*:156*//*162:*/
#line 3215 "web2w.w"

#define UP(from,to) ((from)->up= (to))
/*:162*//*173:*/
#line 3461 "web2w.w"

extern token*winsert_after(token*t,int tag,char*text);
/*:173*//*176:*/
#line 3501 "web2w.w"

int dead_end(token*t,int lineno);
/*:176*//*181:*/
#line 3632 "web2w.w"

#define VAR_LOOP 0
#define TO_LOOP 1
#define DOWNTO_LOOP 2
/*:181*//*183:*/
#line 3686 "web2w.w"

extern void mark_for_variable(token*id,int lineno,int value,int direction);
#define FOR_CTRL_PACK(lineno,replace,direction,bits) \
  ((lineno<<16)|((replace&0x1)<<15)|((direction&0x3)<<13)|(bits&0x1FFF))
#define FOR_CTRL_LINE(X)      (((X)>>16)&0xFFFF)
#define FOR_CTRL_REPLACE(X)   (((X)>>15)&1)
#define FOR_CTRL_DIRECTION(X) (((X)>>13)&0x3)
#define FOR_CTRL_BITS(X)      ((X)&0x1FFF)
/*:183*//*188:*/
#line 3939 "web2w.w"

extern void wsemicolon(token*p,token*t);
extern void wend(token*p,token*t);
/*:188*//*194:*/
#line 4029 "web2w.w"

extern unsigned int param_mask,param_bit;
#define SIGN_BIT (~(((unsigned int)~0)>>1))
#define START_PARAM (param_mask= 0,param_bit= SIGN_BIT)
#define NEXT_PARAM  (param_bit= param_bit>>1,CHECK(param_bit!=0,"Too many parameters"))
#define REF_PARAM   (param_mask= param_mask|param_bit)
/*:194*//*200:*/
#line 4165 "web2w.w"

extern void wreturn(token*t,int tail,token*link);
/*:200*//*202:*/
#line 4234 "web2w.w"

extern int x_over_n,xn_over_d;
/*:202*//*210:*/
#line 4415 "web2w.w"

typedef enum{dbgnone= 0x0,
dbgbasic= 0x1,
dbgflex= 0x2,
dbglink= 0x4,
dbgtoken= 0x8,
dbgid= 0x10,
dbgpascal= 0x20,
dbgexpand= 0x40,
dbgbison= 0x80,
dbgparse= 0x100,
dbgcweb= 0x200,
dbgjoin= 0x400,
dbgstring= 0x800,
dbgfor= 0x1000,
dbgslash= 0x2000,
dbgmacro= 0x4000,
dbgarray= 0x8000,
dbgreturn= 0x10000,
dbgsemicolon= 0x20000,
dbgbreak= 0x40000
}debugmode;
/*:210*//*211:*/
#line 4442 "web2w.w"

extern FILE*logfile;
extern int ww_flex_debug;
extern debugmode debugflags;
/*:211*//*215:*/
#line 4541 "web2w.w"

#include <stdlib.h> 
#include <stdio.h> 
#define MESSAGE(...) (fprintf(logfile,__VA_ARGS__),fflush(logfile))
#define ERROR(...)   (fprintf(logfile,"ERROR: "),\
              MESSAGE(__VA_ARGS__),fprintf(logfile,"\n"),exit(1))
#define CHECK(condition,...) (!(condition)? ERROR(__VA_ARGS__):0)
/*:215*//*216:*/
#line 4551 "web2w.w"

#define THE_TOKEN(t) "%d\t%d: %s\t[%s]\n",\
   t->lineno,t->sequenceno,token2string(t),tagname(t->tag)
/*:216*//*217:*/
#line 4557 "web2w.w"

#define DBG(flags,...) {if(debugflags & flags) MESSAGE(__VA_ARGS__);}
#define DBGTOKS(flags, from,to)  { if (debugflags & flags) \
{ token *t= from;  MESSAGE("<<");\
  while (t!=to) {  MESSAGE("%s",token2string(t)); t= t->next;}\
MESSAGE(">>\n"); }}

#define TAG(t) (t?tagname(t->tag):"NULL")

#define DBGTREE(flags,t) DBG(flags,"%s -> %s | %s | %d\n",TAG(t),\
        TAG(t->previous),TAG(t->next),t->value)

/*:217*/
#line 533 "web2w.w"

/*:2*/
