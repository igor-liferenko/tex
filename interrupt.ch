NOTE: interrupt must not be sent when TeX is waiting for input from terminal
(because there is nothing to interrupt; moreover, TTY line discipline destroys
pending data, and spurious ^C is printed on terminal).

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
