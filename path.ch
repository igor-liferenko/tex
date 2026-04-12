@x
@d format_default_length 20 /*length of the |TEX_format_default| string*/
@d format_area_length 11 /*length of its area part*/
@y
@d format_default_length 35 /*length of the |TEX_format_default| string*/
@d format_area_length 26 /*length of its area part*/
@z

@x
wcscpy(TEX_format_default+1, L"TeXformats/plain.fmt");
@y
wcscpy(TEX_format_default+1, L"/home/user/tex/TeXformats/plain.fmt");
@z

If you need non-ASCII, grep required characters one by one in mapping.w and use them via "\x":

@x
@d str_784 "TeXinputs/"
@y
@d str_784 "/home/user/tex/TeXinputs/"
@z

@x
@d str_785 "TeXfonts/"
@y
@d str_785 "/home/user/tex/TeXfonts/"
@z
