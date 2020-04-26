NOTE: remove this later
@x
if (ready_already==314159) goto start_of_TEX;
@y
if (ready_already!=0) { fwprintf(stderr, L"error: this can not be"); exit(0); }
@z

@x
ready_already=314159;
@y NOTE: for simplicity we assume initex.fmt and triptex.fmt never exist, and if format does not exist program behaves as without this change-file
strncpy(name_of_file+1, TEX_format_default+1, format_area_length);
strcat(name_of_file+1, strrchr(argv[0], '/') == NULL ? argv[0] : strrchr(argv[0], '/') + 1);
strcat(name_of_file+1, ".fmt");
if (w_open_in(&fmt_file)) {
  if (!load_fmt_file()) {
    w_close(&fmt_file);
    exit(0);
  } 
  w_close(&fmt_file);
}
@z above code was taken verbatim from @<Get the first line...@>, with w_open_in() instead of open_fmt_file()

TODO: check size of name_of_file like in pack_buffered_name() and pack_file_name()
