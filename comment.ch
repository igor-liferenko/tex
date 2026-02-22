Append values of \pdfpagewidth, \pdfpageheight, \pdfhorigin and \pdfvorigin to DVI comment.

@x
@h
@y
#include <inttypes.h>
@h
@z

@x
  print_two(time_of_day%60);
@y
  print_two(time_of_day%60); print_char(' ');
  char origin[50];
  sprintf(origin, "%"PRId64, (int64_t) pdf_page_width * mag / 1000);
  print_str(origin); print_char('x');
  sprintf(origin, "%"PRId64, (int64_t) pdf_page_height * mag / 1000);
  print_str(origin);
  sprintf(origin, "%+"PRId64, (int64_t) pdf_h_origin * mag / 1000);
  print_str(origin);
  sprintf(origin, "%+"PRId64, (int64_t) pdf_v_origin * mag / 1000);
  print_str(origin);
@z
