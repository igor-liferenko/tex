@x
  else if (k=='@@') wputs("@@@@");
@y
  else if (k=='@@') wputs("@@@@");
  else if (k>=128) fprintf(w,"\\x%x", k);
@z

@x
This condition is taken from \.{tex.web}:
@<Character |k| cannot be printed@>=
  (k < ' ')||(k > '~')
@y
@<process the command line@>=
wchar_t xchr[256];
for (int i = 128; i < 256; i++) xchr[i] = 0;
@i ../mapping
@ @<Character |k| cannot be printed@>=
  (k < ' ')||(k == 127)||(k >= 128 && !xchr[k])
@z
