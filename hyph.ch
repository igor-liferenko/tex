Hyphenate already\hyphen@te-\hyphen@te hyphenated words.
This ch-file makes it so that spurious space after '-' is not output to terminal
and log file in overfull warnings (which is the case for \kern0pt-\nobreak\hskip0pt\relax)

NOTE: if you use '-' in a compound word and you get an overfull box warning,
      simply change '-' to '\\'

NOTE: to ensure that this ch-file is compatible with original TeX,
      change \def\\{\hyphen@te-\hyphen@te} in format into \def\\{\kern0pt-\nobreak\hskip0pt\relax}
      and compare dvitype output before and after

Do not show the node on terminal and in log file?
@x
while (p > mem_min)
@y
while (p > mem_min) if (type(p)==whatsit_node && subtype(p)==hyph_node) p=link(p); else
@z

Do not show the node in \showlists?
@x
while (p > mem_min)
@y
while (p > mem_min) if (type(p)==whatsit_node && subtype(p)==hyph_node) p=link(p); else
@z

@x
case whatsit_node: @<Advance \(p)past a whatsit node in the \(l)|line_break| loop@>@;@+break;
@y
case whatsit_node: if (subtype(cur_p)==hyph_node) goto try_hyph;
@<Advance \(p)past a whatsit node in the \(l)|line_break| loop@>@;@+break;
@z

@x
  if (second_pass&&auto_breaking)
@y
 try_hyph:
  if (second_pass&&auto_breaking)
@z
