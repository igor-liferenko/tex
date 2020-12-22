TODO: make dvipdfm return non-zero exit code if psfile does not exist
TODO: saying `e' in response to `?' gives segfault

@x
@h
@y
#include <fcntl.h>
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
#define read_end fd[0]
#define write_end fd[1]
pid_t dvipdfm;
bool b_open_out(byte_file *f)
{
  assert(pipe(fd) != -1);
  assert((dvipdfm = fork()) != -1);
  if (dvipdfm == 0) {
    dup2(read_end, STDIN_FILENO);
    dup2(open("/dev/null", O_WRONLY), STDERR_FILENO); /* discard mktexpk output */
    signal(SIGINT, SIG_IGN);
    close(write_end);
    execlp("dvipdfm", "dvipdfm", "-q", "-p", "a4", "-x", "22.45mm", "-y", "34.2mm", "-o", name_of_file+1, (char *) NULL);
    exit(1);
  }
  f->f = fdopen(write_end, "w");
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
