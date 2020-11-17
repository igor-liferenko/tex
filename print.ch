Print "TeXinputs/" instead of full path to it in log file and on terminal.

@x
@h
@y
@h
#define str_(x) str_ ## x
#define str(x) str_(x)
@z

NOTE: for simplicity it is assumed that TEX_area is ASCII-only
@x
else{@+for (k=1; k<=name_length; k++) {
@y
else {
  k=1;
  if (strstr(name_of_file+1, str(TEX_area))
    k += strstr(str(TEX_area), "TeXinputs/") - str(TEX_area);
  for (; k<=name_length; k++) {
@z
