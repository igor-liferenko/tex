Disable file stream buffering to make log-file contain needed data when program stops.

@x
while (!a_open_out(&log_file)) @<Try to get a different log file name@>;
@y
while (!a_open_out(&log_file)) @<Try to get a different log file name@>;
setlinebuf(log_file.f);
@z
