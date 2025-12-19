/*1:*/
#line 501 "web2w.w"

#include <stdlib.h> 
#include <stdio.h> 
#include <ctype.h> 
#include <string.h> 
#include <stdbool.h> 
#include <stdint.h> 
#include <math.h> 
#include "web2w.h"
#include "pascal.tab.h"

/*3:*/
#line 544 "web2w.w"

extern int wwlex(void);
extern FILE*wwin;
extern FILE*wwout;
/*:3*//*10:*/
#line 692 "web2w.w"

#define MAX_TOKEN_MEM  250000
/*:10*//*28:*/
#line 857 "web2w.w"

#define MAX_STRING_MEM 800000
/*:28*//*33:*/
#line 934 "web2w.w"

#define MAX_SYMBOL_TABLE  6007 
#define MAX_SYMBOLS       5200 
/*:33*//*53:*/
#line 1258 "web2w.w"

#define MAX_MODULE_TABLE 1009 
/*:53*//*98:*/
#line 2088 "web2w.w"

static char*token2string(token*t);
/*:98*//*102:*/
#line 2148 "web2w.w"

static token*wprint_to(token*t,token*end);
static token*wskip_to(token*t,token*end);
/*:102*//*110:*/
#line 2257 "web2w.w"

static bool following_directive(token*t);
/*:110*//*117:*/
#line 2395 "web2w.w"

static void wid(token*t);
/*:117*//*157:*/
#line 3132 "web2w.w"

static token*varlist;
/*:157*//*168:*/
#line 3364 "web2w.w"

int generate_constant(token*t,char sign,int value);
/*:168*/
#line 512 "web2w.w"

/*11:*/
#line 696 "web2w.w"

static token token_mem[MAX_TOKEN_MEM]= {{0}};
static int free_tokens= MAX_TOKEN_MEM;
/*:11*//*15:*/
#line 724 "web2w.w"

int sequenceno= 0;
/*:15*//*20:*/
#line 757 "web2w.w"

static token*first_token;
token*last_token;
/*:20*//*29:*/
#line 861 "web2w.w"

static char string_mem[MAX_STRING_MEM];
static int free_strings= MAX_STRING_MEM;
static int current_string= 0;
/*:29*//*34:*/
#line 939 "web2w.w"

symbol*symbol_table[MAX_SYMBOL_TABLE]= {NULL};
static symbol symbols[MAX_SYMBOLS]= {{0}};
static int free_symbols= MAX_SYMBOLS;
/*:34*//*42:*/
#line 1045 "web2w.w"

#define MAX_LOCALS 50
static int locals[MAX_LOCALS];
static symbol*globals[MAX_LOCALS];
static int free_locals= MAX_LOCALS;
/*:42*//*45:*/
#line 1125 "web2w.w"

#define MAX_WWSTACK 200
static token*wwstack[MAX_WWSTACK]= {0};
static int wwsp= 0;
/*:45*//*51:*/
#line 1221 "web2w.w"

static token*first_string= NULL,**last_string= &first_string;
/*:51*//*54:*/
#line 1262 "web2w.w"

static module module_table[MAX_MODULE_TABLE]= {{0}};
static int free_modules= MAX_MODULE_TABLE;
static module*module_root= NULL;
/*:54*//*61:*/
#line 1355 "web2w.w"

token*program;
/*:61*//*70:*/
#line 1491 "web2w.w"

#define MAX_PPSTACK 40
static struct{
token*next,*end,*link;
int environment;
token*parameter;
}pp_stack[MAX_PPSTACK];
static int pp_sp= MAX_PPSTACK;
/*:70*//*96:*/
#line 2053 "web2w.w"

static int alfanum= 0;
static int comma= 0;
static int column= 0;
/*:96*//*113:*/
#line 2346 "web2w.w"

static int float_constant_no;
/*:113*//*133:*/
#line 2726 "web2w.w"

int print_no,print_str_no,overflow_no,print_err_no,
print_nl_no,fatal_error_no,prompt_file_name_no,
help_line_no,empty_string_no,max_reg_help_line_no;
/*:133*//*138:*/
#line 2799 "web2w.w"

int TeXinputs_no,TeXfonts_no,fmt_no,math_spacing_no;
/*:138*//*146:*/
#line 2959 "web2w.w"

static char*hash_str;
/*:146*//*151:*/
#line 3024 "web2w.w"

int exit_no;
/*:151*//*158:*/
#line 3135 "web2w.w"

static token*varlist= NULL;
/*:158*//*195:*/
#line 4036 "web2w.w"

unsigned int param_mask,param_bit;
/*:195*//*203:*/
#line 4237 "web2w.w"

int x_over_n,xn_over_d;
/*:203*//*212:*/
#line 4447 "web2w.w"

#define MAX_NAME 256
static char basename[MAX_NAME];
static FILE*w= NULL;
static FILE*pascal= NULL;
FILE*logfile= NULL;
debugmode debugflags= dbgnone;
/*:212*/
#line 513 "web2w.w"

/*13:*/
#line 705 "web2w.w"

static token*new_token(int tag)
{token*n;
if(free_tokens> 0)n= &token_mem[--free_tokens];
else ERROR("token mem overflow");
n->lineno= wwlineno;
n->sequenceno= sequenceno;
n->tag= tag;
return n;
}
/*:13*//*18:*/
#line 740 "web2w.w"

void seq(token*t,token*s)
{CHECK(t->sequenceno==s->sequenceno,
"tokens in line %d and %d belong to different code sequences",t->lineno,s->lineno);
}
/*:18*//*23:*/
#line 773 "web2w.w"

token*add_token(int tag)
{token*n= new_token(tag);
last_token->next= n;
n->previous= last_token;
last_token= n;
return n;
}
/*:23*//*31:*/
#line 876 "web2w.w"

char*new_string(void)
{current_string= MAX_STRING_MEM-free_strings;
return string_mem+current_string;
}

void add_string(char*str)
{while(free_strings> 0)
{if(*str!=0)
string_mem[MAX_STRING_MEM-free_strings--]= *str++;
else
return;
}
ERROR("String mem overflow");
}

char*end_string(void)
{char*str= string_mem+current_string;
if(free_strings> 0)
string_mem[MAX_STRING_MEM-free_strings--]= 0;
else
ERROR("String mem overflow");
current_string= MAX_STRING_MEM-free_strings;
return str;
}

char*copy_string(char*str)
{new_string();
add_string(str);
return end_string();
}

int string_length(void)
{return(MAX_STRING_MEM-free_strings)-current_string;}

/*:31*//*36:*/
#line 951 "web2w.w"

static int symbol_hash(char*name)
{int hash= 0;
while(*name!=0)
hash= hash+(*(name++)^0x9E);
return hash;
}

static symbol*new_symbol(void)
{CHECK(free_symbols> 0,"Symbol table overflow");
free_symbols--;
return symbols+free_symbols;
}

int get_sym_no(char*name)
{int i,c;
i= symbol_hash(name)%MAX_SYMBOL_TABLE;
if(symbol_table[i]!=NULL)
{if(strcmp(symbol_table[i]->name,name)==0)
return i;
if(i==0)c= 1;else c= MAX_SYMBOL_TABLE-i;
while(true)
{i= i-c;
if(i<0)i= i+MAX_SYMBOL_TABLE;
if(symbol_table[i]==NULL)break;
if(strcmp(symbol_table[i]->name,name)==0)
return i;
}
}
symbol_table[i]= new_symbol();
symbol_table[i]->name= new_string();add_string(name);end_string();
symbol_table[i]->tag= ID;
return i;
}
/*:36*//*43:*/
#line 1053 "web2w.w"

void scope_open(void)
{
CHECK(free_locals==MAX_LOCALS,"Opening a new scope without closing the previous one");
}

void scope_close(void)
{int i;
for(i= free_locals;i<MAX_LOCALS;i++)
symbol_table[locals[i]]= globals[i];
free_locals= MAX_LOCALS;
}
/*:43*//*44:*/
#line 1069 "web2w.w"

void localize(token*t)
{int sym_no= t->sym_no;
symbol*l,*g;
l= new_symbol();
g= symbol_table[sym_no];
l->name= g->name;
l->tag= g->tag;
l->eq= g->eq;
symbol_table[sym_no]= l;
CHECK(free_locals> 0,"Overflow of local symbols in line %d",t->lineno);
free_locals--;
locals[free_locals]= sym_no;
globals[free_locals]= g;
t->sym_ptr= l;
}
/*:44*//*47:*/
#line 1143 "web2w.w"

void ww_push(token*left)
{CHECK(wwsp<MAX_WWSTACK,"WW stack overflow");
DBG(dbglink,"Pushing[%d]:",wwsp);if(left!=NULL)DBG(dbglink,THE_TOKEN(left));
wwstack[wwsp++]= left;
}

