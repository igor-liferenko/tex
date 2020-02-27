@x
@<Global variables@>@;
@y
@<Global variables@>@;
pool_pointer ed_name_start = 0;
int ed_name_length, edit_line;
@z

TODO: ensure that Oops! cannot happen and remove this change
@x
@<Set initial values of key variables@>@;
@y
@<Set initial values of key variables@>@;
if (ed_name_start != 0) fwprintf(stderr, L"Oops!\n"), exit(1);
@z

@x
{@+ close_files_and_terminate(); exit(0);
@y
{
  close_files_and_terminate();
  if (ed_name_start != 0 && interaction > batch_mode) {
    char cmd[500];
    if (snprintf(cmd, sizeof cmd, "em %.*s %d", ed_name_length, str_pool+ed_name_start,
                 edit_line) >= sizeof cmd)
      fwprintf(stderr, L"Buffer is too small\n"), exit(1);
    if (0 != system(cmd))
      fwprintf(stderr, L"! Trouble executing command %s\n", cmd);
    exit(1);
  }
  exit(0);
@z

@x
case 'E': if (base_ptr > 0)
  {@+print_nl("You want to edit file ");
@.You want to edit file x@>
  slow_print(input_stack[base_ptr].name_field);
  print_str(" at line ");print_int(line);
  interaction=scroll_mode;jump_out();
  } @+break;
@y
case 'E':
  if (base_ptr > 0) {
    ed_name_start = str_start[input_stack[base_ptr].name_field];
    ed_name_length = str_start[input_stack[base_ptr].name_field+1] - ed_name_start;
    edit_line = line;
    jump_out();
  }
  break;
@z

TODO: find out if OOPS can happen and remove this if no, and if yes, call editor inside
close_files_and_terminate() instead (@x-@y part will intersect with newline.ch)
@x
close_files_and_terminate();
@y
close_files_and_terminate();
if (ed_name_start != 0) fwprintf(stderr, L"OOPS!\n"), exit(1);
@z
