!!! if need more, change type of |name_length| from uint8_t to uint16_t in tex.w !!!
@x
enum {@+@!file_name_size=40@+}; /*file names shouldn't be longer than this*/
@y
enum {@+@!file_name_size=255@+}; /*file names shouldn't be longer than this*/
@z

@x
  if ((c=='>')||(c==':')) 
@y
  if (c=='/')
@z

@x
@d format_default_length	20 /*length of the |TEX_format_default| string*/
@d format_area_length	11 /*length of its area part*/
@y
@d format_default_length	35 /*length of the |TEX_format_default| string*/
@d format_area_length	26 /*length of its area part*/
@z
This must be ASCII:
@x
ASCII_code @!TEX_format_default[1+format_default_length+1]=" TeXformats/plain.fmt";
@y
ASCII_code @!TEX_format_default[1+format_default_length+1]=" /home/user/tex/TeXformats/plain.fmt";
@z

If you need non-ASCII here, grep required characters one by one in "mapping" and put here via "\x"
(all strings are stored in internal encoding directly in tex.w).
@x
@d str_506 "TeXinputs/"
@y
@d str_506 "/home/user/tex/TeXinputs/"
@z
@x
@d str_507 "TeXfonts/"
@y
@d str_507 "/home/user/tex/TeXfonts/"
@z
