Write \special in UTF-8.

@x
if (cur_length < 256)
@y
int cur_length_u8 = 0;
for (k=str_start[str_ptr]; k<=pool_ptr-1; k++) {
  char mb[MB_CUR_MAX];
  cur_length_u8 += wctomb(mb, xchr[so(str_pool[k])]);
}
if (cur_length_u8 < 256)
@z

@x
  {@+dvi_out(xxx1);dvi_out(cur_length);
@y
  {@+dvi_out(xxx1);dvi_out(cur_length_u8);
@z

@x
else{@+dvi_out(xxx4);dvi_four(cur_length);
@y
else{@+dvi_out(xxx4);dvi_four(cur_length_u8);
@z

@x
for (k=str_start[str_ptr]; k<=pool_ptr-1; k++) dvi_out(so(str_pool[k]));
@y
for (k=str_start[str_ptr]; k<=pool_ptr-1; k++) {
  char mb[MB_CUR_MAX];
  int len = wctomb(mb, xchr[so(str_pool[k])]);
  for (int i = 0; i < len; i++) dvi_out(mb[i]);
}
@z
