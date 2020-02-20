TODO: make that newlines will be printed where necessary
-------------------

withouth this setup-tarif.tex will not compile
@x
enum {@+@!buf_size=500@+}; /*maximum number of characters simultaneously present in
@y
enum {@+@!buf_size=3000@+}; /*maximum number of characters simultaneously present in
@z

TODO: check on web2c-tex repo as it was before 2020 and in mytex repo if they need the
same change to generate lhplain format and if yes, remove this TODO, and if no,
understand what it does
@x
enum {@+@!font_mem_size=20000@+}; /*number of words of |font_info| for all fonts*/
@y
enum {@+@!font_mem_size=30000@+}; /*number of words of |font_info| for all fonts*/
@z

this is necessary for lhplain format
@x
enum {@+@!trie_size=8000@+}; /*space for hyphenation patterns; should be larger for
@y
enum {@+@!trie_size=14000@+}; /*space for hyphenation patterns; should be larger for
@z

!!! if need more, change type of |name_length| from uint8_t to int in tex.w !!!
@x
enum {@+@!file_name_size=40@+}; /*file names shouldn't be longer than this*/
@y
enum {@+@!file_name_size=255@+}; /*file names shouldn't be longer than this*/
@z

use absolute path
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

make that /home/user/ctex/ prefix will not be displayed
@x
else{@+for (k=1; k<=name_length; k++) {
@y
else{@+
k=1;
if (strncmp(name_of_file+1,"/home/user/ctex/TeXinputs/",name_length>26?26:name_length)==0) k=17;
for (; k<=name_length; k++) {
@z

use absolute paths
@x
@d str_506 "TeXinputs/"
@y
@d str_506 "/home/user/ctex/TeXinputs/"
@z
@x
@d str_507 "TeXfonts/"
@y
@d str_507 "/home/user/ctex/TeXfonts/"
@z
