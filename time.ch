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
  struct tm *time_members = localtime(&timestamp);

  internal_time = time_members->tm_hour * 60 + time_members->tm_min;
  day = time_members->tm_mday;
  month = time_members->tm_mon + 1;
  year = time_members->tm_year + 1900;
@z
