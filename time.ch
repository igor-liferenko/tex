@x
@h
@y
#include <time.h>
@h
@z

@x
{@+internal_time=12*60; /*minutes since midnight*/ 
day=4; /*fourth day of the month*/ 
month=7; /*seventh month of the year*/ 
year=1776; /*Anno Domini*/ 
@y
{ time_t current_time = time(NULL);
  struct tm *local_time = localtime(&current_time);

  internal_time = local_time->tm_hour * 60 + local_time->tm_min;
  day = local_time->tm_mday;
  month = local_time->tm_mon + 1;
  year = local_time->tm_year + 1900;
@z
