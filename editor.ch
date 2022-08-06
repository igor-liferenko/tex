@x
void jump_out(void)
{@+ close_files_and_terminate(); exit(1);
@y
bool want_edit;
void jump_out(void)
{@+ close_files_and_terminate();
  if (want_edit) {
    print_ln();
    char editor[50];
    sprintf(editor, "vi +%d /proc/$PPID/fd/%d", line,
      fileno(input_file[input_stack[base_ptr].index_field].f));
    system(editor);
    exit(134);
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
