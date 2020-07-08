@x
#include <wchar.h>
@y
#include <wchar.h>
size_t wcsntombslen(wchar_t *s, size_t len)
{
  size_t n = 0;
  size_t l = 0;
  char mb[MB_CUR_MAX];
  while (l<len) {
    n+=wctomb(mb, *(s+l));
    l++;
  }
  return n;
}
@z

NOTE: this code was taken verbatim from @<Get the first line...@> (except that open_fmt_file is replaced with w_open_in)
NOTE: no need to zero-terminate name_of_file before strcat because it is global and thus implicitly initialized with zeros (TODO: ensure that it is so)
@x
initialize(); /*set global variables to their starting values*/ 
@y
initialize(); /*set global variables to their starting values*/ 
#ifndef INIT
if (strlen(strrchr(argv[0],'/')+1) + wcsntombslen(TEX_format_default+1, format_area_length)
    + 4 > file_name_size) exit(0);
for (int k=1,i=1; i <= format_area_length; i++) k += wctomb(name_of_file+k, TEX_format_default[i]);
strcat(name_of_file+1, strrchr(argv[0], '/') + 1);
strcat(name_of_file+1, ".fmt");
if (!w_open_in(&fmt_file)) exit(0);
if (!load_fmt_file()) {
  w_close(&fmt_file);
  exit(0);
} 
w_close(&fmt_file);
#endif
@z
