@x
@h
@y
@h
#define str_(x) str_ ## x
#define str(x) str_(x)
@z

Display "TeXinputs/" instead of full path to it in log files and on terminal.
@x
print_char('(');incr(open_parens);slow_print(name);update_terminal;
@y
print_char('(');incr(open_parens);
if (str_start[name+1]-str_start[name] > strlen(str(TEX_area)) &&
    strncmp(str_pool+str_start[name], str(TEX_area), strlen(str(TEX_area))) == 0) {
  pool_pointer j; /*current character code position*/ 
  j=str_start[name]+strlen(str(TEX_area));
  while (j < str_start[name+1]) {
    print(str_pool[j]); j++;
  }
}
else slow_print(name);
update_terminal;
@z
