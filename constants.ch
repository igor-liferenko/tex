@x
enum {@+@!mem_max=30000@+}; /*greatest index in \TeX's internal |mem| array;
  must be strictly less than |max_halfword|;
  must be equal to |mem_top| in \.{INITEX}, otherwise | >= mem_top|*/ 
@y
#ifdef INIT
enum {@+@!mem_max=mem_top@+};
#else
enum { mem_max = 30000 };
#endif
@z

@x
enum {@+@!mem_min=0@+}; /*smallest index in \TeX's internal |mem| array;
  must be |min_halfword| or more;
  must be equal to |mem_bot| in \.{INITEX}, otherwise | <= mem_bot|*/ 
@y
#ifdef INIT
enum {@+@!mem_min=mem_bot@+};
#else
enum {@+@!mem_min=0@+};
#endif
@z

@x
enum {@+@!font_mem_size=20000@+}; /*number of words of |font_info| for all fonts*/
@y
enum { font_mem_size = 20000 };
@z

@x
enum {@+@!trie_size=8000@+}; /*space for hyphenation patterns; should be larger for
  \.{INITEX} than it is in production versions of \TeX*/
@y
enum { trie_size = 8000 };
@z

@x
@d mem_bot	0 /*smallest index in the |mem| array dumped by \.{INITEX};
  must not be less than |mem_min|*/ 
@y
@d mem_bot 0
@z

@x
@d mem_top	30000 /*largest index in the |mem| array dumped by \.{INITEX};
  must be substantially larger than |mem_bot|
  and not greater than |mem_max|*/ 
@y
@d mem_top 30000
@z
