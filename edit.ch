In tex.web in jump_out() `goto' is used.
But in C non-local goto statements don't exist, so jump_out() is different in tex.w
(read doc-part of section where jump_out() is defined) - `goto'
is replaced by close_files_and_terminate() and `exit'. Here we do similar - replace
call to jump_out() with close_files_and_terminate() and `exit'.
And we put required code after close_files_and_terminate().

@x
  {@+print_nl("You want to edit file ");
@.You want to edit file x@>
  slow_print(input_stack[base_ptr].name_field);
  print_str(" at line ");print_int(line);
  interaction=scroll_mode;jump_out();
@y
  { close_files_and_terminate();

  if (interaction > batch_mode) {
    char ed_name[file_name_size+1];
      /* because this file was opened, it is guaranteed to fit into |file_name_size| */
    int k = 0;
    for (pool_pointer j=str_start[input_stack[base_ptr].name_field];
         j<str_start[input_stack[base_ptr].name_field+1]; j++) {
      char mb[MB_CUR_MAX];
      int len = wctomb(mb, xchr[str_pool[j]]);
      for (int i = 0; i < len; i++) {
        k++;
        ed_name[k-1] = mb[i];
      }
    }
    ed_name[k] = '\0';
    char cmd[500];
    int r;
    if (strstr(ed_name, "TeXinputs/") == ed_name)
      r = snprintf(cmd, sizeof cmd, "em %s%s %d", str(TEX_area), ed_name+strlen("TeXinputs/"), line);
        /* restore what was changed in out.ch */
    else
      r = snprintf(cmd, sizeof cmd, "em %s %d", ed_name, line);
    if (r >= sizeof cmd) {
      fwprintf(stderr, L"Buffer is too small\n");
      history = error_message_issued;
    }
    else if (system(cmd) != 0) {
      fwprintf(stderr, L"Trouble executing command `%s'\n", cmd);
      history = error_message_issued;
    }
  }

  exit(0);
@z
