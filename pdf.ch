@x
@h
@y
#include <sys/wait.h>
@h
@z

@x
  b_close(&dvi_file);
@y
  char *fname, symlink[50];
  sprintf(symlink, "/proc/self/fd/%d", fileno(dvi_file.f));
  assert((fname = realpath(symlink, NULL)) != NULL);
  b_close(&dvi_file);
  pid_t dvipdfm_pid = fork();
  assert(dvipdfm_pid != -1);
  if (dvipdfm_pid == 0) {
    signal(SIGINT, SIG_IGN);
    execlp("dvipdfmx", "dvipdfmx", "-q", fname, (char *) NULL);
    _exit(1);
  }
  int dvipdfm; waitpid(dvipdfm_pid, &dvipdfm, 0); assert(dvipdfm == 0);
@z
