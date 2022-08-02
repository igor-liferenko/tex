@x
@<Global variables@>@;
@y
@<Global variables@>@;
bool want_edit;
@z

@x
@h
@y
#include <unistd.h>
@h
@z

@x
{@+ close_files_and_terminate(); exit(1);
@y
{@+ close_files_and_terminate();
  if (want_edit) {
    char editor[50];
    sprintf(editor, "vi +%d /proc/%ld/fd/%d", line, (long) getpid(),
      fileno(input_file[input_stack[base_ptr].index_field].f));
    system(editor);
  }
  exit(1);
@z

@x
  {@+print_nl("You want to edit file ");
@.You want to edit file x@>
  slow_print(input_stack[base_ptr].name_field);
  print_str(" at line ");print_int(line);
@y
{ want_edit = 1;
@z
