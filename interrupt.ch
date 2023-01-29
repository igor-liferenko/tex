Show tab bar or menu bar and hide it back (or vice versa - depending on your settings).

@x
@h
@y
#include <signal.h>
@h
@z

@x
int @!interrupt; /*should \TeX\ pause for instructions?*/ 
@y
volatile
int @!interrupt; /*should \TeX\ pause for instructions?*/
void catchint(int signum)
{
  interrupt = !interrupt;
}
@z

@x
initialize(); /*set global variables to their starting values*/ 
@y
struct sigaction sa;
sa.sa_handler = catchint;
sigemptyset(&sa.sa_mask);
sa.sa_flags = SA_RESTART;
sigaction(SIGWINCH, &sa, NULL);
initialize(); /*set global variables to their starting values*/ 
@z
