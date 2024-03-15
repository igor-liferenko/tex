From another terminal run:

    pkill -USR1 -f /tex/ -t tty_name

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
sigaction(SIGUSR1, &sa, NULL);
initialize(); /*set global variables to their starting values*/ 
@z
