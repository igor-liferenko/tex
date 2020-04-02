@x
    write(term_out,L"! End of file on the terminal... why?");
@y
    write_ln(term_out,L"! End of file on the terminal... why?");
@z

@x
case 'Q': {@+print_esc(@[@<|"batchmode"|@>@]);decr(selector);
@y
case 'Q': {@+print_esc(@[@<|"batchmode"|@>@]);wterm_cr;decr(selector);
@z

@x
    slow_print(log_name);print_char('.');
    }
  }
@y
    slow_print(log_name);print_char('.');
    }
  }
  print_ln();
@z