token*ww_pop(token*right)
{token*left;
CHECK(wwsp> 0,"Mode stack underflow");
left= wwstack[--wwsp];
if(left!=NULL)left->link= right;
DBG(dbglink,"Popping[%d]:",wwsp);if(left!=NULL)DBG(dbglink,THE_TOKEN(left));
return left;
}

int ww_is(int tag)
{return wwsp> 0&&wwstack[wwsp-1]!=NULL&&wwstack[wwsp-1]->tag==tag;
}

/*:47*//*50:*/
#line 1209 "web2w.w"

void wwstring(char*wwtext)
{token*t= add_token(STRING);
t->sym_no= get_sym_no(wwtext);
t->text= SYM(t)->name;
*last_string= t;
last_string= &(t->link);
}
/*:50*//*52:*/
#line 1246 "web2w.w"

static int module_name_cmp(token*n,token*m)
{n= n->next;m= m->next;
if(n->next->tag==ELIPSIS)
return strncmp(n->text,m->text,strlen(n->text));
else
return strcmp(n->text,m->text);
}
/*:52*//*57:*/
#line 1288 "web2w.w"

module*find_module(token*atless)
{module**m= &module_root;
while(*m!=NULL)
{int d= module_name_cmp(atless,(*m)->atless);
if(d==0)
return*m;
else if(d<0)m= &((*m)->left);
else m= &((*m)->right);
}
CHECK(free_modules> 0,"Module table overflow");
*m= module_table+MAX_MODULE_TABLE-free_modules--;
(*m)->atless= atless;
return*m;
}
/*:57*//*58:*/
#line 1310 "web2w.w"

void add_module(token*atless)
{module*m= find_module(atless);
token*atgreater= m->atgreater;
if(atgreater==NULL)
m->atgreater= atless->link;
else
{while(atgreater->link!=NULL)atgreater= atgreater->link;
atgreater->link= atless->link;
}
}
/*:58*//*64:*/
#line 1391 "web2w.w"

void def_macro(token*eq,int tag)
{token*id;
if(eq->previous->tag==PARAM)
{id= eq->previous->previous;
tag= PMACRO;
}
else
{id= eq->previous;
}
CHGTAG(id,tag);
CHGID(id,tag);
SYM(id)->eq= eq;
DBG(dbgexpand,"Defining %s: %s\n",tagname(tag),SYM(id)->name);
}
/*:64*//*69:*/
#line 1475 "web2w.w"

void pperror(const char*message)
{ERROR("Parse error line %d: %s",pplval->lineno,message);}
/*:69*//*71:*/
#line 1530 "web2w.w"

token*pp_push(token*link,token*eq,int environment,token*parameter)
{CHECK(pp_sp> 0,"Pascal lexer stack overflow");
pp_sp--;
pp_stack[pp_sp].link= link;
pp_stack[pp_sp].next= eq->next;
pp_stack[pp_sp].end= eq->link;
pp_stack[pp_sp].environment= environment;
pp_stack[pp_sp].parameter= parameter;
DBG(dbgexpand,"Push pplex[%d]: ",MAX_PPSTACK-pp_sp);DBGTOKS(dbgexpand,eq->next,eq->link);
return pp_stack[pp_sp].next;
}

token*pp_pop(void)
{CHECK(pp_sp<MAX_PPSTACK,"Pascal Lexer stack underflow");
pp_sp++;
DBG(dbgexpand,"Pop pplex[%d]: ",MAX_PPSTACK-pp_sp);
DBGTOKS(dbgexpand,pp_stack[pp_sp].next,pp_stack[pp_sp].end);
return pp_stack[pp_sp].next;
}
/*:71*//*72:*/
#line 1561 "web2w.w"

int pplex(void)
{token*t;
int tag;
t= pp_stack[pp_sp].next;
while(true)
{
if(t==pp_stack[pp_sp].end)
{/*87:*/
#line 1886 "web2w.w"

token*link= pp_stack[pp_sp].link;
if(link!=NULL)
{token*eq;
eq= link->next;
link= link->link;
pp_pop();
t= pp_push(link,eq,0,NULL);
}
else
t= pp_pop();
/*:87*/
#line 1569 "web2w.w"

continue;
}
tag= t->tag;
tag_known:
if(tag> FIRST_PASCAL_TOKEN)
{
pp_stack[pp_sp].next= t->next;
goto found;
}
else
{switch(tag)
{/*73:*/
#line 1600 "web2w.w"

case NL:
case INDENT:
if(pascal!=NULL)fprintf(pascal,"%s",token2string(t));
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
case ATRIGHT:
t= t->next;
continue;
/*:73*//*74:*/
#line 1625 "web2w.w"

case MLEFT:
case PLEFT:
t= t->link->next;
continue;
/*:74*//*75:*/
#line 1634 "web2w.w"

case PEOF:
pp_stack[pp_sp].next= t->next;
goto found;
/*:75*//*76:*/
#line 1646 "web2w.w"

case ATDOLLAR:
case OCTAL:
case HEX:
case CHAR:
pp_stack[pp_sp].next= t->next;
tag= PINTEGER;
goto found;
/*:76*//*77:*/
#line 1662 "web2w.w"

case ID:
{symbol*s= SYM(t);
tag= s->tag;
if(tag==ID)
tag= s->tag= PID;
t->sym_ptr= s;
t->tag= tag;
goto tag_known;
}
/*:77*//*78:*/
#line 1707 "web2w.w"

case WDEBUG:
case WGUBED:
case WINIT:
case WTINI:
case WSTAT:
case WTATS:
t= t->next;
continue;
/*:78*//*82:*/
#line 1794 "web2w.w"

case NMACRO:
t->sym_ptr= SYM(t);
if(t->sym_ptr->eq->next->tag==STRING)
{token*s= t->sym_ptr->eq->next;
s->sym_ptr= SYM(s);
s->sym_ptr->value++;
DBG(dbgstring,"Using numeric macro %s (%d) in line %d\n",
s->sym_ptr->name,s->sym_ptr->value,t->lineno);
}
pp_stack[pp_sp].next= t->next;
goto found;
case STRING:
t->sym_ptr= SYM(t);
t->sym_ptr->value++;
DBG(dbgstring,"Using string %s (%d) in line %d\n",
t->sym_ptr->name,t->sym_ptr->value,t->lineno);
pp_stack[pp_sp].next= t->next;
goto found;
/*:82*//*86:*/
#line 1868 "web2w.w"

case ATLESS:
{token*eq,*atgreater;
atgreater= find_module(t)->atgreater;
CHECK(atgreater!=NULL,"Undefined module @<%s ...@> in line %d",
token2string(t->next),t->lineno);
DBG(dbgexpand,"Expanding module @<%s@> in line %d\n",
token2string(t->next),t->lineno);
eq= atgreater->next;
pp_stack[pp_sp].next= t->link->next;
t= pp_push(atgreater->link,eq,0,NULL);
continue;
}
/*:86*//*88:*/
#line 1900 "web2w.w"

case OMACRO:
{token*eq;
eq= SYM(t)->eq;
pp_stack[pp_sp].next= t->next;
DBG(dbgexpand,"Expanding ordinary macro %s in line %d\n",token2string(t),t->lineno);
t= pp_push(NULL,eq,0,NULL);
continue;
}
/*:88*//*90:*/
#line 1954 "web2w.w"

case PMACRO:
{token*open,*eq;
int popen;
DBG(dbgexpand,"Expanding parameter macro %s in line %d\n",
token2string(t),t->lineno);
eq= SYM(t)->eq;
pp_stack[pp_sp].next= t->next;
popen= pplex();
CHECK(popen==POPEN,"expected ( after macro with parameter");
open= pplval;
pp_stack[pp_sp].next= open->link->next;
/*144:*/
#line 2929 "web2w.w"

{token*p;int count= 1;
if(open->next->tag==HASH)
{DBG(dbgmacro,"Counting %s parameters (#) in line %d\n",SYM(t)->name,t->lineno);}
else
{for(p= open->next;p!=open->link;p= p->next)
if(p->tag==PCOMMA)count++;
else if(p->tag==POPEN)p= p->link;
if(SYM(t)->value==0)SYM(t)->value= count;
else if(SYM(t)->value!=count)SYM(t)->value= 4;
DBG(dbgmacro,"Counting %s parameters %d line %d\n",SYM(t)->name,SYM(t)->value,t->lineno);
}
}
/*:144*/
#line 1966 "web2w.w"

t= pp_push(NULL,eq,pp_sp,open);
continue;
}
/*:90*//*91:*/
#line 1977 "web2w.w"

case HASH:
{token*parameter= pp_stack[pp_sp].parameter;
int environment= pp_stack[pp_sp].environment;
pp_stack[pp_sp].next= t->next;
t= pp_push(NULL,parameter,pp_stack[environment].environment,
pp_stack[environment].parameter);
continue;
}
/*:91*//*153:*/
#line 3037 "web2w.w"

case PRETURN:
t->sym_ptr= SYM(t);
pp_stack[pp_sp].next= t->next;
goto found;
/*:153*//*190:*/
#line 3954 "web2w.w"

case CSEMICOLON:
t= t->next;
continue;
/*:190*/
#line 1581 "web2w.w"

default:
ERROR("Unexpected token in pplex:"THE_TOKEN(t));
}
}
}
found:
DBG(dbgpascal,"pplex: %s->\t",tagname(tag));
DBG(dbgpascal,THE_TOKEN(t));
if(pascal!=NULL)fprintf(pascal,"%s ",token2string(t));
pplval= t;
return tag;
}
/*:72*//*84:*/
#line 1822 "web2w.w"

