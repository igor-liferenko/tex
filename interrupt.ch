FIXTHIS: setting sa_flags to SA_RESTART has the effect that interrupts are ignored if we are waiting for input; make sa_flags zero and read https://tug.org/pipermail/tex-k/2020-August/003315.html - do this after fixed TL will be released in Debian, to compare with it - first do mf/ - use mf/input.ch for testing (while testing set sa_flags to zero)

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
