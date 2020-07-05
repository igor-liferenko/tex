NOTE: this code was taken verbatim from @<Get the first line...@> (except that open_fmt_file is replaced with w_open_in)
@x
initialize(); /*set global variables to their starting values*/ 
@y
initialize(); /*set global variables to their starting values*/ 
#ifndef INIT
strcpy(name_of_file+1, "/home/user/tex/TeXformats/");
strcat(name_of_file+1, strrchr(argv[0], '/') + 1);
strcat(name_of_file+1, ".fmt");
if (!w_open_in(&fmt_file)) exit(0);
if (!load_fmt_file()) {
  w_close(&fmt_file);
  exit(0);
} 
w_close(&fmt_file);
#endif
@z