int getval(token*t)
{int n= 0;
switch(t->tag)
{case ATDOLLAR:n= 0;break;
case PINTEGER:n= strtol(t->text,NULL,10);break;
case NMACRO:
t= SYM(t)->eq;
CHECK(t->tag==EQEQ,"= expected in numeric macro in line %d",t->lineno);
t= t->next;
if(t->tag==PMINUS){t= t->next;n= -getval(t);}
else n= getval(t);
while(true)
{if(t->next->tag==PPLUS)
{t= t->next->next;n= n+getval(t);}
else if(t->next->tag==PMINUS)
{t= t->next->next;n= n-getval(t);}
else break;
}
break;
case OCTAL:n= strtol(t->text+2,NULL,8);break;
case HEX:n= strtol(t->text+2,NULL,16);break;
case CHAR:n= (int)(unsigned char)t->text[1];break;
case PCONSTID:n= SYM(t)->value;break;
default:ERROR("Unable to get value for tag %s in line %d",TAG(t),t->lineno);
}
return n;
}
/*:84*//*95:*/
#line 2024 "web2w.w"

token*join(int tag,token*left,token*right,int value)
{token*n= new_token(tag);
n->previous= left;
n->next= right;
n->value= value;
DBG(dbgjoin,"tree: ");DBGTREE(dbgjoin,n);
return n;
}
/*:95*//*97:*/
#line 2059 "web2w.w"

static void wput(char c)
{fputc(c,w);
alfanum= isalnum(c);
comma= c==',';
if(c=='\n')column= 0;else column++;
}

static void wputs(char*str)
{while(*str!=0)wput(*str++);
}

static void wputi(int i)
{if(alfanum||comma)fputc(' ',w),column++;
column+= fprintf(w,"%d",i);
alfanum= true;
comma= false;
}

static void wprint(char*str)
{if((alfanum||comma)&&isalnum(str[0]))fputc(' ',w);
wputs(str);
}
/*:97*//*99:*/
#line 2092 "web2w.w"

static char*token2string(token*t)
{CHECK(t!=NULL,"Unable to convert NULL token to a string");
switch(t->tag)
{default:
if(t->text!=NULL)
return t->text;
else
return"";
/*39:*/
#line 1008 "web2w.w"

case ID:case PID:case PCONSTID:
case PARRAYFILETYPEID:case PARRAYFILEID:
case PFUNCID:case PPROCID:
case PDEFVARID:case PDEFPARAMID:case PDEFREFID:case PDEFCONSTID:
case PDEFTYPEID:case PDEFTYPESUBID:case PDEFFUNCID:case CREFID:
case NMACRO:case OMACRO:case PMACRO:
return SYM(t)->name;
/*:39*//*189:*/
#line 3949 "web2w.w"

case CSEMICOLON:
return";";
/*:189*/
#line 2101 "web2w.w"

}
}
/*:99*//*101:*/
#line 2131 "web2w.w"

