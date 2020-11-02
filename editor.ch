@x
@<Global variables@>@;
@y
@<Global variables@>@;
pool_pointer ed_name_start, ed_name_end;
int edit_line;
@z

@x
{@+ close_files_and_terminate(); wterm_cr; exit(1);
@y
{ close_files_and_terminate();
  if (edit_line) {
    char ed_name[file_name_size+1];
    int k = 0;
    for (pool_pointer j=ed_name_start; j<=ed_name_end; j++)
      k += wctomb(ed_name+k, xchr[str_pool[j]]);
    ed_name[k] = '\0';

    char cmd[500];
    if (snprintf(cmd, sizeof cmd, "em %s %d", ed_name, edit_line) < sizeof cmd) system(cmd);
  }
  wterm_cr; exit(1);
@z

@x
  {@+print_nl("You want to edit file ");
@.You want to edit file x@>
  slow_print(input_stack[base_ptr].name_field);
  print_str(" at line ");print_int(line);
@y
{ ed_name_start = str_start[input_stack[base_ptr].name_field];
  ed_name_end = str_start[input_stack[base_ptr].name_field+1] - 1;
  edit_line = line;
@z
