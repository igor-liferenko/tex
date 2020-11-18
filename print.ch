Print "TeXinputs/" instead of full path to it in log file and on terminal.

@x
@h
@y
@h
#define str_(x) str_ ## x
#define str(x) str_(x)
@z

@x
else{@+for (k=1; k<=name_length; k++) {
@y
else {
  text_char EXT_area[strlen(str(TEX_area))+1];
  for (k=0; k<strlen(str(TEX_area)); k++)
    EXT_area[k] = xchr[(ASCII_code) *(str(TEX_area)+k)];
  EXT_area[k] = L'\0';
  utf8_t U8_area[wcstombs(NULL,EXT_area,0)+1];
  wcstombs(U8_area, EXT_area, sizeof U8_area);
  k=1;
  if (strstr(name_of_file+1, U8_area) != NULL)
    k += (utf8_t *) strstr(U8_area, "TeXinputs/") - U8_area;
  for (; k<=name_length; k++) {
@z
