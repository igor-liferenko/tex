Add \hyphen@te primitive.

@x
@d set_language_code	5 /*command modifier for \.{\\setlanguage}*/
@y
@d set_language_code	5 /*command modifier for \.{\\setlanguage}*/
@d hyphenate_code 6
@z

@x
@!@:set_language_}{\.{\\setlanguage} primitive@>
@y
@!@:set_language_}{\.{\\setlanguage} primitive@>
primitive(@<|"hyphen@@te"|@>, extension, hyphenate_code);
@z

@x
@<|"pdfvorigin"|@>=@+671
@y
@<|"pdfvorigin"|@>=@+671
@ @d str_672 "hyphen@@te"
@<|"hyphen@@te"|@>=@+672
@z

@x
str_664 str_665 str_666 str_667 str_668 str_669 str_670 str_671
@y
str_664 str_665 str_666 str_667 str_668 str_669 str_670 str_671 str_672
@z

@x
str_start_668, str_start_669, str_start_670, str_start_671, str_start_672
@y
str_start_668, str_start_669, str_start_670, str_start_671, str_start_672, str_start_673
@z

@x
str_start_672=str_start_671+sizeof(str_671)-1,@/
@y
str_start_672=str_start_671+sizeof(str_671)-1,@/
str_start_673=str_start_672+sizeof(str_672)-1,@/
@z

@x
@ @<|pool_ptr| initialization@>= str_start_672
@y
@ @<|pool_ptr| initialization@>= str_start_673
@z

@x
@ @<|str_ptr| initialization@>= 672
@y
@ @<|str_ptr| initialization@>= 673
@z
