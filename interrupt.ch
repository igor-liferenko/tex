@x
@h
@y
@h
#include <signal.h>
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
start_of_TEX: @<Initialize the output routines@>;
@y
start_of_TEX: @<Initialize the output routines@>;
struct sigaction sa;
sa.sa_handler = catchint;
sigemptyset(&sa.sa_mask);
sa.sa_flags = 0;
sigaction(SIGINT, &sa, NULL);
@z
