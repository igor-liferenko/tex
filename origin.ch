Create new dimension registers \pdfpagewidth, \pdfpageheight, \pdfhorigin and \pdfvorigin.

@x
@h
@y
#include <inttypes.h>
@h
@z

@x
@d dimen_pars	21 /*total number of dimension parameters*/ 
@y
@d pdf_page_width_code 21
@d pdf_page_height_code 22
@d pdf_h_origin_code 23
@d pdf_v_origin_code 24
@d dimen_pars	25 /*total number of dimension parameters*/ 
@z

@x
@d emergency_stretch	dimen_par(emergency_stretch_code)
@y
@d emergency_stretch  dimen_par(emergency_stretch_code)
@d pdf_page_width     dimen_par(pdf_page_width_code)
@d pdf_page_height    dimen_par(pdf_page_height_code)
@d pdf_h_origin       dimen_par(pdf_h_origin_code)
@d pdf_v_origin       dimen_par(pdf_v_origin_code)
@z
  
@x
case emergency_stretch_code: print_esc(@[@<|"emergencystretch"|@>@]);@+break;
@y
case emergency_stretch_code: print_esc(@[@<|"emergencystretch"|@>@]);@+break;
case pdf_page_width_code:    print_esc(@[@<|"pdfpagewidth"|@>@]);@+break;
case pdf_page_height_code:   print_esc(@[@<|"pdfpageheight"|@>@]);@+break;
case pdf_h_origin_code:    print_esc(@[@<|"pdfhorigin"|@>@]);@+break;
case pdf_v_origin_code:   print_esc(@[@<|"pdfvorigin"|@>@]);@+break;
@z

@x
@!@:emergency_stretch_}{\.{\\emergencystretch} primitive@>
@y
@!@:emergency_stretch_}{\.{\\emergencystretch} primitive@>
primitive(@[@<|"pdfpagewidth"|@>@], assign_dimen, dimen_base+pdf_page_width_code);@/
@!@:pdf_page_width_}{\.{\\pdfpagewidth} primitive@>
primitive(@[@<|"pdfpageheight"|@>@], assign_dimen, dimen_base+pdf_page_height_code);@/
@!@:pdf_page_height_}{\.{\\pdfpageheight} primitive@>
primitive(@[@<|"pdfhorigin"|@>@], assign_dimen, dimen_base+pdf_h_origin_code);@/
@!@:pdf_h_origin_}{\.{\\pdfhorigin} primitive@>
primitive(@[@<|"pdfvorigin"|@>@], assign_dimen, dimen_base+pdf_v_origin_code);@/
@!@:pdf_v_origin_}{\.{\\pdfvorigin} primitive@>
@z

@x
    execlp("dvipdfm", "dvipdfm", "-p", "a4", "-x", "22.45mm", "-y", "34.2mm", fname, (char *) NULL);
@y
    char pdfpaper[50];
    sprintf(pdfpaper, "%"PRId64"sp,%"PRId64"sp", (int64_t)pdf_page_width*mag/1000, (int64_t)pdf_page_height*mag/1000);
    char pdfhorigin[50];
    sprintf(pdfhorigin, "%"PRId64"sp", (int64_t)pdf_h_origin*mag/1000);
    char pdfvorigin[50];
    sprintf(pdfvorigin, "%"PRId64"sp", (int64_t)pdf_v_origin*mag/1000);
    execlp("dvipdfm", "dvipdfm", "-p", pdfpaper, "-x", pdfhorigin, "-y", pdfvorigin, fname, (char *) NULL);
@z

@x
@<|"ext4"|@>=@+667
@y
@<|"ext4"|@>=@+667
@ 
@d str_668 "pdfpagewidth"
@<|"pdfpagewidth"|@>=@+668
@
@d str_669 "pdfpageheight"
@<|"pdfpageheight"|@>=@+669
@
@d str_670 "pdfhorigin"
@<|"pdfhorigin"|@>=@+670
@
@d str_671 "pdfvorigin"
@<|"pdfvorigin"|@>=@+671
@z

@x
str_664 str_665 str_666 str_667 
@y
str_664 str_665 str_666 str_667 str_668 str_669 str_670 str_671
@z

@x
str_start_668
@y
str_start_668, str_start_669, str_start_670, str_start_671, str_start_672
@z

@x
str_start_end } str_starts;
@y
str_start_669=str_start_668+sizeof(str_668)-1,@/
str_start_670=str_start_669+sizeof(str_669)-1,@/
str_start_671=str_start_670+sizeof(str_670)-1,@/
str_start_672=str_start_671+sizeof(str_671)-1,@/
str_start_end } str_starts;
@z

@x
@ @<|pool_ptr| initialization@>= str_start_668
@y
@ @<|pool_ptr| initialization@>= str_start_672
@z

@x 
@ @<|str_ptr| initialization@>= 668
@y
@ @<|str_ptr| initialization@>= 672
@z
