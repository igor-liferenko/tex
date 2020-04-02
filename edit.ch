NOTE: for deeper understanding, see https://tex.stackexchange.com/questions/536084/

@x
@<Global variables@>@;
@y
@<Global variables@>@;
pool_pointer ed_name_start = 0, ed_name_end;
int edit_line;
@z

@x
case 'E': if (base_ptr > 0) 
  {@+print_nl("You want to edit file ");
@.You want to edit file x@>
  slow_print(input_stack[base_ptr].name_field);
  print_str(" at line ");print_int(line);
  interaction=scroll_mode;jump_out();
@y
case 'E': if (base_ptr > 0) {
  ed_name_start = str_start[input_stack[base_ptr].name_field];
  ed_name_end = str_start[input_stack[base_ptr].name_field+1] - 1;
  edit_line = line;
  jump_out();
@z

@x
    slow_print(log_name);print_char('.');
    }
  }
  print_ln();
@y
    slow_print(log_name);print_char('.');
    }
  }
  print_ln();

  if (ed_name_start && interaction > batch_mode) {
    char ed_name[file_name_size+1];
      /* because this file was opened, it is guaranteed to fit into |file_name_size| */
    int k = 0;
    for (pool_pointer j=ed_name_start; j<=ed_name_end; j++) {
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
        /* restore what was changed in output.ch */
    else
      r = snprintf(cmd, sizeof cmd, "em %s %d", ed_name, edit_line);
    if (r < sizeof cmd) system(cmd);
  }
@z
