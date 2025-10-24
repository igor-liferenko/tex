Print "TeXinputs/" instead of "/path/to/TeXinputs/" to log file and terminal.

@x
if (term_offset+length(name) > max_print_line-2) print_ln();
else if ((term_offset > 0)||(file_offset > 0)) print_char(' ');
print_char('(');incr(open_parens);slow_print(name);update_terminal;
@y
if (length(name) >= length(TEX_area) &&
    strncmp(str_pool+str_start[name], str_pool+str_start[TEX_area], length(TEX_area)) == 0) {
  assert(str_ptr < max_strings);
  str_start[++str_ptr] = str_start[name+1]; /* fake string ends where |name| ends */
  str_start[str_ptr-1] = str_start[name] + length(TEX_area) - strlen("TeXinputs/"); /* fake string
    begins where TeXinputs/ begins in |name| */
  if (term_offset+length(str_ptr-1) > max_print_line-2) print_ln();
  else if ((term_offset > 0)||(file_offset > 0)) print_char(' ');
  print_char('(');incr(open_parens);slow_print(str_ptr-1);update_terminal;
  str_start[--str_ptr] = pool_ptr; /* restore */
}
else {
  if (term_offset+length(name) > max_print_line-2) print_ln();
  else if ((term_offset > 0)||(file_offset > 0)) print_char(' ');
  print_char('(');incr(open_parens);slow_print(name);update_terminal;
}
@z
