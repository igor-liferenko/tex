Condition from §49 of tex.web is not used in tex.w, because pool file is not read
(instead, this condition is hard-coded in tex.w by web2w).

Use backslash notation to represent non-visible characters, created by the next change
(above 127 are not valid UTF-8 and below 32 are a problem for text editor).
@x
  else wput(k);
@y
  else if (k>=128) fprintf(w,"\\x%x",k); /* same width as ^^xx, so that 'diff' will be lined up */
  else if (k<' '||k==127) fprintf(w,"\\%02o",k); /* same width as ^^a (except 127) */
  else wput(k);
@z

Normally, the printability condition is set independently from xord/xchr mapping,
but here it makes sense to tie it to the mapping.
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
