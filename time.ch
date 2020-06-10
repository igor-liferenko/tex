@x
@h
@y
#include <time.h>
@h
@z

@x
@d time	int_par(time_code)
@y
@z

@x
{@+time=12*60; /*minutes since midnight*/ 
day=4; /*fourth day of the month*/ 
month=7; /*seventh month of the year*/ 
year=1776; /*Anno Domini*/ 
@y
{ time_t timestamp = time(NULL);
  struct tm *tm = localtime(&timestamp);

  int_par(time_code) = tm->tm_hour * 60 + tm->tm_min;
  day = tm->tm_mday;
  month = tm->tm_mon + 1;
  year = tm->tm_year + 1900;
@z

@x
print_two(time/60);print_char(':');print_two(time%60);
@y
print_two(int_par(time_code)/60);print_char(':');print_two(int_par(time_code)%60);
@z

@x
  print_char(':');print_two(time/60);
  print_two(time%60);
@y
  print_char(':');print_two(int_par(time_code)/60);
  print_two(int_par(time_code)%60);
@z
