@x
@h
@y
@h
#define str_(x) str_ ## x
#define str(x) str_(x)
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
