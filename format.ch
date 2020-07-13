NOTE: this code was taken verbatim from @<Get the first line...@> (except that open_fmt_file is replaced with w_open_in)
@x
initialize(); /*set global variables to their starting values*/ 
@y
initialize(); /*set global variables to their starting values*/ 
#ifndef INIT
for (int i = 1, k = 0; i <= format_area_length; i++) append_to_name(xord[TEX_format_default[i]]);
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
