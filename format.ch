@x
ready_already=314159;
@y NOTE: for simplicity we assume initex.fmt and triptex.fmt never exist
strncpy(name_of_file+1, TEX_format_default+1, format_area_length);
strcat(name_of_file+1, strrchr(argv[0], '/') == NULL ? argv[0] : strrchr(argv[0], '/') + 1);
strcat(name_of_file+1, ".fmt");
if (w_open_in(&fmt_file)) if (!load_fmt_file()) return 1;
@z

TODO: google "global variable in C/pascal" - it seems in pascal nothing is done to global var
on startup; ensure that in C it is set to zero automatically

TODO: check size of name_of_file like in pack_buffered_name() and pack_file_name()
