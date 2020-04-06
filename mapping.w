@* Intro.

@c
#define _GNU_SOURCE

#include <stdio.h>
#include <dlfcn.h>
#include <string.h>
#include <wchar.h>
#include <locale.h>
#include <stdlib.h>
#include <sys/stat.h>

wchar_t xchr[256];

int access(const char *str, int type)
{
  char s[1000];
  strcpy(s, str);

  const char *end = str + strlen(str) - 1;
  if (*end == '1') {
    printf("In our own access, before %s\n", s);
    @<Convert@>@;
    printf("In our own access, after %s\n", s);
  }

  int (*orig_access)(const char *str, int flags);
  orig_access = dlsym(RTLD_NEXT, "access");
  return (*orig_access)(s, type);
}

@ @<Convert@>=
@i mapping
setlocale(LC_CTYPE, "C.UTF-8");
char *sp = s;
for (const char *p = str; *p != '\0'; p++) {
  if ((unsigned char) *p <= 127)
    *sp++ = *p;
  else {
    char mb[MB_CUR_MAX];
    int len = wctomb(mb, xchr[(unsigned char) *p]);
    for (int k = 0; k < len; k++)
      *sp++ = mb[k];
  }
}
*sp = '\0';

@ @c
FILE *fopen(const char *str, const char *mode)
{
  char s[1000];
  strcpy(s, str);

  const char *end = str + strlen(str) - 1;
  if (*end == '1') {
    printf("In our own fopen, before %s\n", s);
    @<Convert@>@;
    printf("In our own fopen, after %s\n", s);
  }

  FILE *(*orig_fopen)(const char *, const char *);
  orig_fopen = dlsym(RTLD_NEXT, "fopen");
  return (*orig_fopen)(s, mode);
}

@ @c
int __xstat(int vers, const char *str, struct stat *buf)
{
  char s[1000];
  strcpy(s, str);

  const char *end = str + strlen(str) - 1;
  if (*end == '1') {
    printf("In our own stat, before %s\n", s);
    @<Convert@>@;
    printf("In our own stat, after %s\n", s);
  }

  int (*orig_xstat)(int, const char *, struct stat *);
  orig_xstat = dlsym(RTLD_NEXT, "__xstat");
  return (*orig_xstat)(vers, s, buf);
}
