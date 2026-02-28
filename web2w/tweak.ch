Do not eliminate first argument of prompt_file_name from string pool,
in order to reduce ctex.patch

@x
  if  (id->sym_no==overflow_no || id->sym_no==prompt_file_name_no )
@y
  if  (id->sym_no==overflow_no)
@z
