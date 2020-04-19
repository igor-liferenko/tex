@x
@h
@y
@h
#define progname strrchr(argv[0], '/') == NULL ? argv[0] : strrchr(argv[0], '/') + 1
@z

@x
if (ready_already==314159) goto start_of_TEX;
@y
@z

@x
ready_already=314159;
@y
if (strcmp(progname, "initex") != 0 && strcmp(progname, "triptex") != 0) {
  strncpy(name_of_file+1, TEX_format_default+1, format_area_length);
  strcat(strcat(name_of_file+1, progname), ".fmt");
  if (!w_open_in(&fmt_file)) {
    write(term_out, L"I can't find the format file!");
    exit(0);
  }
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
