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
@z

@x
#define write(file, format,...)    @[fprintf(file.f,format,## __VA_ARGS__)@]
@y
#define write(file, format,...)    @[fprintf(file.f,format,## __VA_ARGS__)@]
#define set_cursor_color (1, "\e]12;red\e\\", 10)
#define reset_cursor_color (1, "\e]112\e\\", 7)
@z

@x
int @!interrupt; /*should \TeX\ pause for instructions?*/ 
@y
volatile int @!interrupt;
void catchint(int signum)
{
  interrupt = !interrupt;
  if (interrupt) write set_cursor_color;
  else write reset_cursor_color;
}
sigset_t sigint;
@z

@x
  print_err("Interruption");
@y
  sigprocmask(SIG_BLOCK, &sigint, NULL);
  write reset_cursor_color;
  sigprocmask(SIG_UNBLOCK, &sigint, NULL);
  print_err("Interruption");
@z

@x
initialize(); /*set global variables to their starting values*/ 
@y
sigemptyset(&sigint);
sigaddset(&sigint, SIGINT);
struct sigaction sa;
sa.sa_handler = catchint;
sigemptyset(&sa.sa_mask);
sa.sa_flags = SA_RESTART;
sigaction(SIGINT, &sa, NULL);
initialize(); /*set global variables to their starting values*/ 
@z
