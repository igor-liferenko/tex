We use existing variable to avoid creating new global variable.
If the following is not the only error message that can appear if load_fmt_file() fails,
add new one(s) here, and if such code is called also not from load_fmt_file(),
ensure that it happens after ready_already=314159 - otherwise you will need
separate global variable suppress_error and set it to 1 before calling
load_fmt_file() here and to 0 afterwards.
@x
  wterm_ln("(Fatal format file error; I'm stymied)");
@y
  if (ready_already==314159) wterm_ln("(Fatal format file error; I'm stymied)");
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
assert(load_fmt_file());
w_close(&fmt_file);
#endif
@z
