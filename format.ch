@x
if (ready_already==314159) goto start_of_TEX;
@y
@z

NOTE: run gdb as `gdb plain' and `gdb тех'
@x
ready_already=314159;
@y
if (strstr(argv[0], "initex") == NULL && strstr(argv[0], "triptex") == NULL && strstr(argv[0], "virtex") == NULL) {
  strcat(strcpy(name_of_file+1, strrchr(argv[0], '/') == NULL ? argv[0] : strrchr(argv[0], '/') + 1), ".fmt"); /* first try in current directory */
  if (w_open_in(&fmt_file)) goto found;
  strncpy(name_of_file+1, TEX_format_default+1, format_area_length);
  strcat(strcat(name_of_file+1, strrchr(argv[0], '/') == NULL ? argv[0] : strrchr(argv[0], '/') + 1), ".fmt"); /* then try in system file area */
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
