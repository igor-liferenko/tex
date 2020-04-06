@* Intro.

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

int access(const char *str, int type)
{
  char s[1000];
  strcpy(s, str);

  int match = 0;
  @<If file is picture, set |match| to `1'@>@;
  if (match) {
    @<Convert@>@;
  }

  int (*orig_access)(const char *, int);
  orig_access = dlsym(RTLD_NEXT, "access");
  return (*orig_access)(s, type);
}

@ @<Convert@>=
@i mapping
char *utf8 = s;
for (const char *p = str; *p != '\0'; p++) {
  if ((unsigned char) *p <= 127)
    *utf8++ = *p;
  else {
    wchar_t c = xchr[(unsigned char) *p];
    size_t n;
    @<Determine number of bytes |n| in UTF-8@>@;
    @<Set first byte of UTF-8 sequence@>@;
    @<Set remaining bytes of UTF-8 sequence@>@;
  }
}
*utf8 = '\0';

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
*utf8 = (char)(c >> 6*(n-1));
if (n != 1)
  for (int i=(int)(n-1); i>=0; i--)
    *utf8 |= (char)(1 << (7-i));

@ Copy to each byte data bits which belong to this byte.
Then set its header to `10'.

@<Set remaining bytes...@>=
for (int i=(int)(n-2); i>=0; i--) {
  utf8++;
  *utf8 = (char)(c >> 6*i);
  *utf8 |= (char)(1 << 7);
  *utf8 &= (char)~(1 << 6);
}
utf8++;

@ Picture ends in `\.{.<number>}' or `\.{.eps}'.

@<If file is picture...@>=
const char *end = str + strlen(str) - 1;
if (*end == '1') {
  match = 1;
}

@ @c
FILE *fopen(const char *str, const char *mode)
{
  char s[1000];
  strcpy(s, str);

  int match = 0;
  @<If file is picture, set |match| to `1'@>@;
  if (match) {
    @<Convert@>@;
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

  int match = 0;
  @<If file is picture, set |match| to `1'@>@;
  if (match) {
    @<Convert@>@;
  }

  int (*orig_xstat)(int, const char *, struct stat *);
  orig_xstat = dlsym(RTLD_NEXT, "__xstat");
  return (*orig_xstat)(vers, s, buf);
}

@ @c
int __sprintf_chk(char *str, int flag, size_t strlen, const char *format, ...)
{
  char s[1000];

  va_list args;
  va_start(args, format);
  int r = vsprintf(str, format, args);
  va_end(args);

  if (strstr(str, "Could not find figure file") == str) {
    @<Convert@>@;
    strcpy(str, s);
  }

  return r;
}
