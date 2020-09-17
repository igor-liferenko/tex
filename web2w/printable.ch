See §5.8 in web2w.w

@x
This condition is taken from \.{tex.web}:
@<Character |k| cannot be printed@>=
  (k < ' ')||(k > '~')
@y
@<process the command line@>=
wchar_t xchr[256] = {0}; /* not global, so initialize explicitly */
@i mapping.w
@ @<Character |k| cannot be printed@>=
  ((k < ' ')||(k > '~'))&&!xchr[k]
@z
