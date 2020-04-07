@* Intro.
TeX writes dvi files in internal encoding.
This presents a problem with filenames for {\sl psfile\/} in \.{\\special}.
To overcome this, convert filenames to external encoding in \.{dvips}
by overloading its procedures for file access.

\noindent To compile this program: \.{gcc -Wall -fPIC -shared -o mapping.so mapping.c -ldl}

\noindent To use this program: \.{LD\_PRELOAD=mapping.so dvips}

@c
#define _GNU_SOURCE

#include <dlfcn.h>
#include <string.h>
#include <sys/stat.h>
#include <stddef.h>
#include <stdio.h>
#include <stdint.h>
#include <stdarg.h>

wchar_t xchr[256];

@ Picture ends in `\.{.<number>}' or `\.{.eps}'.

@ @<Match@>=
if (*(s + strlen(s) - 1) == '1') match = 1;

@ @<If |s| matches figure, convert it@>=
if (s[sizeof s - 1] != '\0') {
  s[sizeof s - 1] = '\0';
  printf("!!! buffer too small (strncpy)\n");
  goto out;
}
int match = 0;
@<Match@>@;
if (match) {
  @<Convert@>@;
}
out:;

@ @<Convert@>=
@i mapping
char *sptr = s;
while (*arg != '\0') {
  if ((unsigned char) *arg <= 127) {
    if (sptr-s < sizeof s) *sptr = *arg;
    sptr++;
  }
  else {
    wchar_t c = xchr[(unsigned char) *arg];
    size_t n;
    @<Determine number of bytes |n| in UTF-8@>@;
    @<Set first byte of UTF-8 sequence@>@;
    @<Set remaining bytes of UTF-8 sequence@>@;
  }
  arg++;
}
if (sptr-s < sizeof s)
  *sptr = '\0';
else {
  s[sizeof s - 1] = '\0';
  printf("!!! buffer too small (utf8)\n");
}

@ The length of the resulting UTF-8 sequence is determined using the
following chart:
\medskip
{\tt\obeylines\obeyspaces
0xxxxxxx
110xxxxx      10xxxxxx
1110xxxx      10xxxxxx      10xxxxxx
11110xxx      10xxxxxx      10xxxxxx      10xxxxxx
111110xx      10xxxxxx      10xxxxxx      10xxxxxx      10xxxxxx
1111110x      10xxxxxx      10xxxxxx      10xxxxxx      10xxxxxx      10xxxxxx
}
\medskip

@<Determine number of bytes...@>=
if (!(c&(wchar_t)~0x7f)) n=1;
else if (!(c&(wchar_t)~0x7ff)) n=2;
else if (!(c&(wchar_t)~0xffff)) n=3;
else if (!(c&(wchar_t)~0x1fffff)) n=4;
else if (!(c&(wchar_t)~0x3ffffff)) n=5;
else n=6;

@ Copy to the first byte data bits which belong there. Then set
its header according to the chart in |@<Determine number of bytes...@>|.

@<Set first byte...@>=
if (sptr-s < sizeof s) {
  *sptr = (char)(c >> 6*(n-1));
  if (n != 1)
    for (int i=(int)(n-1); i>=0; i--)
      *sptr |= (char)(1 << (7-i));
}

@ Copy to each byte data bits which belong to this byte.
Then set its header to `10'.

@<Set remaining bytes...@>=
for (int i=(int)(n-2); i>=0; i--) {
  sptr++;
  if (sptr-s >= sizeof s) break;
  *sptr = (char)(c >> 6*i);
  *sptr |= (char)(1 << 7);
  *sptr &= (char)~(1 << 6);
}
sptr++;

@ @c
int access(const char *pathname, int type)
{
  const char *arg = pathname;
  char s[1000];
  strncpy(s, arg, sizeof s);
  @<If |s| matches...@>@;

  int (*orig_access)(const char *, int);
  orig_access = dlsym(RTLD_NEXT, "access");
  return (*orig_access)(s, type);
}

@ @c
FILE *fopen(const char *pathname, const char *mode)
{
  const char *arg = pathname;
  char s[1000];
  strncpy(s, arg, sizeof s);
  @<If |s| matches...@>@;

  FILE *(*orig_fopen)(const char *, const char *);
  orig_fopen = dlsym(RTLD_NEXT, "fopen");
  return (*orig_fopen)(s, mode);
}

@ @c
int __xstat(int vers, const char *pathname, struct stat *buf)
{
  const char *arg = pathname;
  char s[1000];
  strncpy(s, arg, sizeof s);
  @<If |s| matches...@>@;

  int (*orig_xstat)(int, const char *, struct stat *);
  orig_xstat = dlsym(RTLD_NEXT, "__xstat");
  return (*orig_xstat)(vers, s, buf);
}

@ @c
int __sprintf_chk(char *str, int flag, size_t len, const char *format, ...)
{
  va_list args;
  va_start(args, format);
  int r = vsprintf(str, format, args);
  va_end(args);

  if (strstr(str, "Could not find figure file") == str) {
    char *arg = str;
    char s[1000];
    @<Convert@>@;
    if (strlen(s) < len) strcpy(str, s);
    else printf("!!! string too big\n");
  }

  return r;
}
