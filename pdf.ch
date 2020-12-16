@x
   /*open a binary file for output*/ 
{@+rewrite((*f), name_of_file,"wb");return rewrite_OK((*f));
@y
{ char cmd[500];
  strcpy(cmd, "dvipdfm -q -o ");
  strcat(cmd, name_of_file+1);
  f->f = popen(cmd, "w");
  return f->f != NULL;
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
