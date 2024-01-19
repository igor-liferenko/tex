See section 5.8 in web2w.pdf

@x
This condition is taken from \.{tex.web}:
@<Character |k| cannot be printed@>=
  (k < ' ')||(k > '~')
@y
@<process the command line@>=
wchar_t xchr[256] = {};
@i mapping.w
@ @<Character |k| cannot be printed@>=
(k < ' ' || k > '~') && xchr[k] == 0
@z
