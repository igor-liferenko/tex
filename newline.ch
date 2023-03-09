@x
void print_nl(char *@!s) /*prints string |s| at beginning of line*/ 
{@+if (((term_offset > 0)&&(odd(selector)))||@|
  ((file_offset > 0)&&(selector >= log_only))) print_ln();
@y
void print_nl(char *@!s) /*prints string |s| at beginning of line*/ 
{ if (selector == term_and_log && term_offset > 0 && file_offset == 0)
    wterm_cr,term_offset=0; // add `,wlog_cr' to restore original behavior
  else
    if (((term_offset > 0)&&(odd(selector)))||@|
        ((file_offset > 0)&&(selector >= log_only))) print_ln();
@z
