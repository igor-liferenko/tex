@x
if (ready_already==314159) goto start_of_TEX;
@y
@z

NOTE: if using gdb, input format explicitly via &
@x
ready_already=314159;
@y
if (strstr(argv[0], "initex") == NULL && strstr(argv[0], "triptex") == NULL && strstr(argv[0], "virtex") == NULL) {
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

@x
ready_already=0;
@y
@z
