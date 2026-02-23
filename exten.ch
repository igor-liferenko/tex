Add \hyphen@te control sequence which inserts hyph_node whatsit.

@x
@d language_node	4 /*|subtype| in whatsits that change the current language*/
@y
@d language_node	4 /*|subtype| in whatsits that change the current language*/
@d hyph_node 5
@z

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
case set_language_code: @<Implement \.{\\setlanguage}@>@;@+break;
@y
case set_language_code: @<Implement \.{\\setlanguage}@>@;@+break;
case hyphenate_code: new_whatsit(hyph_node, small_node_size); break;
@z

@x
case close_node: case language_node: {@+r=get_node(small_node_size);
@y
case close_node: case language_node: case hyph_node: {@+r=get_node(small_node_size);
@z

@x
case close_node: case language_node: free_node(p, small_node_size);@+break;
@y
case close_node: case language_node: case hyph_node: free_node(p, small_node_size);@+break;
@z

@x
case language_node: do_nothing;@+break;
@y
case language_node: case hyph_node: do_nothing;@+break;
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
