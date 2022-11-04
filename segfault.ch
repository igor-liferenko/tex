This is needed for TeX if you get `Segmentation fault'.

It can happen with some C library versions for wide character
streams when input files are not closed before program terminates.

\openin files must be closed manually.
If segfault occurs, do as follows to find out which files are still open:

in exit.ch change

    final_end: if (history <= warning_issued) return 0; else return 1; }

into

    final_end: pause(); if (history <= warning_issued) return 0; else return 1; }

and do

    ls -l /proc/<pid>/fd

@x
    exit(134);
  }
@y
  }
  for (int is_ptr = 0; is_ptr <= input_ptr; is_ptr++)
    if (input_stack[is_ptr].name_field > 17) { /* section 303 */
      if (input_stack[is_ptr].index_field > in_open) break; /* section 304 */
      fclose(input_file[input_stack[is_ptr].index_field].f);
    }
  if (want_edit) exit(134);
@z
