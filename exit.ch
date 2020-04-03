@x
@h
@y
@h
#define exit do { wterm_cr; if (history <= warning_issued) exit(0); else exit(1); } while
@z

@x
close_files_and_terminate();
@y
close_files_and_terminate();
exit(0);
@z
