Hyphenate already-hyphenated words (uses hyph_node whatsit, added in exten.ch)

The whole purpose of hyph_node is to print [] instead of space in warning messages.
Compare terminal outputs and log-files of the following examples:

    \hsize=100pt
    \hskip0pt already\nobreak\hskip0pt-\nobreak\hskip0pt hyphenated
    \bye

with

    \hsize=100pt
    \hskip0pt already\hyphen@te-\hyphen@te hyphenated
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

Let's see how the modified hyphenation algorithm will behave
when it encounters hyph_node. We will use the word
'already-hyphenated' as an example, but with the hyphen
surrounded by \hyphen@te; keep in mind that empty discretionary
is sitting between hyphen and second \hyphen@te.

    TeX looks for potentially hyphenatable words by searching
    ahead from each glue item that is not in a math formula.

So, new search is started.

 (*)The search bypasses characters whose \lccode is zero, or
    ligatures that begin with such characters; it also bypasses
    whatsits and implicit kern items, i.e., kerns that were
    inserted by TeX itself because of information stored with
    the font.

Nothing is bypassed.

(**)If the search finds a character with nonzero \lccode, or if
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

The search is terminated on \hyphen@te, because it is
an explicit kern, and thus not an "admissible item". Then:

    Furthermore, the items immediately following the trial word must
    consist of zero or more characters, ligatures, and implicit kerns,
    followed immediately by either glue or an explicit kern or a
    penalty item or a whatsit or an item of vertical mode material
    from \mark, \insert, or \vadjust.

The item immediately following the trial word 'already' is \hyphen@te
(a whatsit).

So, hyphenation of 'already' is tried.

New search is started from \hyphen@te.
From this point on, the algorithm proceeds normally.