static token*wtoken(token*t)
{static int level= 0;
level++;
DBG(dbgcweb,"wtoken[%d] %s (%s) line %d\n",level,TAG(t),token2string(t),t->lineno);
switch(t->tag)
{/*79:*/
#line 1721 "web2w.w"

case WDEBUG:
if(t->previous->tag==BAR)
wputs(t->text);
else
{if(column!=0)wput('\n');
wputs("#ifdef @!DEBUG\n");
}
t= t->next;break;
case WINIT:
if(t->previous->tag==BAR)
wputs(t->text);
else
{if(column!=0)wput('\n');
wputs("#ifdef @!INIT\n");
}
t= t->next;break;
case WSTAT:
if(t->previous->tag==BAR)
wputs(t->text);
else
{
if(column!=0)wput('\n');
wputs("#ifdef @!STAT\n");
}
t= t->next;break;
case WGUBED:
case WTINI:
case WTATS:
if(t->previous->tag==BAR)
wputs(t->text);
else
{if(column!=0)wput('\n');
wputs("#endif\n");
}
t= t->next;
if(t->tag==ATPLUS||t->tag==ATSLASH)t= t->next;
if(t->tag==NL)t= t->next;
break;
/*:79*//*80:*/
#line 1763 "web2w.w"

case ATPLUS:
t= t->next;
if(!following_directive(t))
wputs("@+");
else
DBG(dbgcweb,"Eliminating @+ in line %d\n",t->lineno);
break;
/*:80*//*104:*/
#line 2172 "web2w.w"

case CIGNORE:case PPROGRAM:case PLABEL:case PCONST:case PVAR:
case PPACKED:case POF:case ATQM:case ATBACKSLASH:
t= t->next;break;
/*:104*//*106:*/
#line 2186 "web2w.w"

case PFORWARD:
if(t->next->tag==PSEMICOLON)wput(';'),t= t->next->next;
else wprint("forward"),t= t->next;
if(t->tag==ATT)t= t->next;
break;
/*:106*//*107:*/
#line 2200 "web2w.w"

case METACOMMENT:
{char*c;
wputs("/*");
for(c= t->text+2;c[0]!='@'||c[1]!='}';c++)wput(*c);
wputs("*/");
t= t->next;
}
break;
case ATLEFT:
if(column!=0)wput('\n');
wputs("#if 0\n");
t= t->next;break;
case ATRIGHT:
if(column!=0)wput('\n');
wputs("#endif\n");
t= t->next;break;
/*:107*//*108:*/
#line 2224 "web2w.w"

case PLEFT:case MLEFT:wputs(" /*");t= t->next;break;
case RIGHT:wputs("*/ ");t= t->next;break;
case PSEMICOLON:wputs(";");t= t->next;break;
case PCOMMA:wputs(",");t= t->next;break;
case PMOD:wput('%');t= t->next;break;
case PDIV:wput('/');t= t->next;break;
case PNIL:wprint("NULL");t= t->next;break;
case POR:wputs("||");t= t->next;break;
case PAND:wputs("&&");t= t->next;break;
case PNOT:wputs("!");t= t->next;break;
case PIF:wprint("if (");t= t->next;break;
case PTHEN:wputs(") ");t= t->next;break;
case PASSIGN:wput('=');t= t->next;break;
case PNOTEQ:wputs("!=");t= t->next;break;
case PEQ:wputs("==");t= t->next;break;
case EQEQ:wput('\t');t= t->next;break;
case OCTAL:wprint("0");wputs(t->text+2);t= t->next;break;
case HEX:wprint("0x");wputs(t->text+2);t= t->next;break;
case PTYPEINT:wprint("int");t= t->next;break;
case PTYPEREAL:wprint("double");t= t->next;break;
case PTYPEBOOL:wprint("bool");t= t->next;break;
case PTYPECHAR:wprint("unsigned char");t= t->next;break;
/*:108*//*109:*/
#line 2252 "web2w.w"

case PBEGIN:wput('{'),t= t->next;
if(!following_directive(t))wputs("@+");
break;
/*:109*//*112:*/
#line 2275 "web2w.w"

case PDOTDOT:wprint("dotdot");t= t->next;break;
/*:112*//*115:*/
#line 2354 "web2w.w"

case PSLASH:
wput('/');
if(t->next->tag!=PMACRO||t->next->sym_no!=float_constant_no)
{wprint("(double)");
DBG(dbgslash,"Inserting (double) after / in line %d\n",t->lineno);
}
t= t->next;break;
/*:115*//*116:*/
#line 2377 "web2w.w"

case ATEX:
t= t->next;
if(t->tag!=ID&&t->tag!=PID&&t->tag!=PFUNCID&&
t->tag!=PDEFVARID&&t->tag!=PDEFPARAMID&&t->tag!=PDEFTYPEID&&
t->tag!=OMACRO&&t->tag!=PMACRO&&t->tag!=NMACRO&&
t->tag!=CINTDEF&&t->tag!=CSTRDEF&&t->tag!=PDIV&&
t->tag!=WDEBUG&&t->tag!=WINIT&&t->tag!=WSTAT)
{wputs("@!");
DBG(dbgbasic,"Tag after @! is %s in line %d\n",tagname(t->tag),t->lineno);
}
break;
/*:116*//*119:*/
#line 2406 "web2w.w"

case ID:
case PID:
case OMACRO:
case PMACRO:
case NMACRO:
wid(t);t= t->next;break;
/*:119*//*121:*/
#line 2451 "web2w.w"

case PCHAR:
{char*str= t->text;
wput(' ');
wput('\''),str++;
if(str[0]=='\'')wputs("\\'");
else if(str[0]=='\\')wputs("\\\\");
else if(str[0]=='@')wputs("@@");
else wput(str[0]);
wput('\'');
wput(' ');
}
t= t->next;
break;
case PSTRING:
{char*str= t->text;
wput('"'),str++;
while(*str!=0)
{if(str[0]=='\''&&str[1]=='\'')wput('\''),str++;
else if(str[0]=='"'&&str[1]=='"')wputs("\\\""),str++;
else if(str[0]=='\\')wputs("\\\\");
else if(str[0]=='\''&&str[1]==0)wput('"');
else if(str[0]=='"'&&str[1]==0)wput('"');
else if(str[0]=='"')wput('\\'),wput('"');
else wput(str[0]);
str++;
}
}
t= t->next;
break;
/*:121*//*122:*/
#line 2488 "web2w.w"

case ATLESS:
wputs("@<");
t= t->next;
CHECK(t->tag==TEXT,"Module name expected instead of %s in line %d",
token2string(t),t->lineno);
{char*str= t->text;
do
if(str[0]=='@'&&str[1]==',')
str= str+2;
else if(column> 80&&isspace(*str))wput('\n'),str++;
else wput(*str++);
while(*str!=0);
}
t= t->next;
if(t->tag==ELIPSIS)wputs("..."),t= t->next;
CHECK(t->tag==ATGREATER,"@> expected instead of %s in line %d",
token2string(t),t->lineno);
wputs("@>");
t= t->next;
if(t->tag==ATSLASH)wputs("@;"),t= t->next;
else if(t->tag==PELSE||
(t->tag==NL))wputs("@;");
break;
/*:122*//*123:*/
#line 2527 "web2w.w"

case CHAR:
{char c= t->text[1];
wput('\'');
if(c=='\''||c=='\\')wput('\\');
wput(c);
wput('\'');
t= t->next;break;
}
case ATDOLLAR:wputs("0");t= t->next;break;
/*:123*//*124:*/
#line 2550 "web2w.w"

case STRING:
{/*125:*/
#line 2565 "web2w.w"

if(t->sym_no==empty_string_no)
wprint("empty_string");
/*:125*//*136:*/
#line 2784 "web2w.w"

else if(t->sym_no==TeXinputs_no)wprint("TEX_area");
else if(t->sym_no==TeXfonts_no)wprint("TEX_font_area");
else if(t->sym_no==fmt_no)wprint("format_extension");
else if(t->sym_no==math_spacing_no)wprint("math_spacing");
/*:136*/
#line 2552 "web2w.w"

else
{wputs("@[@<|");wputs(SYM(t)->name);wputs("|@>@]");}
t= t->next;break;
}
/*:124*//*141:*/
#line 2855 "web2w.w"

case ATD:
{token*eq= t->next->next;
DBG(dbgcweb,"Macro definition in line %d\n",t->lineno);
if(SYM(t->next)->obsolete)
t= wskip_to(t,eq->link);
else
{wputs("@d "),t= t->next;
wprint(SYM(t)->name);
if(t->tag==NMACRO)
/*143:*/
#line 2908 "web2w.w"

{int has_operators;
wput('\t');
has_operators= 0;
for(t= eq->next;t!=eq->link&&t->tag!=MLEFT&&t->tag!=NL;t= t->next)
if(t->tag==PPLUS||t->tag==PMINUS){has_operators= 1;break;}
if(has_operators)wput('(');
for(t= eq->next;t!=eq->link&&t->tag!=MLEFT&&t->tag!=NL;t= wtoken(t))
continue;
if(has_operators)wput(')');
}
/*:143*/
#line 2865 "web2w.w"

else if(t->tag==OMACRO)
/*142:*/
#line 2891 "web2w.w"

{wput('\t');
t= eq->next;
}
/*:142*/
#line 2867 "web2w.w"

else if(t->tag==PMACRO)
/*145:*/
#line 2947 "web2w.w"

{static char*params[4]= {"X","X","X, Y","X, Y, Z"};
char*param;
eq= eq->next;
if(SYM(t)->value> 3)
{param= "...";hash_str= "__VA_ARGS__";}
else
hash_str= param= params[SYM(t)->value];
wput('('),wputs(param),wputs(")\t"),t= eq->next;
}
/*:145*/
#line 2869 "web2w.w"

else
ERROR("Macro name expected in line %d",t->lineno);
}
DBG(dbgcweb,"End Macro definition in line %d\n",t->lineno);
break;
}
case ATF:
{token*eq= t->next->next;
DBG(dbgcweb,"Format definition in line %d\n",t->lineno);
if(SYM(t->next)->obsolete)
t= wskip_to(t,eq->link);
else
{wputs("@f "),t= t->next;
wprint(SYM(t)->name);
t= wprint_to(eq->next,eq->link);
}
break;
}
/*:141*//*147:*/
#line 2963 "web2w.w"

case HASH:
wprint(hash_str),t= t->next;break;
/*:147*//*154:*/
#line 3052 "web2w.w"

case CLABEL:
if(t->sym_ptr->value<=0)
{t= t->next;
if(t->tag==PPLUS)
t= t->next->next;
if(t->tag==PCOLON)
{t= t->next;
if(t->tag==CSEMICOLON)
t= t->next;
}
}
else
{wprint(SYM(t)->name);t= t->next;
if(t->tag==PPLUS)
{t= t->next;wputs(t->text);t= t->next;}
}
break;
case CLABELN:
wprint("label");wputs(t->text);t= t->next;
break;
case PEXIT:
wprint("exit(0)");t= t->next;
break;
case PRETURN:
wprint("goto end");t= t->next;
break;
/*:154*//*155:*/
#line 3092 "web2w.w"

case CINTDEF:
wputs("enum {@+"),wid(t),wput('=');
t= wprint_to(t->link->next,t->link->link);
wputs("@+};");
t= t->next;
break;
case CSTRDEF:
wprint("const char *"),wid(t);t= t->next;break;
/*:155*//*159:*/
#line 3139 "web2w.w"

case PDEFVARID:
{token*type= t->link;
varlist= t;
DBG(dbgcweb,"Converting variable list in line %d\n",t->lineno);
while(type->tag==PID)type= type->link;
{int replace= 0;
/*184:*/
#line 3764 "web2w.w"


{token*subrange= NULL;
if(type->tag==CTSUBRANGE)
subrange= type->up;
else if(type->tag==CIGNORE&&type->next->tag==PID&&
type->next->sym_ptr->type!=NULL&&type->next->sym_ptr->type->tag==PDOTDOT)
subrange= type->next->sym_ptr->type;
if(subrange!=NULL)
{token*id= t;
while(id!=type&&!replace)
{if(id->sym_ptr->for_ctrl!=0)
{int lo= subrange->previous->value;
int hi= subrange->next->value;
int bits= FOR_CTRL_BITS(id->sym_ptr->for_ctrl);
int direction= FOR_CTRL_DIRECTION(id->sym_ptr->for_ctrl);
int lineno= FOR_CTRL_LINE(id->sym_ptr->for_ctrl);
replace= FOR_CTRL_REPLACE(id->sym_ptr->for_ctrl);
DBG(dbgfor,"Subrange for marked variable %s in line %d\n",
token2string(id),id->lineno);
DBG(dbgfor,"\tRange %d to %d, limit %d bits, direction %d in line %d\n",
lo,hi,bits,direction,lineno);
if(direction==DOWNTO_LOOP)
{if(lo>=0&&bits==0)replace= true;
else if(lo<0&&INT8_MIN<=lo&&hi<=INT8_MAX&&bits>=7)replace= true;
else if(lo<0&&INT16_MIN<=lo&&hi<=INT16_MAX&&bits>=15)replace= true;
}
else if(direction==TO_LOOP)
{if(lo<0&&INT8_MIN<=lo&&hi<=INT8_MAX&&bits>=7)replace= true;
else if(0<=lo&&hi<=UINT8_MAX&&bits>=8)replace= true;
else if(lo<0&&INT16_MIN<=lo&&hi<=INT16_MAX&&bits>=15)replace= true;
else if(0<=lo&&hi<=UINT16_MAX&&bits>=16)replace= true;
}
}
id= id->link;
}
}
}
/*:184*/
#line 3146 "web2w.w"

if(replace)
{wprint("int");
DBG(dbgfor,"\tReplacing subrange type by int\n");
}
else
wprint_to(type,type->link);
}
DBG(dbgcweb,"Finished variable type in line %d\n",t->lineno);
if(varlist->tag==PDEFVARID)
{wid(varlist);varlist= varlist->next;}
wprint_to(varlist,type);
t= type->link;
DBG(dbgcweb,"Finishing variable list in line %d\n",t->lineno);
break;
}
/*:159*//*160:*/
#line 3176 "web2w.w"

case PDEFTYPEID:
{token*type_name= t;
token*type= type_name->link;
DBG(dbgcweb,"Defining type %s in line %d\n",token2string(t),t->lineno);
wprint("typedef ");
t= wprint_to(type,type->link);
wprint(token2string(type_name));
break;
}
/*:160*//*161:*/
#line 3197 "web2w.w"

case CTSUBRANGE:
{int lo= t->up->previous->value;
int hi= t->up->next->value;
DBG(dbgcweb,"Defining subrange type %d..%d\n",lo,hi);
if(lo<0&&INT8_MIN<=lo&&hi<=INT8_MAX)wprint("int8_t");
else if(0<=lo&&hi<=UINT8_MAX)wprint("uint8_t");
else if(lo<0&&INT16_MIN<=lo&&hi<=INT16_MAX)wprint("int16_t");
else if(0<=lo&&hi<=UINT16_MAX)wprint("uint16_t");
else if(lo<0&&INT32_MIN<=lo&&hi<=INT32_MAX)wprint("int32_t");
else if(0<=lo&&hi<=UINT32_MAX)wprint("uint32_t");
else ERROR("unable to convert subrange type %d..%d in line %d\n",lo,hi,t->lineno);
t= t->link;
break;
}
/*:161*//*163:*/
#line 3224 "web2w.w"

case PRECORD:
{DBG(dbgcweb,"Converting record type in line %d\n",t->lineno);
wprint("struct { ");
t= wprint_to(t->next,t->link);
DBG(dbgcweb,"Finished record type in line %d\n",t->lineno);
wprint("} ");
break;
}
case CUNION:
{DBG(dbgcweb,"Converting union type in line %d\n",t->lineno);
wprint("union { ");
t= wprint_to(t->next,t->link);
wprint("};");
DBG(dbgcweb,"Finished union type in line %d\n",t->lineno);
break;
}
/*:163*//*164:*/
#line 3268 "web2w.w"

case PARRAY:
if(t->up==NULL)
wputs(t->text),t= t->next;
else
{token*from= t->link;
token*index= from->link;
token*to= index->link;
token*element_type= to->link;
token*subrange= t->up;
int lo,hi,zero_based;

if(subrange->tag==PID)subrange= subrange->sym_ptr->type;
lo= subrange->previous->value;
hi= subrange->next->value;

zero_based= (subrange->previous->tag==PINTEGER&&lo==0)||
subrange->previous->tag==PTYPECHAR;
DBG(dbgarray,"Converting array[%d..%d] type in line %d\n",lo,hi,t->lineno);
t= wprint_to(element_type,element_type->link);
while(true)
{CHECK(varlist!=NULL,"Nonempty variable list expected in line %d",
varlist->lineno);
DBG(dbgarray,"Generating array variable %s in line %d\n",
varlist->sym_ptr->name,varlist->lineno);
wid(varlist);
if(!zero_based)wput('0');
wput('[');/*165:*/
#line 3313 "web2w.w"

{int hi,size;
hi= generate_constant(subrange->next,0,0);
size= generate_constant(subrange->previous,'-',hi);
size= size+1;
if(size<0)wput('-'),wputi(-size);
else if(size> 0)
{if(subrange->previous->tag!=PTYPECHAR&&
(subrange->previous->tag!=PINTEGER||subrange->next->tag!=PINTEGER))wput('+');
wputi(size);
}
}
/*:165*/
#line 3295 "web2w.w"
wput(']');
if(!zero_based)
{DBG(dbgarray,"Generating array pointer %s[%s=%d.. ] in line %d\n",
varlist->sym_ptr->name,token2string(from->next),lo,varlist->lineno);
wputs(", *const ");
wid(varlist);
wputs(" = ");
wid(varlist),wput('0');
/*166:*/
#line 3327 "web2w.w"

{int lo= generate_constant(subrange->previous,'-',0);
if(lo<0)wput('-'),wputi(-lo);
else if(lo> 0)wput('+'),wputi(lo);
}
/*:166*/
#line 3303 "web2w.w"
;
}
varlist= varlist->link;
if(varlist->tag==PDEFVARID||varlist->tag==PID)wput(',');else break;
}
DBG(dbgarray,"Finished array type in line %d\n",t->lineno);
}
break;
/*:164*//*169:*/
#line 3378 "web2w.w"

case PFILE:
{DBG(dbgcweb,"Converting file type in line %d\n",t->lineno);
wprint("struct {@+FILE *f;@+");
t= wprint_to(t->next,t->link);
wprint("@,d;@+} ");
DBG(dbgcweb,"Finished file type in line %d\n",t->lineno);
break;
}
/*:169*//*170:*/
#line 3404 "web2w.w"

case PUP:wputs(".d");t= t->next;break;
/*:170*//*171:*/
#line 3421 "web2w.w"

case PWHILE:
wprint("while ");
if(t->link!=NULL){
wput('(');t= wprint_to(t->next,t->link);wputs(") ");
}
t= t->next;break;
/*:171*//*172:*/
#line 3439 "web2w.w"

case PCASE:
if(t->link==NULL)
{wprint(t->text);t= t->next;}
else
{wprint("switch (");
t= wprint_to(t->next,t->link);
wputs(") {");
}
break;
/*:172*//*175:*/
#line 3485 "web2w.w"

case CBREAK:
if(t->previous->tag!=PSEMICOLON&&t->previous->tag!=CSEMICOLON
&&t->previous->tag!=PEND)wputs("@;");
if(!dead_end(t->up,t->lineno))wprint("@+break;");
t= t->next;
break;
/*:175*//*178:*/
#line 3523 "web2w.w"

case POTHERS:
wprint("default:");
t= t->next;
break;
/*:178*//*179:*/
#line 3546 "web2w.w"

case PREPEAT:wprint("@/do@+{");t= t->next;break;
case PUNTIL:
{int sequenceno,lineno;
token*end;
wputs("}@+ while (!(");
sequenceno= t->sequenceno;
lineno= t->lineno;
end= t->next;
while(true)
{if(end->tag==PSEMICOLON||end->tag==CSEMICOLON||end->tag==PELSE)
break;
else if(end->tag==ATSPACE)
{while(true)
{int tag= end->previous->tag;
if(tag> FIRST_PASCAL_TOKEN||tag==OMACRO||tag==NMACRO||tag==CHAR)break;
end= end->previous;
}
break;
}
end= end->next;
}
CHECK(sequenceno==end->sequenceno,"until: end of expression not found in line %d",lineno);
t= wprint_to(t->next,end);
wputs("))");
break;
}
/*:179*//*180:*/
#line 3583 "web2w.w"

case PFOR:
{token*id= t->next;
token*to= t->link;
if(to==NULL){wprint("for");t= t->next;break;}
wprint("for (");
wprint_to(id,to);
wputs("; ");
wid(id);
if(to->tag==PTO)wputs("<=");
else if(to->tag==PDOWNTO)wputs(">=");
else ERROR("to or downto expected in line %d",to->lineno);
wprint_to(to->next,to->link);
wputs("; ");
wid(id);
if(to->tag==PTO)wputs("++");
else wputs("--");
wputs(") ");
t= to->link->next;
break;
}
/*:180*//*185:*/
#line 3819 "web2w.w"

case PEND:wputs("} "),t= t->next;
if(t->tag==PSEMICOLON)t= t->next;
break;
/*:185*//*191:*/
#line 3965 "web2w.w"

case PPROCEDURE:
DBG(dbgcweb,"Converting procedure heading in line %d\n",t->lineno);
wprint("void");
t= wprint_to(t->next,t->link);
if(t->tag!=POPEN)wputs("(void)");
break;
/*:191*//*192:*/
#line 3984 "web2w.w"

case PDEFPARAMID:
case PDEFREFID:
{token*varlist= t,*type= t->link;
DBG(dbgcweb,"Converting parameter list in line %d\n",t->lineno);
while(type->tag==PDEFPARAMID||type->tag==PDEFREFID)type= type->link;
while(true)
{wprint_to(type,type->link);
if(varlist->tag==PDEFREFID)wputs(" *");
wid(varlist);
varlist= varlist->link;
if(varlist!=type)wput(',');
else break;
}
t= type->link;
DBG(dbgcweb,"Finishing parameter list in line %d\n",t->lineno);
break;
}
/*:192*//*193:*/
#line 4007 "web2w.w"

case CREFID:
wputs("(*"),wid(t),wput(')');
t= t->next;
break;
/*:193*//*196:*/
#line 4055 "web2w.w"

case PCALLID:
DBG(dbgcweb,"Converting call in line %d\n",t->lineno);
wid(t);
if(SYM(t)->value==1)wputs("()");
t= t->next;break;
/*:196*//*197:*/
#line 4069 "web2w.w"

case POPEN:
wput('(');
if(t->up==NULL||SYM(t->up)->value==0)
t= wprint_to(t->next,t->link);
else
{int param_mask= SYM(t->up)->value;
token*close= t->link;
t= t->next;
if(param_mask<0)wput('&');
param_mask= param_mask<<1;
while(t!=close)
{if(t->tag==PCOMMA)
{wputs(", ");t= t->next;
if(param_mask<0)wput('&');
param_mask= param_mask<<1;
}
else
t= wtoken(t);
}
}
break;
/*:197*//*198:*/
#line 4103 "web2w.w"

case PFUNCTION:
{token*param= t->link;
token*type;
DBG(dbgcweb,"Converting function heading in line %d\n",t->lineno);
if(param->tag==POPEN)type= param->link->link;
else type= param;
wprint_to(type,type->link);
wprint_to(t->next,t->link);
if(param->tag!=POPEN)wputs("(void)");
else wprint_to(param,param->link->next);
t= type->link;
break;
}
/*:198*//*205:*/
#line 4252 "web2w.w"

case PFBEGIN:
DBG(dbgcweb,"Adding scaled %s; in line %d\n",SYM(t)->name,t->lineno);
wprint("scaled");wid(t);wputs("; ");
t= t->next;
break;
case PFEND:
DBG(dbgcweb,"Adding return %s; in line %d\n",SYM(t)->name,t->lineno);
wprint("return");wid(t);wputs(";}");
t= t->next;
break;
/*:205*//*206:*/
#line 4266 "web2w.w"

case PFUNCID:
DBG(dbgcweb,"function %s in line %d assigns result variable\n",SYM(t)->name,t->lineno);
wid(t);
t= t->next;
break;
case CRETURN:
DBG(dbgcweb,"Converted function return %s in line %d\n",SYM(t)->name,t->lineno);
wprint("return");
t= t->next;
break;
case CPROCRETURN:
if(t->sym_ptr->value<=0)wprint("return");
else wprint("goto end");
t= t->next;
break;
/*:206*//*207:*/
#line 4292 "web2w.w"

case CMAIN:wprint("int main(void) {");t= t->next;break;
case CMAINEND:wprint("return 0; }");t= t->next;break;
/*:207*/
#line 2137 "web2w.w"

default:wprint(token2string(t));t= t->next;break;
}
level--;
return t;
}
/*:101*//*103:*/
#line 2153 "web2w.w"

