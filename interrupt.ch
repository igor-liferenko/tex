TODO: do that ^C will not be printed:
put tty in raw mode (and restore it on exit);
rewrite the wrapper from shell to C and run virtex in a PTY;
echo all input (except ^C) and pass all input to pty and output from pty via two parallel processes;
on receipt of ^C send signal to virtex (and do not use "trap '' INT" in reimplementation
of wrapper in C)

@x
@h
@y
#include <signal.h>
#include <unistd.h>
@h
#define enabled_color (STDOUT_FILENO, enabled_, strlen(enabled_))
#define default_color (STDOUT_FILENO, default_, strlen(default_))
@z

@x
int @!interrupt; /*should \TeX\ pause for instructions?*/ 
@y
volatile int interrupt;
char *enabled_ = "", *default_ = "";
void catchint(int signum)
{
  interrupt = !interrupt;
  if (interrupt) write enabled_color;
  else write default_color;
}
struct sigaction sa;
@z

@x
  print_err("Interruption");
@y
  signal(SIGINT, SIG_IGN);
  write default_color;
  print_err("Interruption");
@z

@x
  interrupt=0;
@y
  interrupt=0;
  sigaction(SIGINT, &sa, NULL);
@z

@x
initialize(); /*set global variables to their starting values*/ 
@y
if (isatty(STDOUT_FILENO) && !(enabled_ = getenv("enabled_color"))) enabled_ = "";
if (isatty(STDOUT_FILENO) && !(default_ = getenv("default_color"))) default_ = "";
sa.sa_handler = catchint;
sigemptyset(&sa.sa_mask);
sa.sa_flags = SA_RESTART;
sigaction(SIGINT, &sa, NULL);
initialize(); /*set global variables to their starting values*/ 
@z
