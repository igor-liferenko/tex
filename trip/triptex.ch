@x
enum {@+@!mem_max=30000@+};
@y
enum {@+@!mem_max=3000@+};
@z

@x
enum {@+@!mem_min=0@+}; /*smallest index in \TeX's internal |mem| array;
@y
enum {@+@!mem_min=1@+}; /*smallest index in \TeX's internal |mem| array;
@z

@x
enum {@+@!buf_size=3000@+};
@y
enum {@+@!buf_size=500@+};
@z

@x
enum {@+@!error_line=72@+}; /*width of context lines on terminal error messages*/
enum {@+@!half_error_line=42@+}; /*width of first lines of contexts in terminal
@y
enum {@+@!error_line=64@+}; /*width of context lines on terminal error messages*/
enum {@+@!half_error_line=32@+}; /*width of first lines of contexts in terminal
@z

@x
enum {@+@!max_print_line=79@+}; /*width of longest text lines output; should be at least 60*/
@y
enum {@+@!max_print_line=72@+}; /*width of longest text lines output; should be at least 60*/
@z

@x
enum {@+@!font_mem_size=30000@+};
@y
enum {@+@!font_mem_size=20000@+};
@z

@x
enum {@+@!trie_size=14000@+};
@y
enum {@+@!trie_size=8000@+};
@z

@x
@d mem_bot	0 /*smallest index in the |mem| array dumped by \.{INITEX};
@y
@d mem_bot	1 /*smallest index in the |mem| array dumped by \.{INITEX};
@z

@x
@d mem_top	30000 /*largest index in the |mem| array dumped by \.{INITEX};
@y
@d mem_top	3000 /*largest index in the |mem| array dumped by \.{INITEX};
@z
