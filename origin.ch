@x
  assert(snprintf(pdf, sizeof pdf, "dvipdfm -q -p a4 -x 22.45mm -y 34.2mm -o %s", name_of_file+1) < sizeof pdf);
@y
  assert(snprintf(pdf, sizeof pdf, "dvipdfm -q -p a4 %s -x 0pt -y 0pt -o %s",
    pdf_page_width > pdf_page_height ? "-l" : "", name_of_file+1) < sizeof pdf);
@z

@x
dvi_h=0;dvi_v=0;cur_h=h_offset;dvi_f=null_font;
@y
dvi_h=0;dvi_v=0;cur_h=pdf_h_origin+h_offset;dvi_f=null_font;
@z

@x
cur_v=height(p)+v_offset;temp_ptr=p;
@y
cur_v=height(p)+pdf_v_origin+v_offset;temp_ptr=p;
@z

@x
   (height(p)+depth(p)+v_offset > max_dimen)||@|
@y
   (height(p)+depth(p)+pdf_v_origin+v_offset > max_dimen)||@|
@z

@x
   (width(p)+h_offset > max_dimen))
@y
   (width(p)+pdf_h_origin+h_offset > max_dimen)) 
@z

@x
if (height(p)+depth(p)+v_offset > max_v) max_v=height(p)+depth(p)+v_offset;
@y
if (height(p)+depth(p)+pdf_v_origin+v_offset > max_v) max_v=height(p)+depth(p)+pdf_v_origin+v_offset;
@z

@x
if (width(p)+h_offset > max_h) max_h=width(p)+h_offset
@y
if (width(p)+pdf_h_origin+h_offset > max_h) max_h=width(p)+pdf_h_origin+h_offset
@z
