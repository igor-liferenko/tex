The string that is specified here will be replaced by "TeXinputs/" in the beginning of
`name_of_file' while printing it on log file and terminal.
Use non-ASCII here directly.

@x
@p str_number make_name_string(void)
{@+int k; /*index into |name_of_file|*/ 
@y
@d MY_area "/home/user/tex/TeXinputs/"
@p str_number make_name_string(void)
{ if (strstr(name_of_file+1, MY_area)) {
    char fname[file_name_size+1];
    strcpy(fname, name_of_file+1);
    strcat(strcpy(name_of_file+1, "TeXinputs/"), fname + strlen(MY_area));
    name_length = strlen(name_of_file+1);
  }
  int k; /*index into |name_of_file|*/
@z
