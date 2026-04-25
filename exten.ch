Add \hyphen@te control sequence, which inserts hyph_node whatsit (used in hyph.ch),
which does not manifest itself in output to terminal and log file.

Skip over the whatsit in warning messages.
@x
while (p > mem_min)
@y
while (p > mem_min) if (type(p)==whatsit_node && subtype(p)==hyph_node) p=link(p); else
@z

Skip over the whatsit in output of \showlists
@x
while (p > mem_min)
@y
while (p > mem_min) if (type(p)==whatsit_node && subtype(p)==hyph_node) p=link(p); else
@z

@x
@d language_node 4 /*|subtype| in whatsits that change the current language*/
@y
@d language_node 4 /*|subtype| in whatsits that change the current language*/
@d hyph_node 5
@z

@x
@d set_language_code 5 /*command modifier for \.{\\setlanguage}*/
@y
@d set_language_code 5 /*command modifier for \.{\\setlanguage}*/
@d hyphenate_code 6
@z

@x
@!@:set_language_}{\.{\\setlanguage} primitive@>
@y
@!@:set_language_}{\.{\\setlanguage} primitive@>
primitive(hyphenate_str, extension, hyphenate_code);
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
