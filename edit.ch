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
  fprintf(f, " %d", line);
  fclose(f);
@z

See fix for TeX bug S950 (the steps done in the bug report have nothing to do with the fix itself). 
@x 
  print_str("E to edit your file,");
@y
  print_str("E to edit your file,");
else fprintf(stderr, "IT HAPPENED!!! The check added in the fix is indeed useful!!!.\n");
@z

@x
if (name==str_ptr-1)  /*conserve string pool space (but see note above)*/ 
  {@+flush_string;name=cur_name;
  } 
@y
@z
