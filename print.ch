Print "TeXinputs/" instead of full path to it in log file and on terminal.

@x
else{@+for (k=1; k<=name_length; k++) {
@y
else {
  wchar_t EXT_area[length(TEX_area)+1];
  for (k=0; k<length(TEX_area); k++)
    EXT_area[k] = xchr[so(str_pool[str_start[TEX_area]+k])];
  EXT_area[k] = L'\0';
  char U8_area[wcstombs(NULL,EXT_area,0)+1];
  wcstombs(U8_area, EXT_area, sizeof U8_area);
  k=1;
  if (strncmp(name_of_file+1, U8_area, strlen(U8_area)) == 0)
    k += strlen(U8_area) - strlen("TeXinputs/");
  for (; k<=name_length; k++) {
@z
