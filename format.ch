@x
@p int main(int argc, char **argv) {
@y
@p int main(int argc, char **argv) {
#ifndef INIT
assert(*argv[0] == '/');
#endif
@z

NOTE: this code was taken verbatim from @<Get the first line...@> (except that open_fmt_file is replaced with w_open_in)
@x
initialize(); /*set global variables to their starting values*/ 
@y
initialize(); /*set global variables to their starting values*/ 
#ifndef INIT
wcstombs(name_of_file+1, TEX_format_default+1, file_name_size+1);
strcpy(strrchr(name_of_file+1, '/'), strrchr(argv[0], '/'));
strcat(name_of_file+1, ".fmt");
assert(w_open_in(&fmt_file));
if (!load_fmt_file()) {
  w_close(&fmt_file);
  exit(0);
} 
w_close(&fmt_file);
#endif
@z
