@x
line ready to be edited. But such an extension requires some system
wizardry, so the present implementation simply types out the name of the
file that should be
edited and the relevant line number.
@^system dependencies@>

There is a secret `\.D' option available when the debugging routines haven't
been commented~out.
@^debugging@>
@y
line ready to be edited.
We do this by calling the external procedure |calledit| with a pointer to
the filename, its length, and the line number.
However, here we just set up the variables that will be used as arguments,
since we don't want to do the switch-to-editor until after \TeX\ has closed
its files.
@^system dependencies@>

There is a secret `\.D' option available when the debugging routines haven't
been commented~out.
@^debugging@>
@d edit_file input_stack[base_ptr]
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
case 'E': if (base_ptr > 0) {
  ed_name_start = str_start[edit_file.name_field];
  ed_name_length = str_start[edit_file.name_field+1] - str_start[edit_file.name_field];
  edit_line = line;
  jump_out();
  } @+break;
@z

@x
void close_files_and_terminate(void)
@y
void close_files_and_terminate(void)
@z

@x
} 
@y
  if (ed_name_start != 0 && interaction > batch_mode) {
    char cmd[500];
    if (snprintf(cmd, sizeof cmd, "em %.*s %d", ed_name_length, &str_pool[ed_name_start], edit_line) >= sizeof cmd)
      fwprintf(stderr, L"Buffer is too small\n"), exit(EXIT_FAILURE);

    if (0 != system(cmd))
      fwprintf(stderr, L"! Trouble executing command %s\n", cmd);

    exit(1); /* the fact that prompt where you typed "e" appeared means that
                TeX stopped on an error */
  }
}
@z

@x
@* System-dependent changes.
This section should be replaced, if necessary, by any special
modifications of the program
that are necessary to make \TeX\ work at a particular installation.
It is usually best to design your change file so that all changes to
previous sections preserve the section numbering; then everybody's version
will be consistent with the published program. More extensive changes,
which introduce new sections, can be inserted here; then only the index
itself will get a new section number.
@^system dependencies@>
@y
@* System-dependent changes.
Here are the variables that holds ``switch-to-editor'' information.
@^system dependencies@>

@<Global...@>=
pool_pointer ed_name_start;
int ed_name_length, edit_line;

@ The |ed_name_start| will be set to point into |str_pool| somewhere after
its beginning if \TeX\ is supposed to switch to an editor on exit.

@<Set init...@>=
ed_name_start = 0;
    
@z
