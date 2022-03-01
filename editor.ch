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
{ char sname[30];
  assert(snprintf(sname, sizeof sname, "/proc/self/fd/%d",
    fileno(input_file[input_stack[base_ptr].index_field].f)) < sizeof sname);
  char fname[500] = {};
  assert(readlink(sname, fname, sizeof fname) != -1 && fname[sizeof fname - 1] == 0);
  char editor[500];
  assert(snprintf(editor, sizeof editor, "nano +%d %s", line, fname) < sizeof editor);
  assert(system(editor) == 0);
@z
