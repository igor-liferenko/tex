@x
  else wput(k);
@y
  else if (k>=128) fprintf(w,"\\x%x", k);
  else wput(k);
@z

@x
This condition is taken from \.{tex.web}:
@<Character |k| cannot be printed@>=
  (k < ' ')||(k > '~')
@y
@<process the command line@>=
wchar_t xchr[256] = {0};
@i ../mapping
@ @<Character |k| cannot be printed@>=
  ((k < ' ')||(k > '~'))&&!xchr[k]
@z
