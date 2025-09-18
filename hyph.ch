Hyphenate already\hyphen@te-\hyphen@te hyphenated words.

@x
  case unset_node: print_str("[]");@+break;
@y
  case unset_node: if (!(type(p)==whatsit_node && subtype(p)==hyph_node)) print_str("[]");@+break;
@z

@x
case whatsit_node: @<Advance \(p)past a whatsit node in the \(l)|line_break| loop@>@;@+break;
@y
case whatsit_node: @<Advance \(p)past a whatsit node in the \(l)|line_break| loop@>@;
if (subtype(cur_p)==hyph_node) goto try_hyph;
break;
@z

@x
  if (second_pass&&auto_breaking)
@y
 try_hyph:
  if (second_pass&&auto_breaking)
@z

@x
@d language_node	4 /*|subtype| in whatsits that change the current language*/
@y
@d language_node        4 /*|subtype| in whatsits that change the current language*/
@d hyph_node 5
@z

@x
@d set_language_code	5 /*command modifier for \.{\\setlanguage}*/
@y
@d set_language_code    5 /*command modifier for \.{\\setlanguage}*/
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
@<|"ext4"|@>=@+667
@y
@<|"ext4"|@>=@+667
@ 
@d str_668 "hyphen@@te"
@<|"hyphen@@te"|@>=@+668
@z

@x
str_664 str_665 str_666 str_667
@y
str_664 str_665 str_666 str_667 str_668
@z

@x
str_start_668
@y
str_start_668, str_start_669
@z

@x
str_start_668=str_start_667+sizeof(str_667)-1,@/
@y
str_start_668=str_start_667+sizeof(str_667)-1,@/
str_start_669=str_start_668+sizeof(str_668)-1,@/
@z

@x
@ @<|pool_ptr| initialization@>= str_start_668
@y
@ @<|pool_ptr| initialization@>= str_start_669
@z

@x 
@ @<|str_ptr| initialization@>= 668
@y
@ @<|str_ptr| initialization@>= 669
@z
