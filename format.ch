@x
@h
@y
@h
#define exit do { if (history <= warning_issued) exit(0); else exit(1); } while
@z

@x
ready_already=314159;
@y
if (strcmp(argv[0], "./initex") != 0 && strcmp(argv[0], "./triptex") != 0) {
  strcat(strcpy(name_of_file+1, argv[0]), ".fmt");
  if (w_open_in(&fmt_file)) goto found;
  strncpy(name_of_file+1, TEX_format_default+1, format_area_length);
  strcat(strcat(name_of_file+1, argv[0]), ".fmt");
  if (w_open_in(&fmt_file)) {
found:
    if (!load_fmt_file()) {
      w_close(&fmt_file);
      exit(0);
    }
    w_close(&fmt_file);
  }
}
@z
