NOTE: printing final newline must be done at the last moment before exiting, like it is done here - in http://tug.ctan.org/tex-archive/systems/knuth/local/tex-sparc/initex.ch and in web2c it is done wrong; it is logical to return exit status at the same time

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
