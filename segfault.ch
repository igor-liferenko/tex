This is needed for TeX if you get `Segmentation fault'.

It can happen with some C library versions for wide character
streams when input files are not closed before program terminates.

FIXME: if segfault persists, try to close any opened \openin files
(name_field 1..16) and stdin

@x
    exit(134);
  }
@y
  }
  for (int is_ptr = 0; is_ptr <= input_ptr; is_ptr++)
    if (input_stack[is_ptr].name_field > 17) { /* §303 */
      fclose(input_file[input_stack[is_ptr].index_field].f);
      if (input_stack[is_ptr].index_field == in_open) break; /* §304 */
    }
  if (want_edit) exit(134);
@z
