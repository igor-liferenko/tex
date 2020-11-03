Print "TeXinputs/" instead of full path to it in log file and on terminal.

NOTE: X_area is in UTF-8 encoding (cf. TEX_area)
@x
@p str_number make_name_string(void)
@y
@d X_area "/home/user/tex/TeXinputs/"
@p str_number make_name_string(void)
@z

@x
else{@+for (k=1; k<=name_length; k++) {
@y
else {
  k=1;
  if (strstr(name_of_file+1, X_area))
    k = k + strstr(X_area, "TeXinputs/") - X_area;
  for (; k<=name_length; k++) {
@z
