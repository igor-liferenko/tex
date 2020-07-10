NOTE: this code was taken verbatim from @<Get the first line...@> (except that open_fmt_file is replaced with w_open_in)
@x
initialize(); /*set global variables to their starting values*/ 
@y
initialize(); /*set global variables to their starting values*/ 
#ifndef INIT
const wchar_t *TEX_format_default0 = TEX_format_default + 1;
wcsnrtombs(name_of_file+1, &TEX_format_default0, format_area_length, file_name_size, NULL);
strncat(name_of_file+1, strrchr(argv[0], '/') + 1, file_name_size - strlen(name_of_file+1));
strncat(name_of_file+1, ".fmt", file_name_size - strlen(name_of_file+1));
if (!w_open_in(&fmt_file)) exit(0);
if (!load_fmt_file()) {
  w_close(&fmt_file);
  exit(0);
} 
w_close(&fmt_file);
#endif
@z
