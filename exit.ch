@x
@h
@y
@h
#define exit do { wterm_cr; if (history <= warning_issued) exit(0); else exit(1); } while
@z

@x
return 0; }
@y
exit(0); }
@z
