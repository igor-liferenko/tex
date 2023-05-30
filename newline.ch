Run TeX on this file:

    \setbox0=\hbox{A}
    \showbox0
    \end

The log file is:

    .\tenrm A


    ! OK.

(notice two blank lines)

This behavior stems from the way "print_nl" is implemented in module 62 in the
TeX code.  The function prints a string but ensures that it is printed at the
beginning of a line.  If both terminal and log file output are selected, i.e.,
if "selector" is set to "term_and_log", this function will start a new line on
both the terminal and the log file, even if only one of them is not currently
at the beginning of a new line. This can lead to a spurious new line for the
output target that was already at the beginning of a new line.

In the case of the example above, if "\tracingonline" is not positive, the
"\showbox" command will only print to the log file. At the end of "\showbox",
one empty line is printed by "end_diagnostic" in module 1298, before "selector"
is reset to "term_and_log". At this point "print_err" is invoked, which calls
"print_nl" to ensure that the "error" message starts at the beginning of a new
line.  Because the terminal is not at the start of a new line at this point in
your example, a new line will be started an both the terminal and the log file,
leading to the second empty line.

If we invoke "\showbox" at this point again, the terminal will be at the
beginning of a new line so the call to "print_ln" adds no blank lines. We can
recreate the effect though by ensuring that the terminal is not at the
beginning of a new line, e.g.,

  \setbox0=\hbox{A}
  \showbox0
  \showbox0
  \message{Some text}
  \showbox0
  \end

In this change file we fix this behavior by not doing extra wlog_cr.

@x
void print_nl(char *@!s) /*prints string |s| at beginning of line*/ 
{@+if (((term_offset > 0)&&(odd(selector)))||@|
  ((file_offset > 0)&&(selector >= log_only))) print_ln();
@y
void print_nl(char *@!s) /*prints string |s| at beginning of line*/ 
{ if (selector == term_and_log && term_offset > 0 && file_offset == 0)
    wterm_cr,term_offset=0; /* do not do extra |wlog_cr| */
  else
    if (((term_offset > 0)&&(odd(selector)))||@|
        ((file_offset > 0)&&(selector >= log_only))) print_ln();
@z
