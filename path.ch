@x
enum {@+@!file_name_size=40@+}; /*file names shouldn't be longer than this*/
@y
enum {@+@!file_name_size=256@+}; /*file names shouldn't be longer than this*/
@z

@x
uint8_t @!name_length;@/ /*this many characters are actually
@y
uint16_t @!name_length;@/ /*this many characters are actually
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
@d format_default_length 35 /*length of the |TEX_format_default| string*/
@d format_area_length 26 /*length of its area part*/
@z

@x
wcscpy(TEX_format_default+1, L"TeXformats/plain.fmt");
@y
wcscpy(TEX_format_default+1, L"/home/user/tex/TeXformats/plain.fmt");
@z

If you need non-ASCII here, grep required characters one by one in mapping.w and put here via "\x".
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
Change this also in mf/Makefile
