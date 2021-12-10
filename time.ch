@x
@h
@y
#include <time.h>
@h
@z

@x
{@+sys_time=12*60;
sys_day=4;sys_month=7;sys_year=1776; /*self-evident truths*/ 
@y
{ time_t $ = time(NULL);
  struct tm *t = localtime(&$);

  sys_time = t->tm_hour * 60 + t->tm_min;
  sys_day = t->tm_mday;
  sys_month = t->tm_mon + 1;
  sys_year = t->tm_year + 1900;
@z
