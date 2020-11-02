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
if (strstr(name_of_file+1, str(TEX_area))) {
/* FIXME: can this check from slow_print be true here?  if ((s >= str_ptr)||(s < 256)) print(s); */
  for (int k = strstr(str(TEX_area), "TeXinputs/") - str(TEX_area) + 1; k <= name_length; k++) {
    wchar_t wc;
    k += mbtowc(&wc, name_of_file+k, MB_CUR_MAX) - 1;
    print(xord[wc]);
  }
}
else slow_print(name);
update_terminal;
@z
