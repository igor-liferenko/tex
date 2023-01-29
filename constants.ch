@x
enum {@+@!mem_max=30000@+}; /*greatest index in \TeX's internal |mem| array;
  must be strictly less than |max_halfword|;
  must be equal to |mem_top| in \.{INITEX}, otherwise | >= mem_top|*/ 
@y
enum {@+@!mem_max=65534@+};
@z

@x
enum {@+@!buf_size=500@+}; /*maximum number of characters simultaneously present in
  current lines of open files and in control sequences between
  \.{\\csname} and \.{\\endcsname}; must not exceed |max_halfword|*/
@y
enum {@+@!buf_size=3000@+};
@z

@x
enum {@+@!font_mem_size=20000@+}; /*number of words of |font_info| for all fonts*/
@y
enum {@+@!font_mem_size=30000@+};
@z

@x
enum {@+@!trie_size=8000@+}; /*space for hyphenation patterns; should be larger for
  \.{INITEX} than it is in production versions of \TeX*/
@y
#ifdef INIT
enum {@+@!trie_size=15000@+};
#else
enum {@+@!trie_size=8000@+};
#endif
@z

@x
@d mem_top	30000 /*largest index in the |mem| array dumped by \.{INITEX};
  must be substantially larger than |mem_bot|
  and not greater than |mem_max|*/ 
@y
@d mem_top      65534
@z
