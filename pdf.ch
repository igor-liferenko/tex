@x
@h
@y
#include <sys/wait.h>
@h
@z

@x
  b_close(&dvi_file);
@y
char tmp[30];
assert(snprintf(tmp, sizeof tmp, "/proc/self/fd/%d", fileno(dvi_file.f)) < sizeof tmp);
char fname[500] = { };
assert(readlink(tmp, fname, sizeof fname) != -1 && fname[sizeof fname - 1] == '\0');
b_close(&dvi_file);
pid_t dvipdfm = fork();
assert(dvipdfm != -1);
if (dvipdfm == 0) {
  signal(SIGINT, SIG_IGN);
  execlp("xdvipdfm", "xdvipdfm", "-p", "a4", "-x", "22.45mm", "-y", "34.2mm", "-o", name_of_file+1, name_of_file+1, (char *) NULL);
  exit(1);
}
int wstatus; waitpid(dvipdfm, &wstatus, 0); assert(wstatus == 0);
@z

@x
@d str_510 ".dvi"
@y
@d str_510 ".pdf"
@z
