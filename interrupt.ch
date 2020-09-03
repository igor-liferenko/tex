Now part of input before ^C is ignored.
Test for a while and if Abort will not happen in response to ^C, make so that part of input before
^C will not be ignored:
1) set sa_flags to SA_RESTART
2) rm EILSEQ and errno.h from input.ch
3) rm changes with "ferror" and "restart:" from here
4) in catchint do
  if (!waiting_for_input) interrupt = 1;
and create global variable waiting_for_input and
add here the following change (and put interrupt.ch after input.ch in Makefile):

 @x
if (bypass_eoln) if (!eof((*f)))
  if (((*f).d=fgetwc((*f).f)) > 65535 || ferror((*f).f)) kill(getpid(), SIGABRT), pause();
 @y
if (bypass_eoln) if (!eof((*f))) {
  waiting_for_input = 1;
  if (((*f).d=fgetwc((*f).f)) > 65535 || ferror((*f).f)) kill(getpid(), SIGABRT), pause();
  waiting_for_input = 0;
}
 @z

and do the same in mf/interrupt.ch

@x
@h
@y
#include <signal.h>
@h
@z

@x
{@+uint16_t last_nonblank; /*|last| with trailing blanks removed*/
@y
{@+uint16_t last_nonblank; /*|last| with trailing blanks removed*/
restart:
@z

@x
  while (!eoln((*f)))
@y
  if (ferror((*f).f)) {
    interrupt = 0;
    clearerr((*f).f);
    goto restart;
  }
  while (!eoln((*f)))
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
sa.sa_flags = 0;
sigaction(SIGINT, &sa, NULL);
initialize(); /*set global variables to their starting values*/ 
@z
