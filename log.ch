Disable file stream buffering to view log-file while TeX is still running.

@x
while (!a_open_out(&log_file)) @<Try to get a different log file name@>;
@y
while (!a_open_out(&log_file)) @<Try to get a different log file name@>;
setlinebuf(log_file.f);
@z
