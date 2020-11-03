@x
@<Global variables@>@;
@y
@<Global variables@>@;
FILE *edit_file;
int edit_line;
@z

@x
@h
@y
#include <unistd.h>
@h
@z

@x
{@+ close_files_and_terminate(); wterm_cr; exit(1);
@y
{ close_files_and_terminate();
  if (edit_file) {
    char tmp[30];
    assert(snprintf(tmp, sizeof tmp, "/proc/self/fd/%d", fileno(edit_file)) < sizeof tmp);
    char fname[1000] = { };
    assert(readlink(tmp, fname, sizeof fname) != -1 && fname[sizeof fname - 1] == '\0');

    char cmd[500];
    assert(snprintf(cmd, sizeof cmd, "em %s %d", fname, edit_line) < sizeof cmd);
    system(cmd);
  }
  wterm_cr; exit(1);
@z

@x
  {@+print_nl("You want to edit file ");
@.You want to edit file x@>
  slow_print(input_stack[base_ptr].name_field);
  print_str(" at line ");print_int(line);
@y
{ edit_file = cur_file.f;
  edit_line = line;
@z
