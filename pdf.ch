@x
@h
@y
#include <limits.h>
#include <sys/wait.h>
#include <unistd.h>
@h
@z

@x
  b_close(&dvi_file);
@y
  char fname[PATH_MAX];
  sprintf(fname, "/proc/self/fd/%d", fileno(dvi_file.f));
  assert(realpath(strdup(fname), fname));
  b_close(&dvi_file);
  if (history <= warning_issued) {
    pid_t dvipdf_pid = fork();
    assert(dvipdf_pid != -1);
    if (dvipdf_pid == 0) {
      signal(SIGINT, SIG_IGN);
      execlp("dvipdf", "dvipdf", fname, (char *) NULL);
      _exit(1);
    }
    int dvipdf; waitpid(dvipdf_pid, &dvipdf, 0); assert(dvipdf == 0);
  }
@z
