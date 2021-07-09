@x
void print_nl(char *@!s) /*prints string |s| at beginning of line*/ 
{@+if (((term_offset > 0)&&(odd(selector)))||@|
  ((file_offset > 0)&&(selector >= log_only))) print_ln();
print_str(s);
} 
@y
void print_nl(char *@!s) /*prints string |s| at beginning of line*/ 
{
  if (
       (
         (term_offset > 0) && (odd(selector))
       )
       ||
       (
         (file_offset > 0) && (selector >= log_only)
       )
     ) {
         int mymymyflag = 1;
         if (selector==term_and_log && (term_offset==0 || file_offset==0)) {
          fprintf(stderr, "<<<<<<<<<<<<<<<<< term_offset=%d, file_offset=%d, selector=%d\n",
            term_offset, file_offset, selector);
           if (term_offset==0 && file_offset!=0)
             fprintf(stderr, "TTTTTTTTTTTTTTTTTTTTTTTTTTTTT\n");
           else if (term_offset!=0 && file_offset==0)
             fprintf(stderr, "FFFFFFFFFFFFFFFFFFFFFFFFFFFFF\n");
           else
             fprintf(stderr, "BBBBBBBBBBBBBBBBBBBBBBBBBBBBB\n");
           mymymyflag = 0;
         }
         print_ln();
         if (!mymymyflag)
           fprintf(stderr, ">>>>>>>>>>>>>>>>>> term_offset=%d, file_offset=%d\n",
             term_offset, file_offset);
         fflush(log_file.f);
         fflush(stdout);
#ifndef INIT
  assert(mymymyflag);
#endif
       }
  print_str(s);
} 
@z
