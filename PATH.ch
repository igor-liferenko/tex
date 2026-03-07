 @x in constants.ch
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
@d str_506 "TeXinputs:"
@y
@d str_506 "TeXinputs/"
@z
@x
@d str_507 "TeXfonts:"
@y
@d str_507 "TeXfonts/"
@z
