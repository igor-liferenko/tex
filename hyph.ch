Hyphenate already-hyphenated words.

NOTE: to ensure that this ch-file is compatible with original TeX,
      add \def\\{\kern0pt-\nobreak\hskip0pt\relax} to the beginning of document
      and compare dvitype output before and after - it must be the same

NOTE: if you use '-' in a compound word and you get an overfull box warning,
      simply change '-' to '\\'

For the analysis of how this works, see tex.stackexchange.com/q/750481/

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
