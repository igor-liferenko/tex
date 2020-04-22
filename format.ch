@x
if (ready_already==314159) goto start_of_TEX;
@y
@z

@x
ready_already=314159;
@y NOTE: for simplicity we assume initex.fmt and triptex.fmt never exist
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
@z

@x
ready_already=0;
@y
@z
