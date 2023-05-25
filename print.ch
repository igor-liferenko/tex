Print "TeXinputs/" instead of "/path/to/TeXinputs/" to log file and terminal.

@x
if (term_offset+length(name) > max_print_line-2) print_ln();
else if ((term_offset > 0)||(file_offset > 0)) print_char(' ');
print_char('(');incr(open_parens);slow_print(name);update_terminal;
@y
str_number tmp;
if (length(name) >= length(TEX_area) &&
    strncmp(str_pool+str_start[name], str_pool+str_start[TEX_area], length(TEX_area)) == 0) {
  pool_pointer k = str_start[name];
  k = k + length(TEX_area) - 1;
  while (so(str_pool[k-1]) != '/') k--;
  while (k < str_start[name+1]) str_pool[pool_ptr++] = str_pool[k++];
  tmp = make_string();
}
else tmp = name;
if (term_offset+length(tmp) > max_print_line-2) print_ln();
else if ((term_offset > 0)||(file_offset > 0)) print_char(' ');
print_char('(');incr(open_parens);slow_print(tmp);update_terminal;
if (tmp != name) flush_string;
@z
