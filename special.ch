@x
void special_out(pointer @!p)
@y
int cur_length_u8(void)
{
  int len = 0;
  for (int k=str_start[str_ptr]; k<=pool_ptr-1; k++) {
    char mb[MB_CUR_MAX];
    len += wctomb(mb, xchr[str_pool[k]]);
  }
  return len;
}
void special_out(pointer @!p)
@z

@x
if (cur_length < 256)
@y
if (cur_length_u8() < 256)
@z

@x
  {@+dvi_out(xxx1);dvi_out(cur_length);
@y
  {@+dvi_out(xxx1);dvi_out(cur_length_u8());
@z

@x
else{@+dvi_out(xxx4);dvi_four(cur_length);
@y
else{@+dvi_out(xxx4);dvi_four(cur_length_u8());
@z

@x
for (k=str_start[str_ptr]; k<=pool_ptr-1; k++) dvi_out(so(str_pool[k]));
@y
for (k=str_start[str_ptr]; k<=pool_ptr-1; k++) {
  char mb[MB_CUR_MAX];
  int len = wctomb(mb, xchr[str_pool[k]]);
  for (int i = 0; i < len; i++) dvi_out(mb[i]);
}
@z
