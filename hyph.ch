Hyphenate already\hyphen@te-\hyphen@te hyphenated words.

NOTE: delete this ch-file from Makefile and change \def\\ in format into
... and compare dvitype output before and after to ensure that these changes
are compatible with original TeX

Do not show the node in ...
@x
while (p > mem_min)
@y
while (p > mem_min) if (type(p)==whatsit_node && subtype(p)==hyph_node) p=link(p); else
@z

Do not show the node in ...
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
