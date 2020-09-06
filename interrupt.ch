Terminate the program when ^C is pressed when waiting for input.

@x
@h
@y
#include <signal.h>
@h
@z

Until the input is terminated with <return>, the first "get" in input_ln()
blocks. We surround it with waiting_for_input flag to allow the interrupt
handler know that it must terminate the program.
@x
if (bypass_eoln) if (!eof((*f))) (*f).d=fgetwc((*f).f);
@y
if ((*f).f == stdin) waiting_for_input = 1;
if (bypass_eoln) if (!eof((*f))) (*f).d=fgetwc((*f).f);
if ((*f).f == stdin) waiting_for_input = 0;
@z

@x
int @!interrupt; /*should \TeX\ pause for instructions?*/ 
@y
int waiting_for_input = 0;
volatile int @!interrupt;
void catchint(int signum)
{
  if (waiting_for_input) wterm_cr, exit(1);
  interrupt = 1;
}
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
