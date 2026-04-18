# CWEB does not allow @<...@> to be used in replacement text of @d.
# This is the case for modules, into which web2w converts strings listed
# in this script. Therefore, we convert these modules into string numbers.
s#@d str_\(.*\) \("pool size"\)#/@d str_room
s#@d str_\(.*\) \("! "\)#/@d print_err
s#@d str_\(.*\) \("save size"\)#/@d check_full_save_stack
s#@d str_\(.*\) \("input stack size"\)#/@d push_input
s#@d str_\(.*\) \(".dvi"\)#/@d ensure_dvi_open
s#@d str_\(.*\) \("file name for output"\)#/@d ensure_dvi_open
s#@d str_\(.*\) \("Font "\)#/@d start_font_error_message
s#@d str_\(.*\) \(" at "\)#/@d start_font_error_message
s#@d str_\(.*\) \("pt"\)#/@d start_font_error_message
s#@d str_\(.*\) \(" scaled "\)#/@d start_font_error_message
s#@d str_\(.*\) \(" plus "\)#/@d print_plus
