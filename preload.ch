ready_already trick does not work on modern systems, so load format file on each run.
Format name is passed via environment variable 'format'.

load_fmt_file() has its own error message ("(Fatal format file error; I'm stymied)"),
but we use assert() which prints its own error message,
so error message would be printed two times. To avoid this, error message during format loading
at startup is suppressed (besides, the error message could not appear on the system where TeX
was written, i.e., where ready_already trick was used).

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
