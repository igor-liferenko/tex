!!! if need more, change type of |name_length| from uint8_t to uint16_t in tex.w !!!
@x
enum {@+@!file_name_size=40@+}; /*file names shouldn't be longer than this*/
@y
enum {@+@!file_name_size=255@+}; /*file names shouldn't be longer than this*/
@z

Unix directory separator.
@x
  if ((c=='>')||(c==':')) 
@y
  if (c=='/')
@z

@x
@d format_default_length	20 /*length of the |TEX_format_default| string*/
@d format_area_length	11 /*length of its area part*/
@y
@d format_default_length 35
@d format_area_length    26
@z

@x
text_char @!TEX_format_default[1+format_default_length+1]=L" TeXformats/plain.fmt";
@y
text_char @!TEX_format_default[1+format_default_length+1]=L" /home/user/tex/TeXformats/plain.fmt";
@z

If you need non-ASCII here, grep required characters one by one in "mapping" and put here via "\x".
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