static token*wprint_to(token*t,token*end)
{while(t!=end)
t= wtoken(t);
return t;
}

static token*wskip_to(token*t,token*end)
{while(t!=end)
t= t->next;
return t;
}
/*:103*//*111:*/
#line 2260 "web2w.w"

static bool following_directive(token*t)
{while(true)
if(WDEBUG<=t->tag&&t->tag<=WGUBED)return true;
else if(t->tag==ATPLUS||t->tag==ATEX||t->tag==ATSEMICOLON||
t->tag==NL||t->tag==INDENT)t= t->next;
else return false;
}
/*:111*//*118:*/
#line 2398 "web2w.w"

void wid(token*t)
{if(alfanum||comma)wput(' ');
if(t->previous->tag==ATEX)wputs("@!");
wputs(SYM(t)->name);
}
/*:118*//*131:*/
#line 2674 "web2w.w"

static int convert_arg(token*arg)
{if(arg->tag==STRING)
{symbol*s= symbol_table[arg->sym_no];
s->value--;
DBG(dbgstring,"Eliminating string argument %s (%d) in line %d\n",s->name,s->value,arg->lineno);
arg->tag= PSTRING;
return 1;
}
else if(arg->tag==CHAR)
{arg->tag= PSTRING;
return 1;
}
return 0;
}
void pstring_args(token*id,token*arg)
{if(arg->tag==PCOLON||arg->tag==CREFID)return;
if(id->sym_no==overflow_no||id->sym_no==prompt_file_name_no)
{CHECK(arg->tag==PCOMMA,"function should have two arguments in line %d",id->lineno);
convert_arg(arg->previous);
}
else if(id->sym_no==print_no)
{if(convert_arg(arg))id->sym_no= print_str_no;
}
else if(id->sym_no==print_str_no
||id->sym_no==print_nl_no
||id->sym_no==fatal_error_no
)
convert_arg(arg);
}
/*:131*//*132:*/
#line 2710 "web2w.w"

