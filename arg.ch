@x
@p bool init_terminal(void) /*gets the terminal input started*/
@y
@p bool init_terminal(int argc, char **argv)
@z

See §36.
@x
t_open_in;
@y
t_open_in;
  if (argc > 1) {
    last = first;
    for (int i = 1; i < argc; i++) {
      for (int k = 0; k < strlen(argv[i]); k++) {
        wchar_t wc;
        int len = mbtowc(&wc, argv[i]+k, MB_CUR_MAX);
        buffer[last++] = xord(wc);
        k += len - 1;
      }
      buffer[last++] = ' ';
    }
    while (last > first && buffer[last-1] == ' ') last--;
    loc = first;
    while (loc < last && buffer[loc] == ' ') loc++;
    if (loc < last)
      return true;
  }
@z

@x
if (!init_terminal()) exit(0);
@y
if (!init_terminal(argc,argv)) exit(0);
@z

@x
@p int main(void) {@! /*|start_here|*/
@y
@p int main(int argc, char **argv) {
@z
