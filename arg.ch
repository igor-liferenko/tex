@x
@ The following program does the required initialization
without retrieving a possible command line.
It should be clear how to modify this routine to deal with command lines,
if the system permits them.
@^system dependencies@>

@p bool init_terminal(void) /*gets the terminal input started*/
{@+
t_open_in;
@y
@ The following program does the required initialization
and also retrieves a possible command line.
@^system dependencies@>

@p bool init_terminal(int argc, char **argv)
{
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
      if (i < argc - 1) buffer[last++] = ' ';
    }
    loc = first;
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
@p int main(int argc, char **argv) {@! /*|start_here|*/
@z
