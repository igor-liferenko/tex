This is needed for TeX if you get `Segmentation fault'.

It can happen with some C library versions for wide character
streams when input files are not closed before program terminates.

\openin files must be closed manually with \closein.

To see which files are still open, uncomment the change below.

@x
{@+ close_files_and_terminate(); exit(1);
@y
{@+ close_files_and_terminate();
  for (int is_ptr = 0; is_ptr <= input_ptr; is_ptr++)
    if (input_stack[is_ptr].name_field > 17) { /* section 303 */
      if (input_stack[is_ptr].index_field > in_open) break; /* section 304 */
      fclose(input_file[input_stack[is_ptr].index_field].f);
    }
  exit(1);
@z

 @x
final_end: if (history <= warning_issued) return 0; else return 1; }
 @y
final_end: system("ls -l /proc/$PPID/fd");
if (history <= warning_issued) return 0; else return 1; }
 @z
