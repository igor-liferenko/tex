Add dimension parameters \pdfpagewidth, \pdfpageheight, \pdfhorigin, \pdfvorigin

@x
@d dimen_pars	21 /*total number of dimension parameters*/
@y
@d pdf_page_width_code 21
@d pdf_page_height_code 22
@d pdf_h_origin_code 23
@d pdf_v_origin_code 24
@d dimen_pars 25 /*total number of dimension parameters*/
@z

@x
@d emergency_stretch	dimen_par(emergency_stretch_code)
@y
@d emergency_stretch	dimen_par(emergency_stretch_code)
@d pdf_page_width dimen_par(pdf_page_width_code)
@d pdf_page_height dimen_par(pdf_page_height_code)
@d pdf_h_origin dimen_par(pdf_h_origin_code)
@d pdf_v_origin dimen_par(pdf_v_origin_code)
@z

@x
case emergency_stretch_code: print_esc(@[@<|"emergencystretch"|@>@]);@+break;
@y
case emergency_stretch_code: print_esc(@[@<|"emergencystretch"|@>@]);@+break;
case pdf_page_width_code: print_esc(@<"pdfpagewidth"@>);break;
case pdf_page_height_code: print_esc(@<"pdfpageheight"@>);break;
case pdf_h_origin_code: print_esc(@<"pdfhorigin"@>);break;
case pdf_v_origin_code: print_esc(@<"pdfvorigin"@>);break;
@z

@x
primitive(@[@<|"emergencystretch"|@>@], assign_dimen, dimen_base+emergency_stretch_code);@/
@y
primitive(@[@<|"emergencystretch"|@>@], assign_dimen, dimen_base+emergency_stretch_code);@/
primitive(@<"pdfpagewidth"@>, assign_dimen, dimen_base+pdf_page_width_code);
primitive(@<"pdfpageheight"@>, assign_dimen, dimen_base+pdf_page_height_code);
primitive(@<"pdfhorigin"@>, assign_dimen, dimen_base+pdf_h_origin_code);
primitive(@<"pdfvorigin"@>, assign_dimen, dimen_base+pdf_v_origin_code);
@z
