Add dimension parameters \pdfpagewidth, \pdfpageheight, \pdfhorigin, \pdfvorigin.
Append their values to DVI comment (changes marked with <<<<<< and >>>>>>).

@x <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
@h
@y
#include <inttypes.h>
@h
#define print_str(X) for (char *p = X; *p!='\0'; p++) print_char(*p)
@z >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

@x
@d dimen_pars 21 /*total number of dimension parameters*/
@y
@d pdf_page_width_code 21
@d pdf_page_height_code 22
@d pdf_h_origin_code 23
@d pdf_v_origin_code 24
@d dimen_pars 25 /*total number of dimension parameters*/
@z

@x
@d emergency_stretch dimen_par(emergency_stretch_code)
@y
@d emergency_stretch dimen_par(emergency_stretch_code)
@d pdf_page_width dimen_par(pdf_page_width_code)
@d pdf_page_height dimen_par(pdf_page_height_code)
@d pdf_h_origin dimen_par(pdf_h_origin_code)
@d pdf_v_origin dimen_par(pdf_v_origin_code)
@z

@x
case emergency_stretch_code: print_esc(@<|"emergencystretch"|@>);@+break;
@y
case emergency_stretch_code: print_esc(@<|"emergencystretch"|@>);@+break;
case pdf_page_width_code: print_esc(pdfpagewidth_str);break;
case pdf_page_height_code: print_esc(pdfpageheight_str);break;
case pdf_h_origin_code: print_esc(pdfhorigin_str);break;
case pdf_v_origin_code: print_esc(pdfvorigin_str);break;
@z

@x
primitive(@<|"emergencystretch"|@>, assign_dimen, dimen_base+emergency_stretch_code);@/
@y
primitive(@<|"emergencystretch"|@>, assign_dimen, dimen_base+emergency_stretch_code);@/
primitive(pdfpagewidth_str, assign_dimen, dimen_base+pdf_page_width_code);
primitive(pdfpageheight_str, assign_dimen, dimen_base+pdf_page_height_code);
primitive(pdfhorigin_str, assign_dimen, dimen_base+pdf_h_origin_code);
primitive(pdfvorigin_str, assign_dimen, dimen_base+pdf_v_origin_code);
@z

@x <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  print_two(time_of_day%60);
@y
  print_two(time_of_day%60); print_char(' ');
  char origin[50];
  sprintf(origin, "%"PRId64, (int64_t) pdf_page_width * mag / 1000);
  print_str(origin);
  print_char('x');
  sprintf(origin, "%"PRId64, (int64_t) pdf_page_height * mag / 1000);
  print_str(origin);
  sprintf(origin, "%+"PRId64, (int64_t) pdf_h_origin * mag / 1000);
  print_str(origin);
  sprintf(origin, "%+"PRId64, (int64_t) pdf_v_origin * mag / 1000);
  print_str(origin);
@z >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

===== Add "pdfpagewidth", "pdfpageheight", "pdfhorigin" and "pdfvorigin" to string pool: =====

@x
@d TEX_area_short 1301
@y
@d TEX_area_short 1301
@ @d str_1302 "pdfpagewidth"
@d pdfpagewidth_str 1302
@ @d str_1303 "pdfpageheight"
@d pdfpageheight_str 1303
@ @d str_1304 "pdfhorigin"
@d pdfhorigin_str 1304
@ @d str_1305 "pdfvorigin"
@d pdfvorigin_str 1305
@z

@x
str_1296 str_1297 str_1298 str_1299 str_1300 str_1301
@y
str_1296 str_1297 str_1298 str_1299 str_1300 str_1301
str_1302 str_1303 str_1304 str_1305
@z

@x
str_start_1300, str_start_1301, str_start_1302
@y
str_start_1300, str_start_1301, str_start_1302, str_start_1303,
str_start_1304, str_start_1305, str_start_1306
@z

@x
str_start_1302=str_start_1301+sizeof(str_1301)-1,
@y
str_start_1302=str_start_1301+sizeof(str_1301)-1,
str_start_1303=str_start_1302+sizeof(str_1302)-1,
str_start_1304=str_start_1303+sizeof(str_1303)-1,
str_start_1305=str_start_1304+sizeof(str_1304)-1,
str_start_1306=str_start_1305+sizeof(str_1305)-1,
@z

@x
@ @<|pool_ptr| initialization@>= str_start_1302
@y
@ @<|pool_ptr| initialization@>= str_start_1306
@z

@x
@ @<|str_ptr| initialization@>= 1302
@y
@ @<|str_ptr| initialization@>= 1306
@z
