Hyphenate already-hyphenated words (uses hyph_node whatsit, added in exten.ch)

The whole purpose of hyph_node and of this change-file is that spurious
space is not printed in warning messages. Compare terminal outputs and log-files:

    \hsize=100pt
    \hskip0pt already\kern0pt-\nobreak\hskip0pt hyphenated
    \bye

with

    \hsize=100pt
    \hskip0pt already\kern0pt-\hyphenate hyphenated
    \bye

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

Let us use the word 'already-hyphenated' to show why
hyphenation of compound words does not work in original TeX.
First, TeX reaches the hyphen, which is an inadmissible item
(a character whose \lccode is zero). The trial word is thus
'already'. The items immediately following the trial word
are hyphen (a character) and automatically inserted empty
discretionary. The discretionary is not allowed, and
hyphenation is canceled. New search cannot be started from
a hyphen, therefore hyphenation of 'hyphenated' is not tried.

To allow hyphenation of compound words, we need to alter the
part of hyphenation algorithm, described on p.454 of TeXbook:

    TeX looks for potentially hyphenatable words by searching
    ahead from each glue item that is not in a math formula.

This change-file does this alteration: in addition to glue,
the search is also started from hyph_node.

Let's see how the modified hyphenation algorithm will behave
when it encounters hyph_node. We will use the word
'already-hyphenated' as an example, but with the hyphen
changed into '\kern0pt-\hyphenate '.

So, new search is started. Here is what unfolds:

    The search bypasses characters whose \lccode is zero, or
    ligatures that begin with such characters; it also bypasses
    whatsits and implicit kern items, i.e., kerns that were
    inserted by TeX itself because of information stored with
    the font.

Nothing is bypassed.

    If the search finds a character with nonzero \lccode, or if
    it finds a ligature that begins with such a character, that
    character is called the starting letter. But if any other
    type of item occurs before a suitable starting letter is
    found, hyphenation is abandoned (until after the next glue item).

'a' is the starting letter.

    TeX continues to scan forward until coming to something
    that's not one of the following three "admissible items":
    (1) a character in font f whose \lccode is nonzero;
    (2) a ligature formed entirely from characters of type (1);
    (3) an implicit kern.
    The first inadmissible item terminates this part of the process

The search is terminated on \kern0pt, because it is
an explicit kern, and thus not an "admissible item". Then:

    Furthermore, the items immediately following the trial word must
    consist of zero or more characters, ligatures, and implicit kerns,
    followed immediately by either glue or an explicit kern or a
    penalty item or a whatsit or an item of vertical mode material
    from \mark, \insert, or \vadjust.

The item immediately following the trial word 'already' is \kern0pt
(an explicit kern).

So, hyphenation of 'already' is tried.

New search is started from \hyphenate.
From this point on, the algorithm proceeds normally.
