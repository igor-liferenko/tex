Hyphenate already\hyphen@te-\hyphen@te hyphenated words.

NOTE: to ensure that this ch-file is compatible with original TeX,
      change \def\\{\hyphen@te-\hyphen@te} in format into \def\\{\kern0pt-\nobreak\hskip0pt\relax}
      and compare dvitype output before and after - it must be the same

NOTE: if you use '-' in a compound word and you get an overfull box warning,
      simply change '-' to '\\'

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
