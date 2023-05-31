If your terminal emulator supports binding a key to send a signal to a process,
use this to send, e.g., SIGUSR1 (then change SIGWINCH to SIGUSR1 below).
My terminal emulator does not support this, so I use a workaround:
Show menu bar (normally I have it hidden). This causes the size of terminal
emulator window to change, which triggers SIGWINCH.
When Interruption prompt appears, hide menu bar back (while in the prompt,
setting 'interrupt' flag influences nothing because it is set to zero when we leave
the prompt).
Showing/hiding menu bar works OK for me, because I use terminal emulator always in one size
(i.e., otherwise the terminal window size does not change, so TeX can't be interrupted
inadvertently).

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
sigaction(SIGWINCH, &sa, NULL);
initialize(); /*set global variables to their starting values*/ 
@z
