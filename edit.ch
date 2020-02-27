@x
@<Global variables@>@;
@y
@<Global variables@>@;
pool_pointer ed_name_start = 0;
pool_pointer ed_name_end;
int edit_line;
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
    int ed_name_size = 500;
    char ed_name0[ed_name_size+1];
    char *const ed_name = ed_name0-1;
    int k = 0;
    int mb_stop = -1;
    for (pool_pointer j=ed_name_start; j<=ed_name_end; j++) {
      char mb[MB_CUR_MAX];
      int len = wctomb(mb, xchr[str_pool[j]]);
      for (int i = 0; i < len; i++) {
        incr(k);
        if (k <= ed_name_size) ed_name[k] = mb[i];
        else if (mb_stop == -1) mb_stop = k - (i + 1);
      }
    }
    if (k <= ed_name_size) ed_name[k+1] = '\0';
    else ed_name[mb_stop+1] = '\0';
    char cmd[500];
    int r;
    if (strcmp("TeXinputs/", ed_name+1) == 0)
      r = snprintf(cmd, sizeof cmd, "em /home/user/ctex/%s %d", ed_name+1, edit_line);
    else
      r = snprintf(cmd, sizeof cmd, "em %s %d", ed_name+1, edit_line);
    if (r >= sizeof cmd) fwprintf(stderr, L"Buffer is too small\n"), exit(1);
    if (system(cmd) != 0) fwprintf(stderr, L"! Trouble executing command %s\n", cmd);
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
    ed_name_end = str_start[input_stack[base_ptr].name_field+1] - 1;
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
