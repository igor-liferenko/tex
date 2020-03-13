@x
@h
@y
@h
#include <time.h>
@z

@x
@d time	int_par(time_code)
@y
@d minute	int_par(time_code)
@z

@x
{@+time=12*60; /*minutes since midnight*/ 
day=4; /*fourth day of the month*/ 
month=7; /*seventh month of the year*/ 
year=1776; /*Anno Domini*/ 
@y
{
  time_t now = time(NULL);
  struct tm *date = localtime(&now);
  year = date->tm_year + 1900;
  month = date->tm_mon + 1;
  day = date->tm_mday;
  minute = date->tm_hour * 60 + date->tm_min;
@z

@x
print_two(time/60);print_char(':');print_two(time%60);
@y
print_two(minute/60);print_char(':');print_two(minute%60);
@z

@x
  print_char(':');print_two(time/60);
  print_two(time%60);
@y
  print_char(':');print_two(minute/60);
  print_two(minute%60);
@z
