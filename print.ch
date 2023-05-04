Modify make_name_string in order that in log file and on terminal "TeXinputs/" will be 
printed instead of "/path/to/TeXinputs/" (see a_make_name_string in start_input).

@x
else{@+for (k=1; k<=name_length; k++) {
@y
else {
  wchar_t EXT_area[length(TEX_area)+1]; /* TEX_area in external encoding */
  for (k=0; k<length(TEX_area); k++)
    EXT_area[k] = xchr[so(str_pool[str_start[TEX_area]+k])];
  EXT_area[k] = L'\0';
  char U8_area[wcstombs(NULL,EXT_area,0)+1]; /* TEX_area in UTF-8 */
  wcstombs(U8_area, EXT_area, sizeof U8_area);
  k=1;
  if (strncmp(name_of_file+1, U8_area, strlen(U8_area)) == 0)
    k += strlen(U8_area) - strlen("TeXinputs/");
  for (; k<=name_length; k++) {
@z
