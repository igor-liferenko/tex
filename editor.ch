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
  {
@z

@x
{@+ close_files_and_terminate(); exit(1);
@y
{@+ close_files_and_terminate();
  char editor_line[10];
  sprintf(editor_line, "+%d", line);
  char editor_file[50];
  sprintf(editor_file, "/proc/%ld/fd/%d", (long) getpid(),
    fileno(input_file[input_stack[base_ptr].index_field].f));
  pid_t editor_pid = fork();
  assert(editor_pid != -1);
  if (editor_pid == 0) {
    execlp("vi", "vi", editor_line, editor_file, (char *) NULL);
    _exit(1);
  }
  waitpid(editor_pid, NULL, 0);
  exit(1);
@z
