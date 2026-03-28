@x
{ if ((k&0xF)==0) wputs("\t\"");
@y
{ if ((k&0xF)==0) wputs("  \"");
@z

@x
{ if ((k&0xF)==0) wput('\t');
@y
{ if ((k&0xF)==0) wputs("  ");
@z

@x
{ wput('\t');
@y
{ wput(' ');
@z

@x
        wput('\t');
@y
        wput(' ');
@z

@x
  wput('('),wputs(param),wputs(")\t"), t=eq->next;
@y
  wput('('),wputs(param),wputs(") "), t=eq->next;
@z
