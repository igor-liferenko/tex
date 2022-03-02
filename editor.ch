NOTE: it is assumed that terminal supports alternate screen

@x
@h
@y
#include <assert.h>
#include <unistd.h>
@h
@z

@x
  {@+print_nl("You want to edit file ");
@.You want to edit file x@>
  slow_print(input_stack[base_ptr].name_field);
  print_str(" at line ");print_int(line);
@y
{ char editor[50];
  sprintf(editor, "vi +%d /proc/%ld/fd/%d", line, (long) getpid(),
    fileno(input_file[input_stack[base_ptr].index_field].f));
  assert(system(editor) == 0);
@z
