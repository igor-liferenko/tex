Condition from §49 of tex.web is not used in tex.w, because pool file is not read
(instead, this condition is hard-coded in tex.w by web2w).

Exclude from non-printable characters also characters which are in mapping.w
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
