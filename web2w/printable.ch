Condition from §49 of tex.web is not used in tex.w, because pool file is not read.

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
wchar_t xchr[256] = {0}; /* not global, so initialize explicitly */
@i ../mapping
@ @<Character |k| cannot be printed@>=
  ((k < ' ')||(k > '~'))&&!xchr[k]
@z
