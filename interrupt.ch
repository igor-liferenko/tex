TODO: do that ^C will not be printed - put tty in raw mode (and restore it on exit) and
pass all input to pty which is connected to TeX, and back; on receipt of ^C send signal
to virtex (then remove 'trap' from wrappers) or to process group

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
@z

@x
  {@+interaction=error_stop_mode;
@y
  {@+interaction=error_stop_mode;
  write reset_cursor_color;
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
