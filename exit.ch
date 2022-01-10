Martin Ruckert, the author of web2w, had his reasons for replacing
"goto final_end" with "exit(0)". But I would like to make the present
implementation closer to the original, so in this change-file I restore
the gotos (except where they are non-local).

@x
  {@+write_ln(term_out,"Buffer size exceeded!");exit(0);
@y
  {@+write_ln(term_out,"Buffer size exceeded!");exit(1);
@z

@x
{@+ close_files_and_terminate(); exit(0);
@y
{@+ close_files_and_terminate(); exit(1);
@z

@x
if (!init_terminal(argc,argv)) exit(0);
@y
if (!init_terminal(argc,argv)) goto final_end;
@z

@x
  exit(0);
@y
  goto final_end;
@z

@x
return 0; }
@y
final_end: if (history <= warning_issued) return 0; else return 1; }
@z

@x
  if (!open_fmt_file()) exit(0);
@y
  if (!open_fmt_file()) goto final_end;
@z

@x
    {@+w_close(&fmt_file);exit(0);
@y
    {@+w_close(&fmt_file);goto final_end;
@z
