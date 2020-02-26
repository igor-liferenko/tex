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
void calledit(packed_ASCII_code *filename, int fnlength, int linenumber)
{
        char *temp;
        char *command;
        char c;
        int sdone;
        int ddone;
        int i;

        char dvalue[] = "emacs +%d %s";
        char *texeditvalue = dvalue;
        sdone = ddone = 0;

        if(NULL != (temp = getenv("TEXEDIT")))
                texeditvalue = temp;

        if (NULL == (command = (char*)malloc(strlen(texeditvalue) + fnlength + 25))) {
                fwprintf(stderr, L"! Not enough memory to issue editor command\n");
                exit(1);
        }
        temp = command;
        while ((c = *texeditvalue++) != 0) {
                if (c == '%') {
                        switch (c = *texeditvalue++) {
                                case 'd':
                                        if(ddone) {
                                                fwprintf(stderr, L"! Line number cannot appear twice in editor command\n");
                                                exit(1);
                                        }
                                        sprintf(temp, "%d", linenumber);
                                        while (*temp != 0)
                                                temp++;
                                        ddone = 1;
                                        break;
                                case 's':
                                        if (sdone) {
                                                fwprintf(stderr, L"! Filename cannot appear twice in editor command\n");
                                                exit(1);
                                        }
                                        i = 0;
                                        while (i < fnlength)
                                                *temp++ = filename[i++];
                                        sdone = 1;
                                        break;
                                case 0:
                                        *temp++ = '%';
                                        texeditvalue--; // Back up to \0 to force termination
                                        break;
                                default:
                                        *temp++ = '%';
                                        *temp++ = c;
                                        break;
                        }
                }
                else
                        *temp++ = c;
        }
        *temp = 0;

        if (0 != system(command))
                fwprintf(stderr, L"! Trouble executing command %s\n", command);

        exit(1);
}
void close_files_and_terminate(void)
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
  if (ed_name_start != 0 && interaction > batch_mode)
    calledit(&str_pool[ed_name_start], ed_name_length, edit_line);
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
