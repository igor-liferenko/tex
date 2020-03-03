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
    close_files_and_terminate();
    if (interaction > batch_mode) { /* FIXME: why we check |interaction|?
             and why |interaction=scroll_mode;| is used above? */
      char ed_name[500];
      int k = 0;
      for (pool_pointer j=str_start[input_stack[base_ptr].name_field];
           j<str_start[input_stack[base_ptr].name_field+1]; j++) {
        char mb[MB_CUR_MAX];
        int len = wctomb(mb, xchr[so(str_pool[j])]); // FIXME: is |so| needed?
        for (int i = 0; i < len; i++) {
          incr(k);
          if (k < sizeof ed_name) ed_name[k-1] = mb[i];
          else if (k - i < sizeof ed_name)
            for (int x = k - i; x < sizeof ed_name; x++)
              ed_name[x-1] = '\0';
        }
      }
      if (k < sizeof ed_name) ed_name[k] = '\0';
      else ed_name[sizeof ed_name-1] = '\0';
      char cmd[500];
      if (snprintf(cmd, sizeof cmd,
           (strcmp("TeXinputs/", ed_name) == 0 ? "em /home/user/ctex/%s %d" : "em %s %d"),
           ed_name, line) >= sizeof cmd)
        fwprintf(stderr, L"Buffer is too small\n"), exit(1);
      if (system(cmd) != 0) fwprintf(stderr, L"! Trouble executing command %s\n", cmd);
    }
    exit(0);
  }
  break;
@z