void pstring_assign(token*id,token*val)
{if(id->tag==PID&&(id->sym_no==help_line_no||id->sym_no==max_reg_help_line_no))
{SYM(val)->value--;
DBG(dbgstring,"Eliminating string assignment %s (%d) in line %d\n",
SYM(val)->name,SYM(val)->value,val->lineno);
val->tag= PSTRING;
}
else
DBG(dbgstring,"No string assignment %s (%d) in line %d\n",
SYM(val)->name,SYM(val)->value,val->lineno);
}
/*:132*//*134:*/
#line 2733 "web2w.w"

int predefine(char*name,int tag,int value)
{int sym_no= get_sym_no(name);
symbol*s= symbol_table[sym_no];
s->tag= tag;
s->value= value;
return sym_no;
}
/*:134*//*149:*/
#line 2991 "web2w.w"

void clabel(token*t,int use)
{
if(t->tag==NMACRO)
{SYM(t)->obsolete= true;
SYM(t)->value+= use;
t->tag= CLABEL;
}
else if(t->tag==CLABEL)
SYM(t)->value+= use;
else if(t->tag==PRETURN)
SYM(t)->value+= use;
else
{if(t->tag==PINTEGER)
t->tag= CLABELN;
return;
}
DBG(dbgstring,"Using label %s (%d) in line %d\n",SYM(t)->name,SYM(t)->value,t->lineno);
}
/*:149*//*167:*/
#line 3341 "web2w.w"

int generate_constant(token*t,char sign,int value)
{if(t->tag==PTYPECHAR||t->tag==PINTEGER)
{if(sign=='-')return value-t->value;else return value+t->value;}
else if(t->tag==NMACRO||t->tag==PCONSTID)
{if(sign!=0)wput(sign);wprint(token2string(t->previous));
return value;
}
if(t->tag==PPLUS)
{if(t->previous!=NULL)value= generate_constant(t->previous,sign,value);
if(sign==0)sign= '+';
return generate_constant(t->next,sign,value);
}
if(t->tag==PMINUS)
{if(t->previous!=NULL)value= generate_constant(t->previous,sign,value);
if(sign==0||sign=='+')sign= '-';else sign= '+';
return generate_constant(t->next,sign,value);
}
else
ERROR("Unexpected tag %s while generating a constant expression in line %d",TAG(t),t->lineno);
}
/*:167*//*174:*/
#line 3465 "web2w.w"

token*winsert_after(token*t,int tag,char*text)
{token*n;
DBG(dbgcweb,"Inserting token %s after %s in line %d\n",
tagname(tag),TAG(t),t->lineno);
n= new_token(tag);
n->next= t->next;
n->next->previous= n;
n->previous= t;
t->next= n;
n->sequenceno= t->sequenceno;
n->lineno= t->lineno;
n->text= text;
return n;
}
/*:174*//*177:*/
#line 3505 "web2w.w"

int dead_end(token*t,int lineno)
{DBG(dbgbreak,"Searching for dead end in line %d:\n",lineno);
while(true)
{DBG(dbgbreak,"\t%s\n",TAG(t));
if(t->tag==PGOTO||t->tag==PEXIT||t->tag==CPROCRETURN)return true;
else if(t->tag==PCOLON)t= t->next;
else if(t->tag==PBEGIN)t= t->previous;
else if(t->tag==PSEMICOLON||t->tag==CCASE)
{if(t->next->tag==CEMPTY)t= t->previous;else t= t->next;}
else return false;
}
}
/*:177*//*182:*/
#line 3659 "web2w.w"

void mark_for_variable(token*id,int lineno,int value,int direction)
{int replace= 0;
int bits= 0;
if(direction==VAR_LOOP)replace= 1;
else if(direction==DOWNTO_LOOP)
{if(value>=0)bits= 0;
else if(value> INT8_MIN)bits= 6;
else if(value> INT16_MIN)bits= 14;
else bits= 15;
}
else
{if(value<0)bits= 0;
else if(value<INT8_MAX)bits= 6;
else if(value<UINT8_MAX)bits= 7;
else if(value<INT16_MAX)bits= 14;
else if(value<UINT16_MAX)bits= 15;
else if(value<INT32_MAX)bits= 31;
else bits= 32;
}
SYM(id)->for_ctrl= FOR_CTRL_PACK(lineno,replace,direction,bits);
}
/*:182*//*186:*/
#line 3855 "web2w.w"

bool wneeds_semicolon(token*p)
{while(p!=NULL)
{switch(p->tag)
{case PCASE:case PBEGIN:case CIGNORE:return false;
case PSEMICOLON:
case CCASE:case PELSE:p= p->next;continue;
case PIF:case PWHILE:case PFOR:case PCOLON:p= p->previous;continue;
case PASSIGN:case PFUNCID:case PCALLID:case PREPEAT:
case PRETURN:case CRETURN:case CPROCRETURN:case PGOTO:case PEXIT:case CEMPTY:
default:return true;
}
}
return false;
}

