@x
uint8_t @!name_length;@/ /*this many characters are actually
@y
int       name_length;@/ /*this many characters are actually
@z

@x
  if ((c=='>')||(c==':'))
@y
  if (c=='/')
@z

@x
strcpy(TEX_format_default+1, "TeXformats:plain.fmt");
@y
strcpy(TEX_format_default+1, "TeXformats/plain.fmt");
@z

@x
@d str_784 "TeXinputs:"
@y
@d str_784 "TeXinputs/"
@z

@x
@d str_785 "TeXfonts:"
@y
@d str_785 "TeXfonts/"
@z
