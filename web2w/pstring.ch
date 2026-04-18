Do not exclude any "-strings from pool (print_str is not used anymore).
There are also pstring changes in the patch of pascal.y

@x
    { wputs("@@[@@<|");@+wputs(SYM(t)->name);@+wputs("|@@>@@]");@+ }
@y
    { wputs("@@<|");@+wputs(SYM(t)->name);@+wputs("|@@>");@+ }
@z

@x
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
@y
@z

@x
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
@y
@z

@x
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
@y
@z

@x
Note: |max_reg_help_line| is used in $\epsilon$-\TeX\index{e-TeX+$\epsilon$-\TeX}.

I have used these variables:
@<global variables@>=
int print_no, print_str_no, overflow_no, print_err_no,
print_nl_no, fatal_error_no, prompt_file_name_no,
help_line_no, empty_string_no, max_reg_help_line_no;
@y
@z

@x
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
@y
@z

@x
int TeXinputs_no, TeXfonts_no, fmt_no, math_spacing_no;
@
@<initialize token list@>=
@y
int TeXinputs_no, TeXfonts_no, fmt_no, math_spacing_no, empty_string_no;
@
@<initialize token list@>=
empty_string_no=predefine("\"\"",PID,1);
@z
