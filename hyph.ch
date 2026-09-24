Hyphenate already-hyphenated words (relies on hyph_node whatsit, added in exten.ch)

NOTE: to ensure that this ch-file is compatible with original TeX,
      add \def\\{\kern0pt-\nobreak\hskip0pt\relax} to the beginning of document
      and compare dvitype output before and after - it must be the same
      (the difference is that spurious space after - is not output to terminal
      and to log file in overfull warnings, and that hyph_node is skipped in
      output of \showbox, \showlists, etc.)

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

--------------------------------------------------------------

To allow hyphenation of compound words, we need to alter the
part of hyphenation algorithm, described on p.454 of TeXbook:

    TeX looks for potentially hyphenatable words by searching
    ahead from each glue item that is not in a math formula.

This change-file makes it so that in addition to glue, the
search is also started from hyph_node.

Let's see how the hyphenation algorithm will behave when it
encounters hyph_node. We will use
already<hyph_node>-<disc_node><hyph_node>hyphenated as an
example (the empty discretionary is automatically inserted
after the -).

The following two quotes from TeXbook describe the process
after first <hyph_node> is encountered.

    The search bypasses characters whose \lccode is zero, or
    ligatures that begin with such characters; it also bypasses
    whatsits and implicit kern items, i.e., kerns that were
    inserted by TeX itself because of information stored with
    the font.

So the hyphen is skipped.

    If the search finds a character with nonzero \lccode, or if
    it finds a ligature that begins with such a character, that
    character is called the starting letter. But if any other
    type of item occurs before a suitable starting letter is
    found, hyphenation is abandoned (until after the next glue item).

So the <disc_node> causes the hyphenation to be abandoned.
Therefore, <hyph_node> which follows <disc_node> is not
bypassed. It is used to start new search - the hyphenation
of the word 'hyphenated'.

The following two quotes from TeXbook describe the process after
new search started but before
first <hyph_node> is encountered. Notice, that TeX algorithms
handle this process by default, without any changes.

    TeX continues to scan forward until coming to something
    that's not one of the following three "admissible items":
    (1) a character in font f whose \lccode is nonzero;
    (2) a ligature formed entirely from characters of type (1);
    (3) an implicit kern.
    The first inadmissible item terminates this part of the process

The first <hyph_node> is a whatsit, which is not an
"admissible item", and thus TeX behavior is the same as without
this change-file.

    Furthermore, the items immediately following the trial word must
    consist of zero or more characters, ligatures, and implicit kerns,
    followed immediately by either glue or an explicit kern or a
    penalty item or a whatsit or an item of vertical mode material
    from \mark, \insert, or \vadjust.

The first <hyph_node> immediately follows the trial word 'already'
and is a whatsit, and thus TeX behavior is the same as without
this change-file.
