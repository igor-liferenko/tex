@x
@p void pack_buffered_name(small_number @!n, int @!a, int @!b)
@y
@p
int format_area_u8_length(void)
{
  int n = 0;
  char mb[MB_CUR_MAX];
  for (int k = 1; k <= format_area_length; k++)
    n += wctomb(mb, TEX_format_default[k]);
  return n;
}
void pack_buffered_name(small_number @!n, int @!a, int @!b)
@z

NOTE: this code was taken verbatim from @<Get the first line...@> (except that open_fmt_file is replaced with w_open_in)
NOTE: no need to zero-terminate name_of_file before strcat because it is global and thus implicitly initialized with zeros (TODO: ensure that it is so)
@x
initialize(); /*set global variables to their starting values*/ 
@y
initialize(); /*set global variables to their starting values*/ 
#ifndef INIT
if (format_area_u8_length() + strlen(strrchr(argv[0],'/')+1) + 4 > file_name_size) exit(0);
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
