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
{ time_t timestamp = time(NULL);
  struct tm *tm = localtime(&timestamp);

  internal_time = tm->tm_hour * 60 + tm->tm_min;
  day = tm->tm_mday;
  month = tm->tm_mon + 1;
  year = tm->tm_year + 1900;
@z
