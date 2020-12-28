Create new dimension registers \pdfpagewidth, \pdfpageheight, \pdfhorigin
and \pdfvorigin and pass their values (taking |mag| into account) to
dvipdfm via argument list.

@x
@<Global variables@>@;
@y
@<Global variables@>@;
int ten_pow[10]; /* $10^0..10^9$ */
char pdf_buf[100];
char *pdf_ptr;
scaled one_hundred_bp; /* scaled value corresponds to 100bp */
@z

@x
@<Set initial values of key variables@>@;
@y
@<Set initial values of key variables@>@;
ten_pow[0] = 1;
for (int i = 1; i <= 9; i++)
  ten_pow[i] = 10*ten_pow[i-1];
one_hundred_bp = 6578176;
@z

This is exactly like print_int
@x
@<Basic print...@>=
@y
@<Basic print...@>=
void pdf_print_int(int @!n) /*prints an integer in decimal form*/ 
{@+uint8_t k; /*index to current digit; we assume that $|n|<10^{23}$*/ 
int @!m; /*used to negate |n| in possibly dangerous cases*/ 
k=0;
if (n < 0) 
  {  *pdf_ptr++ = '-';
  if (n > -100000000) negate(n);
  else{@+m=-1-n;n=m/10;m=(m%10)+1;k=1;
    if (m < 10) dig[0]=m;
    else{@+dig[0]=0;incr(n);
      } 
    } 
  } 
@/do@+{dig[k]=n%10;n=n/10;incr(k);
}@+ while (!(n==0));
  while (k>0) {
    decr(k);
    *pdf_ptr++ = '0'+dig[k];
  }
} 
@z

@x
@<Basic printing...@>=
@y
@<Basic printing...@>=
void pdf_print_real(int m, int d) /* print $m/10^d$ as real */
{
  if (m < 0) {
    *pdf_ptr++ = '-';
    m = -m;
  }
  pdf_print_int(m / ten_pow[d]);
  m = m % ten_pow[d];
  if (m > 0) {
    *pdf_ptr++ = '.';
    decr(d);
    while (m < ten_pow[d]) {
      *pdf_ptr++ = '0';
      decr(d);
    }
    while ((m % 10) == 0)
      m = m / 10;
    pdf_print_int(m);
  }
}

scaled divide_scaled(scaled s, scaled m, int dd) /* divide |s| by |m|; |dd| is number of decimal digits */
{
  scaled q, r;
  int sign, i;

  sign = 1;
  if (s < 0) {
    sign = -sign;
    s = -s;
  }
  if (m < 0) {
    sign = -sign;
    m = -m;
  }
  assert(m != 0); /* division by zero */
  assert(m < 2147483647 / 10); /* number too big */
         //  ( 2^31-1 ) / 10
         //   INT_MAX?
  q = s / m;
  r = s % m;
  for (int i = 1; i<= dd; i++) {
    q = 10*q + (10*r) / m;
    r = (10*r) % m;
  }
  if (2*r >= m) {
    incr(q);
    r = r - m;
  }
  return sign*q;
}

scaled round_xn_over_d(scaled x, int n, int d)
{
  bool positive; /* was |x>=0|? */
  unsigned int t,u,v; /* intermediate quantities */
  if (x>=0) positive=true;
  else {
    negate(x); positive=false;
  }
  t=(x % 0100000)*n;
  u=(x / 0100000)*n+(t / 0100000);
  v=(u % d)*0100000 + (t % 0100000);
  if ((u/d) >= 0100000) arith_error=true;
  else u=0100000*(u/d) + (v/d);
  v = v % d;
  if (2*v >= d)
    incr(u);
  if (positive)
    return u;
  else
    return -u;
}

void pdf_print_bp(scaled s)
{
  pdf_ptr = pdf_buf;
  pdf_print_real(divide_scaled(s, one_hundred_bp, 4 /*fixed_decimal_digits*/ + 2), 4 /*fixed_decimal_digits*/);
  *pdf_ptr = '\0';
}

void pdf_print_mag_bp(scaled s) /* take |mag| into account */
{
  if (mag != 1000)
    s = round_xn_over_d(s, mag, 1000);
  pdf_print_bp(s);
}
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
  execlp("xdvipdfm", "xdvipdfm", "-p", "a4", "-x", "22.45mm", "-y", "34.2mm", fname, (char *) NULL);
@y
  char pdfpagewidth[20];
  char pdfpageheight[20];
  char pdfhorigin[20];
  char pdfvorigin[20];
  char pdfpaper[40];
  pdf_print_mag_bp(pdf_page_width);
  strcpy(pdfpagewidth, pdf_buf);
  pdf_print_mag_bp(pdf_page_height);
  strcpy(pdfpageheight, pdf_buf);
  sprintf(pdfpaper, "%sbp,%sbp", pdfpagewidth, pdfpageheight);
  pdf_print_mag_bp(pdf_h_origin);
  sprintf(pdfhorigin, "%sbp", pdf_buf);
  pdf_print_mag_bp(pdf_v_origin);
  sprintf(pdfvorigin, "%sbp", pdf_buf);
  execlp("xdvipdfm", "xdvipdfm", "-p", pdfpaper, "-x", pdfhorigin, "-y", pdfvorigin, fname, (char *) NULL);
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
