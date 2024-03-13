@x
@h
@y
#include <unistd.h>
@h
@z

@x
@d check_interrupt	{@+if (interrupt!=0) pause_for_instructions();
@y
@d check_interrupt      {@+if (access("/tmp/my.interrupt", F_OK) == 0) pause_for_instructions();
@z

@x
interrupt=0;OK_to_interrupt=true;
@y
unlink("/tmp/my.interrupt");OK_to_interrupt=true;
@z

@x
  interrupt=0;
@y
  unlink("/tmp/my.interrupt");
@z

@x
if (interrupt!=0) if (OK_to_interrupt)
@y
if (access("/tmp/my.interrupt", F_OK) == 0) if (OK_to_interrupt)
@z
