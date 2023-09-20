Get DVI and log file name.

@x
@h
@y
#include <limits.h>
@h
@z

@x
  b_close(&dvi_file);
@y
  if (getenv("TEXdvi")) {
    char s1[50], s2[PATH_MAX];
    sprintf(s1, "/proc/self/fd/%d", fileno(dvi_file.f));
    assert(realpath(s1, s2));
    FILE *f;
    assert(f = fopen(getenv("TEXdvi"), "w"));
    fprintf(f, "%s", s2);
    fclose(f);
  }
  b_close(&dvi_file);
@z

@x
  {@+wlog_cr;a_close(&log_file);selector=selector-2;
@y
  {@+wlog_cr;
  if (getenv("TEXlog")) {
    char s1[50], s2[PATH_MAX];
    sprintf(s1, "/proc/self/fd/%d", fileno(log_file.f));
    assert(realpath(s1, s2));
    FILE *f;
    assert(f = fopen(getenv("TEXlog"), "w"));
    fprintf(f, "%s", s2);
    fclose(f);
  }
  a_close(&log_file);selector=selector-2;
@z
