@x
   /*open a binary file for output*/ 
{@+rewrite((*f), name_of_file,"wb");return rewrite_OK((*f));
@y
{ char cmd[500];
  strcpy(cmd, "dvipdfm -q -p a4 -x 22.45mm -y 34.2mm -o ");
  strcat(cmd, name_of_file+1);
  f->f = popen(cmd, "w");
  return f->f != NULL;
@z

???
 @x
dvi_out(eop);incr(total_pages);cur_s=-1;
 @y
dvi_out(eop);incr(total_pages);cur_s=-1;
fflush(dvi_file.f);
 @z

@x
  b_close(&dvi_file);
@y
  assert(pclose(dvi_file.f) == 0);
@z

@x
@d str_510 ".dvi"
@y
@d str_510 ".pdf"
@z
