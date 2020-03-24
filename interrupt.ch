@x
int @!interrupt; /*should \TeX\ pause for instructions?*/ 
@y
volatile int @!interrupt;
void catchint(int signum)
{
  interrupt = 1;
}
#include <signal.h>
@z

@x
@p int main(void) {@! /*|start_here|*/ 
@y
@p int main(void) {@! /*|start_here|*/ 
struct sigaction sa;
sa.sa_handler = catchint;
sigemptyset(&sa.sa_mask);
sa.sa_flags = 0;
sigaction(SIGINT, &sa, NULL);
@z
