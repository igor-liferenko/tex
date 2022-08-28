@x
@h
@y
#include <limits.h>
@h
@z

@x
  b_close(&dvi_file);
@y
  if (getenv("tex_tmp")) {
    char fname[PATH_MAX];
    sprintf(fname, "/proc/self/fd/%d", fileno(dvi_file.f));
    assert(realpath(strdup(fname), fname));
    FILE *stream;
    assert(stream = fopen(getenv("tex_tmp"), "w"));
    fprintf(stream, "%s", fname);
    fclose(stream);
  }
  b_close(&dvi_file);
@z
