Format name is taken from environment variable.

@x
initialize(); /*set global variables to their starting values*/ 
@y
initialize(); /*set global variables to their starting values*/ 
#ifndef INIT
if (getenv("format")) {
  wcstombs(name_of_file+1, TEX_format_default+1, file_name_size+1);
  strcpy(strrchr(name_of_file+1, '/') + 1, getenv("format"));
  strcat(name_of_file+1, ".fmt");
  assert(w_open_in(&fmt_file));
  term_out.f=fopen("/dev/null","w"); assert(load_fmt_file()); fclose(term_out.f); term_out.f=stdout;
  w_close(&fmt_file);
}
#endif
@z
