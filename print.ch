Print "TeXinputs/" instead of "/path/to/TeXinputs/" to log file and terminal.

@x
@p void start_input(void) /*\TeX\ will \.{\\input} something*/
{@+
@y
@p void start_input(void) /*\TeX\ will \.{\\input} something*/
{@+
bool use_area = false;
@z

@x
    if (a_open_in(&cur_file)) goto done;
@y
    if (a_open_in(&cur_file)) { use_area = true; goto done; }
@z

@x
done: name=a_make_name_string(&cur_file);
@y
done: name=a_make_name_string(&cur_file);
if (use_area) pack_file_name(cur_name, TEX_area_short, cur_ext);
str_number printed_name=a_make_name_string(&cur_file);
@z

@x
if (term_offset+length(name) > max_print_line-2) print_ln();
else if ((term_offset > 0)||(file_offset > 0)) print_char(' ');
print_char('(');incr(open_parens);slow_print(name);update_terminal;
@y
if (term_offset+length(printed_name) > max_print_line-2) print_ln();
else if ((term_offset > 0)||(file_offset > 0)) print_char(' ');
print_char('(');incr(open_parens);slow_print(printed_name);update_terminal;
@z
