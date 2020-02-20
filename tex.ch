withouth this setup-tarif.tex will not compile
@x
enum {@+@!buf_size=500@+}; /*maximum number of characters simultaneously present in
  current lines of open files and in control sequences between
  \.{\\csname} and \.{\\endcsname}; must not exceed |max_halfword|*/
@y
enum {@+@!buf_size=3000@+}; /*maximum number of characters simultaneously present in
  current lines of open files and in control sequences between
  \.{\\csname} and \.{\\endcsname}; must not exceed |max_halfword|*/
@z

this is necessary for lhplain format
@x
enum {@+@!font_mem_size=20000@+}; /*number of words of |font_info| for all fonts*/
@y
enum {@+@!font_mem_size=30000@+}; /*number of words of |font_info| for all fonts*/
@z

this is necessary for lhplain format
@x
enum {@+@!trie_size=8000@+}; /*space for hyphenation patterns; should be larger for
  \.{INITEX} than it is in production versions of \TeX*/
@y
#ifdef INIT
enum {@+@!trie_size=14000@+}; /*space for hyphenation patterns; should be larger for
  \.{INITEX} than it is in production versions of \TeX*/
#else
enum {@+@!trie_size=6500@+}; /*space for hyphenation patterns; should be larger for
  \.{INITEX} than it is in production versions of \TeX*/
#endif
@z

!!! if need more, change type of |name_length| from uint8_t to int in tex.w !!!
@x
enum {@+@!file_name_size=40@+}; /*file names shouldn't be longer than this*/
@y
enum {@+@!file_name_size=255@+}; /*file names shouldn't be longer than this*/
@z

print newline
@x
    write(term_out,L"! End of file on the terminal... why?");
@y
    write_ln(term_out,L"! End of file on the terminal... why?");
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [51.1333] print new line before termination; switch to editor if nec.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
@x
    slow_print(log_name);print_char('.');
    }
  }
@y
    slow_print(log_name);print_char('.');
    }
  }
  print_ln();
/*
  if (ed_name_start<>0) and (interaction>batch_mode) then
    calledit(str_pool[ed_name_start],ed_name_length,edit_line);
*/
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
