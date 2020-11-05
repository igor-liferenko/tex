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
  k=1;
  wchar_t W_area[strlen(str(TEX_area))+1];
  for (int i = 0; i < strlen(str(TEX_area)); i++) W_area[i] = xchr[(ASCII_code)*(str(TEX_area)+i)];
  W_area[strlen(str(TEX_area))] = L'\0';
  char U_area[wcstombs(NULL,W_area,0)+1];
  wcstombs(U_area, W_area, sizeof U_area);
  if (strstr(name_of_file+1, U_area) && strstr(U_area, "TeXinputs/"))
    k += strstr(U_area, "TeXinputs/") - U_area;
  for (; k<=name_length; k++) {
@z
