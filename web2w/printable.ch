Condition from §49 of tex.web is not used in tex.w, because pool file is not read
(instead, this condition is hard-coded in tex.w by web2w).

Use backslash notation to represent non-visible characters, created by the next change
(they are a problem for text editor and above 127 are not valid UTF-8).
@x
  else wput(k);
@y
  else if (k>=128) fprintf(w,"\\x%x",k); /* same width as ^^xx, so that 'diff' will be lined up */
  else if (k<' '||k==127) fprintf(w,"\\%02o",k); /* same width as ^^a (except 127) */
  else wput(k);
@z

Normally, the non-printability condition is set independently from xchr,
but here the non-printable characters (defined as in tex.web) are made printable usig xchr.
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