static token*wback(token*t)
{while(true)
{CHECK(t->previous!=NULL,"Error searching backward");
t= t->previous;
switch(t->tag)
{case PSEMICOLON:case CSEMICOLON:case PEND:return t;
case RIGHT:while(t->tag!=PLEFT&&t->tag!=MLEFT)t= t->previous;
break;
case ATGREATER:case EQ:case HASH:case ATDOLLAR:case NMACRO:case OMACRO:
case OCTAL:case HEX:case CHAR:case STRING:case PRETURN:case CEMPTY:
return t;
case CIGNORE:continue;
default:break;
}
if(t->tag> FIRST_PASCAL_TOKEN)
return t;
}
}

void wsemicolon(token*p,token*t)
{t= wback(t);
if(t->tag!=PSEMICOLON&&t->tag!=CSEMICOLON&&t->tag!=PEND)
{if(wneeds_semicolon(p))
{DBG(dbgsemicolon,"inserting ; in line %d\n",t->lineno);
if(t->next->tag==ATSEMICOLON)
{t->next->tag= CSEMICOLON;t->next->text= ";";}
else
winsert_after(t,CSEMICOLON,";");
}
else if(t->next->tag!=ATSEMICOLON&&t->next->tag!=PSEMICOLON)
{
DBG(dbgsemicolon,"inserting @; in line %d\n",t->lineno);
winsert_after(t,ATSEMICOLON,"@;");
}

}
}
/*:186*//*187:*/
#line 3918 "web2w.w"

void wend(token*p,token*t)
{if(p->tag==PSEMICOLON&&p->next->tag==PCOLON&&
p->next->next->tag==CEMPTY&&p->next->previous->tag==CLABEL&&
p->next->previous->sym_no==exit_no)
{token*label= p->next->previous;
DBG(dbgreturn,"Trailing exit: found preceding line %d\n",t->lineno);
label->tag= CIGNORE;
SYM(label)->value= -1000;
CHECK(label->next->tag==PCOLON,"Expected colon after label in line %d\n",label->lineno);
label->next->tag= CIGNORE;
p->next->tag= CIGNORE;
}
else
DBG(dbgreturn,"No trailing exit: found preceding line %d\n",t->lineno);
}

/*:187*//*199:*/
#line 4136 "web2w.w"

static bool wtail(token*t)
{CHECK(t!=NULL,"Unexpected NULL token while searching for tail statements");
switch(t->tag)
{case PSEMICOLON:case PELSE:case CCASE:
return wtail(t->next)&&wtail(t->previous);
case PCOLON:
return wtail(t->next);
case PRETURN:case CIGNORE:case CEMPTY:
return true;
case PASSIGN:case PCALLID:
case PFUNCID:case CRETURN:case CPROCRETURN:
case PWHILE:case PREPEAT:case PFOR:
case PEXIT:case PGOTO:
return false;
case PBEGIN:case PIF:case PCASE:
return wtail(t->previous);
default:ERROR("Unexpected tag %s while searching for tail statements",TAG(t));
}
}
/*:199*//*201:*/
#line 4176 "web2w.w"

void wreturn(token*t,int tail,token*link)
{CHECK(t!=NULL,"Unexpected NULL token while searching for return statements");
switch(t->tag)
{case PSEMICOLON:
if(t->next->tag==PRETURN)
wreturn(t->previous,true,t->next);
else
{wreturn(t->next,tail,link);
if(wtail(t->next))wreturn(t->previous,tail,link);
else wreturn(t->previous,false,NULL);
}
return;
case PCOLON:
wreturn(t->next,tail,link);
return;
case PASSIGN:case PCALLID:
case PRETURN:case PEXIT:case PGOTO:case CIGNORE:case CEMPTY:
return;
case PWHILE:case PREPEAT:case PFOR:
wreturn(t->previous,false,NULL);return;
case PELSE:case CCASE:
wreturn(t->next,tail,link);wreturn(t->previous,tail,link);return;
case PCASE:case PIF:case PBEGIN:
wreturn(t->previous,tail,link);return;
case PFUNCID:
if(tail)
{DBG(dbgreturn,"Converting assignment to function in line %d\n",t->lineno);
t->tag= CRETURN;IGN(t->next);
if(link!=NULL)
{link->sym_ptr->value--;
t->sym_ptr= link->sym_ptr;
IGN(link),IGN(link->next);
DBG(dbgreturn,"Eliminating label %s (%d) in line %d\n",
link->sym_ptr->name,link->sym_ptr->value,t->lineno);
}
}
return;
case CRETURN:
if(t->sym_ptr!=NULL){
t->sym_ptr->value--;
DBG(dbgreturn,"Eliminating label %s (%d) in line %d\n",
t->sym_ptr->name,t->sym_ptr->value,t->lineno);
}
return;
default:ERROR("Unexpected tag %s in line %d"
" while searching for return statements",TAG(t),t->lineno);
}
}
/*:201*//*209:*/
#line 4381 "web2w.w"

void usage(void)
{fprintf(stderr,
"Usage: web2w [parameters] filename.web\n"
"Parameters:\n"
"\t -p   \t generate a pascal output file\n"
"\t -o file   \t specify an output file name\n"
"\t -l   \t redirect stderr to a log file\n"
"\t -y   \t generate a trace while parsing pascal\n"
"\t -d XX\t hexadecimal debug value. OR together these values:\n"
"\t \t   \t XX=1   basic debugging\n"
"\t \t   \t XX=2   flex debugging\n"
"\t \t   \t XX=4   link debugging\n"
"\t \t   \t XX=8   token debugging\n"
"\t \t   \t XX=10  identifier debugging\n"
"\t \t   \t XX=20  pascal tokens debugging\n"
"\t \t   \t XX=40  expansion debugging\n"
"\t \t   \t XX=80  bison debugging\n"
"\t \t   \t XX=100 pascal parser debugging\n"
"\t \t   \t XX=200 cweb debugging\n"
"\t \t   \t XX=400 join debugging\n"
"\t \t   \t XX=800 string pool debugging\n"
"\t \t   \t XX=1000 for variables debugging\n"
"\t \t   \t XX=2000 for real division debugging\n"
"\t \t   \t XX=4000 for macro debugging\n"
"\t \t   \t XX=8000 for array debugging\n"
"\t \t   \t XX=10000 for return debugging\n"
"\t \t   \t XX=20000 for semicolon debugging\n"
"\t \t   \t XX=40000 for break debugging\n"
);
exit(1);
}
/*:209*/
#line 514 "web2w.w"


