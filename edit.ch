We can't use name_field:
  1) see 'note above' in start_input; this could be changed, but
  2) see print.ch
Therefore we use index_field.

@x
  {@+print_nl("You want to edit file ");
@.You want to edit file x@>
  slow_print(input_stack[base_ptr].name_field);
  print_str(" at line ");print_int(line);
@y
{ char s1[50], s2[PATH_MAX];
  sprintf(s1, "/proc/self/fd/%d", fileno(input_file[input_stack[base_ptr].index_field].f));
  assert(realpath(s1, s2));
  FILE *f;
  assert(f = fopen(getenv("edit"), "w"));
  fprintf(f, "%s %d", s2, line);
  fclose(f);
@z
