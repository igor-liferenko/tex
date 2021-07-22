@x
@<Global variables@>@;
@y
@<Global variables@>@;
int suppress_error = 0;
@z

@x
  wterm_ln("(Fatal format file error; I'm stymied)");
@y
  if (!suppress_error) wterm_ln("(Fatal format file error; I'm stymied)");
@z

@x
@p int main(int argc, char **argv) {
@y
@p int main(int argc, char **argv) {
#ifndef INIT
assert(*argv[0] == '/');
#endif
@z

@x
initialize(); /*set global variables to their starting values*/ 
@y
initialize(); /*set global variables to their starting values*/ 
#ifndef INIT
wcstombs(name_of_file+1, TEX_format_default+1, file_name_size+1);
strcpy(strrchr(name_of_file+1, '/'), strrchr(argv[0], '/'));
strcat(name_of_file+1, ".fmt");
assert(w_open_in(&fmt_file));
suppress_error = 1; assert(load_fmt_file()); suppress_error = 0;
w_close(&fmt_file);
#endif
@z
