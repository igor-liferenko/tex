Run `touch /tmp/tex.interrupt' from another terminal.

@x
@h
@y
#include <unistd.h>
@h
@d INTF "/tmp/tex.interrupt"
@z

@x
@d check_interrupt	{@+if (interrupt!=0) pause_for_instructions();
@y
@d check_interrupt      {@+if (access(INTF, F_OK) == 0) pause_for_instructions();
@z

@x
int @!interrupt; /*should \TeX\ pause for instructions?*/ 
@y
@z

@x
interrupt=0;OK_to_interrupt=true;
@y
unlink(INTF);OK_to_interrupt=true;
@z

@x
  interrupt=0;
@y
  unlink(INTF);
@z

@x
if (interrupt!=0) if (OK_to_interrupt)
@y
if (access(INTF, F_OK) == 0) if (OK_to_interrupt)
@z
