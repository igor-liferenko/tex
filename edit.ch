@x
  {@+print_nl("You want to edit file ");
@.You want to edit file x@>
  slow_print(input_stack[base_ptr].name_field);
  print_str(" at line ");print_int(line);
@y
{ FILE *f;
  assert(f = fopen(getenv("edit"), "w"));
  for (pool_pointer k = str_start[input_stack[base_ptr].name_field];
                    k < str_start[input_stack[base_ptr].name_field+1]; k++) {
    char mb[MB_CUR_MAX];
    int len = wctomb(mb, xchr[so(str_pool[k])]);
    fprintf(f, "%.*s", len, mb);
  }
  fprintf(f, " %d\n", line);
  fclose(f);
@z

@x
if (name==str_ptr-1)  /*conserve string pool space (but see note above)*/ 
  {@+flush_string;name=cur_name;
  } 
@y
@z
