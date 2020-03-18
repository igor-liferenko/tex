@x
@h
@y
@h
#define str_(x) str_ ## x
#define str(x) str_(x)
@z

!!! if need more, change type of |name_length| from uint8_t to uint16_t in tex.w !!!
@x
enum {@+@!file_name_size=40@+}; /*file names shouldn't be longer than this*/
@y
enum {@+@!file_name_size=255@+}; /*file names shouldn't be longer than this*/
@z

TODO: why '.' in `\font\my=./myfont' is not regarded as start of extension?
@x
  if ((c=='>')||(c==':')) 
@y
  if (c=='/')
@z

use absolute path
@x
@d format_default_length	20 /*length of the |TEX_format_default| string*/
@d format_area_length	11 /*length of its area part*/
@y
@d format_default_length	36 /*length of the |TEX_format_default| string*/
@d format_area_length	27 /*length of its area part*/
@z

@x
ASCII_code @!TEX_format_default[1+format_default_length+1]=" TeXformats/plain.fmt";
@y
ASCII_code @!TEX_format_default[1+format_default_length+1]=" /home/user/ctex/TeXformats/plain.fmt";
@z

Display "TeXinputs/" instead of full path to it in log files and on terminal.
@x
else{@+for (k=1; k<=name_length; k++) {
@y
else {
  k=1;
  if (strstr(name_of_file+1, str(TEX_area)) == (char *) name_of_file+1)
    if (strstr(str(TEX_area), "TeXinputs/") != NULL)
      k = strstr(str(TEX_area), "TeXinputs/") - str(TEX_area) + 1;
  for (; k<=name_length; k++) {
@z

use absolute paths
@x
@d str_506 "TeXinputs/"
@y
@d str_506 "/home/user/ctex/TeXinputs/"
@z
@x
@d str_507 "TeXfonts/"
@y
@d str_507 "/home/user/ctex/TeXfonts/"
@z
