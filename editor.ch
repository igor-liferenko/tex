@x
@h
@y
#include <unistd.h>
@h
@z

@x
void jump_out(void)
{@+ close_files_and_terminate(); wterm_cr; exit(1);
@y
int edit_line;
void jump_out(void)
{
  close_files_and_terminate();
  if (edit_line) {
    char tmp[30];
    assert(snprintf(tmp, sizeof tmp, "/proc/self/fd/%d", fileno(cur_file.f)) < sizeof tmp);
    char fname[500] = { };
    assert(readlink(tmp, fname, sizeof fname) != -1 && fname[sizeof fname - 1] == '\0');

    char cmd[500];
    assert(snprintf(cmd, sizeof cmd, "echo %s %d", fname, edit_line) < sizeof cmd);
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
{ edit_line = line;
@z