int main(int argc,char*argv[])
{/*213:*/
#line 4456 "web2w.w"

{int mk_logfile= 0,mk_pascal= 0,baselength= 0;
char*w_file_name= NULL;
ww_flex_debug= 0;
ppdebug= 0;
if(argc<2)usage();
argv++;
while(*argv!=NULL)
{if((*argv)[0]=='-')
{char option= (*argv)[1];
switch(option)
{default:usage();
case'p':mk_pascal= 1;break;
case'o':argv++;w_file_name= *argv;break;
case'l':mk_logfile= 1;break;
case'y':ppdebug= 1;break;
case'd':
argv++;if(*argv==NULL)usage();
debugflags= strtol(*argv,NULL,16);
if(debugflags&dbgflex)ww_flex_debug= 1;
if(debugflags&dbgbison)ppdebug= 1;
break;
}
}
else
{strncpy(basename,*argv,MAX_NAME-1);
baselength= strlen(basename)-4;
if(baselength<1||strncmp(basename+baselength,".web",4)!=0)usage();
basename[baselength]= 0;
if(*(argv+1)!=NULL)usage();
}
argv++;
}
/*214:*/
#line 4502 "web2w.w"

if(mk_logfile)
{basename[baselength]= 0;
strcat(basename,".log");
logfile= freopen(basename,"w",stderr);
if(logfile==NULL)
{fprintf(stderr,"Unable to open logfile %s",basename);
logfile= stderr;
}
wwout= logfile;
}
else
{logfile= stderr;
wwout= stderr;
}
basename[baselength]= 0;
strcat(basename,".web");
wwin= fopen(basename,"r");
if(wwin==NULL)ERROR("Unable to open input file %s",basename);
if(w_file_name==NULL)
{w_file_name= basename;
basename[baselength]= 0;
strcat(basename,".w");
}
w= fopen(w_file_name,"w");
if(w==NULL)ERROR("Unable to open output file %s",w_file_name);
if(mk_pascal)
{basename[baselength]= 0;
strcat(basename,".pas");
pascal= fopen(basename,"w");
if(pascal==NULL)ERROR("Unable to open pascal file %s",basename);
}
/*:214*/
#line 4489 "web2w.w"

}
/*:213*/
#line 517 "web2w.w"

/*4:*/
#line 552 "web2w.w"

/*22:*/
#line 768 "web2w.w"

first_token= last_token= new_token(HEAD);
first_token->text= "";
/*:22*//*62:*/
#line 1358 "web2w.w"

program= first_token;
/*:62*//*114:*/
#line 2350 "web2w.w"

float_constant_no= predefine("float_constant",ID,0);
/*:114*//*135:*/
#line 2743 "web2w.w"

print_str_no= predefine("print_str",PPROCID,0);
empty_string_no= predefine("\"\"",PID,1);
help_line_no= predefine("help_line",ID,0);
print_no= predefine("print",PPROCID,0);
overflow_no= predefine("overflow",PPROCID,0);
print_err_no= predefine("print_err",PPROCID,0);
print_nl_no= predefine("print_nl",PPROCID,0);
fatal_error_no= predefine("fatal_error",PPROCID,0);
prompt_file_name_no= predefine("prompt_file_name",PPROCID,0);
max_reg_help_line_no= predefine("max_reg_help_line",ID,0);
/*:135*//*139:*/
#line 2802 "web2w.w"

TeXinputs_no= predefine("\"TeXinputs:\"",PID,0);
TeXfonts_no= predefine("\"TeXfonts:\"",PID,0);
fmt_no= predefine("\".fmt\"",PID,0);
math_spacing_no= predefine(
"\"0234000122*4000133**3**344*0400400*000000234000111*1111112341011\"",PID,1);
/*:139*//*152:*/
#line 3028 "web2w.w"

exit_no= get_sym_no("exit");
/*:152*//*204:*/
#line 4240 "web2w.w"

x_over_n= get_sym_no("x_over_n");
xn_over_d= get_sym_no("xn_over_d");
/*:204*//*208:*/
#line 4325 "web2w.w"

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
/*:208*/
#line 553 "web2w.w"

wwlex();
/*66:*/
#line 1423 "web2w.w"

TOK("",ATP);PROGRAM;PUSH;TOK("",PEOF);TOK("",WEBEOF);POP;
/*:66*//*67:*/
#line 1430 "web2w.w"

if(debugflags&dbgtoken)
{token*t= first_token;
while(t!=NULL){MESSAGE(THE_TOKEN(t));t= t->next;}
}
if(debugflags&dbgid)
{int i;
for(i= free_symbols;i<MAX_SYMBOLS;i++)
MESSAGE("symbol[%d]=%s\n",i,symbols[i].name);
}
/*:67*//*81:*/
#line 1775 "web2w.w"

SYM_PTR("debug")->obsolete= 1;
SYM_PTR("gubed")->obsolete= 1;
SYM_PTR("stat")->obsolete= 1;
SYM_PTR("tats")->obsolete= 1;
SYM_PTR("init")->obsolete= 1;
SYM_PTR("tini")->obsolete= 1;
/*:81*//*89:*/
#line 1917 "web2w.w"

SYM_PTR("return")->obsolete= 1;
SYM_PTR("endcases")->obsolete= 1;
SYM_PTR("othercases")->obsolete= 1;
SYM_PTR("mtype")->obsolete= 1;
SYM_PTR("final_end")->obsolete= 1;
/*:89*//*120:*/
#line 2427 "web2w.w"

SYM_PTR("xclause")->name= "else";
SYM_PTR("switch")->name= "get_cur_chr";
SYM_PTR("continue")->name= "resume";
SYM_PTR("exit")->name= "end";
SYM_PTR("free")->name= "is_free";
SYM_PTR("int")->name= "i";
SYM_PTR("remainder")->name= "rem";
SYM_PTR("register")->name= "internal_register";
/*:120*/
#line 555 "web2w.w"

/*:4*/
#line 518 "web2w.w"

/*92:*/
#line 2000 "web2w.w"

program= first_token->link;
pp_push(program->link,program->next,0,NULL);
ppparse();
/*:92*/
#line 519 "web2w.w"

/*100:*/
#line 2119 "web2w.w"

wprint_to(first_token,last_token);
/*:100*//*126:*/
#line 2574 "web2w.w"

wputs("\n@ Appendix: Replacement of the string pool file.\n");
{token*str_k;
int i,k;
/*127:*/
#line 2589 "web2w.w"

wputs("@d str_0_255 ");
for(k= 0;k<256;k++)
{if((k&0xF)==0)wputs("\t\"");
if((/*128:*/
#line 2626 "web2w.w"

(k<' ')||(k> '~')
/*:128*/
#line 2593 "web2w.w"
))
{wputs("^^");
if(k<0100&&k+0100=='@')wputs("@@");
else if(k<0100&&k+0100=='\\')wputs("\\\\");
else if(k<0100)wput(k+0100);
else if(k<0200&&k-0100=='@')wputs("@@");
else if(k<0200)wput(k-0100);
#define HEXDIGIT(x) ((x)<10?((x)+'0'):((x)-10+'a'))
else wput(HEXDIGIT(k/16)),wput(HEXDIGIT(k%16));
}
else if(k=='"')wputs("\\\"");
else if(k=='\\')wputs("\\\\");
else if(k=='@')wputs("@@");
else wput(k);
if((k&0xF)==0xF)wputs("\"@/\n");
}
wputs("@d str_start_0_255");
i= 0;
for(k= 0;k<256;k++)
{if((k&0xF)==0)wput('\t');
wputi(i);
if((/*128:*/
#line 2626 "web2w.w"

(k<' ')||(k> '~')
/*:128*/
#line 2614 "web2w.w"
))
{if(k<0100)i= i+3;
else if(k<0200)i= i+3;
else i= i+4;
}
else i= i+1;
wput(',');
if((k&0xF)==0xF)wputs("@/\n");
}
/*:127*/
#line 2578 "web2w.w"

for(str_k= first_string;str_k!=NULL;str_k= str_k->link)
/*129:*/
#line 2631 "web2w.w"

{symbol*s= SYM(str_k);
if(s->value> 0)
{s->value= 0;
wputs("@ \n");
wputs("@d str_"),wputi(k),wput(' '),wputs(s->name),wput('\n');
/*137:*/
#line 2791 "web2w.w"

if(str_k->sym_no==empty_string_no)wputs("@d empty_string "),wputi(k);
else if(str_k->sym_no==TeXinputs_no)wputs("@d TEX_area "),wputi(k);
else if(str_k->sym_no==TeXfonts_no)wputs("@d TEX_font_area "),wputi(k);
else if(str_k->sym_no==fmt_no)wputs("@d format_extension "),wputi(k);
else if(str_k->sym_no==math_spacing_no)wputs("@d math_spacing "),wputi(k);
/*:137*/
#line 2637 "web2w.w"

else
wputs("@<|"),wputs(s->name),wputs("|@>=@+"),wputi(k);
wput('\n');
k++;
}
}
/*:129*/
#line 2580 "web2w.w"

/*140:*/
#line 2818 "web2w.w"

wputs("\n@ All the above strings together make up the string pool.\n"
"@<|str_pool| initialization@>=\n"
"str_0_255\n");
for(i= 256;i<k;i++)
{wputs("str_"),wputi(i);
if((i&7)==7)wputs("@/\n");else wput(' ');
}
wputs("\n\n@ @<|str_start| initialization@>=\n"
"str_start_0_255\n");
for(i= 256;i<k;i++)
{wputs("str_start_"),wputi(i),wput(',');
if((i&3)==3)wput('\n');else wput(' ');
}
wputs("str_start_"),wputi(k);
wputs("\n\n"
"@ We still need to define the start locations of the strings.\n"
"@<prepare for string pool initialization@>=\n"
"typedef enum {\n"
"str_start_256=sizeof(str_0_255)-1,\n");
for(i= 257;i<=k;i++)
wputs("str_start_"),wputi(i),wputs("=str_start_"),wputi(i-1),
wputs("+sizeof(str_"),wputi(i-1),wputs(")-1,@/\n");

wputs("str_start_end } str_starts;\n"
"\n@ @<|pool_ptr| initialization@>= str_start_"),wputi(k),wputs("\n"
"\n@ @<|str_ptr| initialization@>= "),wputi(k),wput('\n');
/*:140*/
#line 2581 "web2w.w"

}
/*:126*/
#line 520 "web2w.w"

/*12:*/
#line 701 "web2w.w"

DBG(dbgbasic,"free tokens = %d\n",free_tokens);
/*:12*//*30:*/
#line 867 "web2w.w"

DBG(dbgbasic,"free strings = %d\n",free_strings);
/*:30*//*35:*/
#line 944 "web2w.w"

DBG(dbgbasic,"free symbols = %d\n",free_symbols);
/*:35*//*56:*/
#line 1279 "web2w.w"

DBG(dbgbasic,"free modules = %d\n",free_modules);
/*:56*/
#line 521 "web2w.w"

return 0;
}
/*:1*/
