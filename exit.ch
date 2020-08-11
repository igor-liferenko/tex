NOTE: printing final newline and returning exit code must be done at the last moment before exiting, like it is done here; at http://tug.ctan.org/tex-archive/systems/knuth/local/tex-sparc/initex.ch it is done wrong

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
