Print "TeXinputs/" instead of "/path/to/TeXinputs/" to log file and terminal.

If |name| starts with "/path/to/TeXinputs/", we create a virtual string
(pointing its beginning to the place in |str_pool|, where "TeXinputs/"
starts, and its ending to the place in |str_pool|, where |name| ends).
This virtual string is then printed instead of |name|, and deleted.

NOTE: an alternative would be to change |name| in |a_make_name_string|,
      but it must not be done because |name| is used in edit.ch

@x
if (term_offset+length(name) > max_print_line-2) print_ln();
else if ((term_offset > 0)||(file_offset > 0)) print_char(' ');
print_char('(');incr(open_parens);slow_print(name);update_terminal;
@y
str_number _ = name;
if (length(name) >= length(TEX_area) &&
    strncmp(str_pool+str_start[name], str_pool+str_start[TEX_area], length(TEX_area)) == 0) {
  _ = make_string();
  str_start[_+1] = str_start[name+1];
  str_start[_] = str_start[name] + length(TEX_area) - strlen("TeXinputs/");
}
if (term_offset+length(_) > max_print_line-2) print_ln();
else if ((term_offset > 0)||(file_offset > 0)) print_char(' ');
print_char('(');incr(open_parens);slow_print(_);update_terminal;
if (_ != name) str_start[--str_ptr] = pool_ptr;
@z
