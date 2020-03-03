NOTE: paths must contain only ASCII characters (but file names may be UTF-8) - TeXfonts and TeXinputs paths because web2w doesn't use pool-file, TeXformats can contain UTF-8 characters (see how was before commit 46b79190) but for uniformity with TeXfonts and TeXinputs paths it can not

!!! if need more, change type of |name_length| from uint8_t to uint16_t in tex.w !!!
pool_name does not need to be updated because
pool is not used (get_strings_started() is not called)
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
ASCII_code @!TEX_format_default[1+format_default_length+1]=" TeXformats/plain.fmt";
@y
ASCII_code @!TEX_format_default[1+format_default_length+1]=" /home/user/ctex/TeXformats/plain.fmt";
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
