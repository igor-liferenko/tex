@x
if (cur_length < 256) 
  {@+dvi_out(xxx1);dvi_out(cur_length);
  } 
else{@+dvi_out(xxx4);dvi_four(cur_length);
  } 
for (k=str_start[str_ptr]; k<=pool_ptr-1; k++) dvi_out(so(str_pool[k]));
@y  
int cur_length_mb = 0;
char mb[MB_CUR_MAX];
for (k=str_start[str_ptr]; k<=pool_ptr-1; k++)
  cur_length_mb += wctomb(mb, xchr[str_pool[k]]);
if (cur_length_mb < 256) 
  {@+dvi_out(xxx1);dvi_out(cur_length_mb);
  } 
else{@+dvi_out(xxx4);dvi_four(cur_length_mb);
  }
for (k=str_start[str_ptr]; k<=pool_ptr-1; k++) {
  int len = wctomb(mb, xchr[str_pool[k]]);
  for (int i = 0; i < len; i++) dvi_out(mb[i]);
}
@z
