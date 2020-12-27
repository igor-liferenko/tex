TODO: no need to use pipe mode - do like in gftopk.ch and unlink dvi file afterwards - then mag will be already set for sure

@x
@h
@y
#include <sys/wait.h>
@h
@z

@x
bool b_open_out(byte_file *f)
   /*open a binary file for output*/ 
{@+rewrite((*f), name_of_file,"wb");return rewrite_OK((*f));
}
@y
int fd[2];
pid_t dvipdfm;
bool b_open_out(byte_file *f)
{
  assert(pipe(fd) != -1);
  assert((dvipdfm = fork()) != -1);
  if (dvipdfm == 0) {
    dup2(fd[0], STDIN_FILENO);
    signal(SIGINT, SIG_IGN);
    close(fd[1]);
    execlp("dvipdfm", "dvipdfm", "-p", "a4", "-x", "22.45mm", "-y", "34.2mm", "-o", name_of_file+1, (char *) NULL);
    exit(1);
  }
  f->f = fdopen(fd[1], "w");
  setbuf(f->f, NULL);
  return rewrite_OK(*f);
}
@z

@x
  b_close(&dvi_file);
@y
  b_close(&dvi_file);
  int wstatus; waitpid(dvipdfm, &wstatus, 0); assert(wstatus == 0);
@z

@x
@d str_510 ".dvi"
@y
@d str_510 ".pdf"
@z
