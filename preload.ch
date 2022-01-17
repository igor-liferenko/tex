Format name is taken from 0th argument (symlink to virtex).

NOTE: it is assumed that argv[0] contains an absolute path

@x
initialize(); /*set global variables to their starting values*/ 
@y
initialize(); /*set global variables to their starting values*/ 
#ifndef INIT
wcstombs(name_of_file+1, TEX_format_default+1, file_name_size+1);
strcpy(strrchr(name_of_file+1, '/'), strrchr(argv[0], '/'));
strcat(name_of_file+1, ".fmt");
assert(w_open_in(&fmt_file));
term_out.f=fopen("/dev/null","w"); assert(load_fmt_file()); fclose(term_out.f); term_out.f=stdout;
w_close(&fmt_file);
#endif
@z
