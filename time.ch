@x
@h
@y
#include <time.h>
@h
@z

@x
{@+time_of_day=12*60; /*minutes since midnight*/ 
day=4; /*fourth day of the month*/ 
month=7; /*seventh month of the year*/ 
year=1776; /*Anno Domini*/ 
@y
{ time_t $ = time(NULL);
  struct tm *t = localtime(&$);

  time_of_day = t->tm_hour * 60 + t->tm_min;
  day = t->tm_mday;
  month = t->tm_mon + 1;
  year = t->tm_year + 1900;
@z
