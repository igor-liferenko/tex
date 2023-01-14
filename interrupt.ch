TODO: do that ^C will not be printed - put tty in raw mode (and restore it on exit) and
pass all input to pty which is connected to TeX, and back; on receipt of ^C send signal
to virtex (then remove 'trap' from wrappers) or to process group

@x
@h
@y
#include <signal.h>
@h
@z

@x
int @!interrupt; /*should \TeX\ pause for instructions?*/ 
@y
volatile int @!interrupt;
void catchint(int signum)
{
  interrupt = !interrupt;
  if (interrupt == 1) fprintf(stderr, "\x1B]12;red\x1B\\");
  else fprintf(stderr, "\x1B]112\x1B\\");
}
@z

@x
  {@+interaction=error_stop_mode;
@y
  {@+interaction=error_stop_mode;
  fprintf(stderr, "\x1B]112\x1B\\");
@z

@x
initialize(); /*set global variables to their starting values*/ 
@y
struct sigaction sa;
sa.sa_handler = catchint;
sigemptyset(&sa.sa_mask);
sa.sa_flags = SA_RESTART;
sigaction(SIGINT, &sa, NULL);
initialize(); /*set global variables to their starting values*/ 
@z
