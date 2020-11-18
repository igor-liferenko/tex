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
{ utf8_t tmp[30];
  assert(snprintf(tmp, sizeof tmp, "/proc/self/fd/%d", fileno(cur_file.f)) < sizeof tmp);
  utf8_t fname[500] = { };
  assert(readlink(tmp, fname, sizeof fname) != -1 && fname[sizeof fname - 1] == '\0');
  utf8_t cmd[500];
  assert(snprintf(cmd, sizeof cmd, "em %s %d", fname, line) < sizeof cmd);
  system(cmd);
@z
