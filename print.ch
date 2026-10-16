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

===== Add "TeXinputs/" to string pool: =====

@x
@<|"output file name"|@>= 1300
@y
@<|"output file name"|@>= 1300
@ @d str_1301 "TeXinputs/"
@d TEX_area_short 1301
@z

@x
str_1296 str_1297 str_1298 str_1299 str_1300
@y
str_1296 str_1297 str_1298 str_1299 str_1300 str_1301
@z

@x
str_start_1300, str_start_1301
@y
str_start_1300, str_start_1301, str_start_1302
@z

@x
str_start_1301=str_start_1300+sizeof(str_1300)-1,@/
@y
str_start_1301=str_start_1300+sizeof(str_1300)-1,@/
str_start_1302=str_start_1301+sizeof(str_1301)-1,
@z

@x
@ @<|pool_ptr| initialization@>= str_start_1301
@y
@ @<|pool_ptr| initialization@>= str_start_1302
@z

@x
@ @<|str_ptr| initialization@>= 1301
@y
@ @<|str_ptr| initialization@>= 1302
@z
