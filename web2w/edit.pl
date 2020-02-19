#!/usr/bin/perl -p
# This puts definition of str_0_255 to separate file, to allow editing tex.w with
# editor which supports only valid UTF-8.

if (/^\@d str_0_255/) {
  print "\@i str_0_255\n";
  open F, '>../str_0_255';
  select F;
}
if (/^\@d str_start_0_255/) {
  select STDOUT;
}
