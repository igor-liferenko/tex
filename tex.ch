TODO: check on web2c-tex repo as it was before 2020 and in mytex repo if they need the
same change to generate lhplain format and if yes, remove this TODO, and if no,
understand what it does
@x
enum {@+@!font_mem_size=20000@+}; /*number of words of |font_info| for all fonts*/
@y
enum {@+@!font_mem_size=30000@+}; /*number of words of |font_info| for all fonts*/
@z

@x
enum {@+@!trie_size=8000@+}; /*space for hyphenation patterns; should be larger for
@y
enum {@+@!trie_size=14000@+}; /*space for hyphenation patterns; should be larger for
@z

@x
@d format_default_length	20 /*length of the |TEX_format_default| string*/
@d format_area_length	11 /*length of its area part*/
@y
@d format_default_length	36 /*length of the |TEX_format_default| string*/
@d format_area_length	27 /*length of its area part*/
@z

@x
wchar_t @!TEX_format_default[1+format_default_length+1]=L" TeXformats/plain.fmt";
@y
wchar_t @!TEX_format_default[1+format_default_length+1]=L" /home/user/ctex/TeXformats/plain.fmt";
@z
