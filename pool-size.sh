#!/bin/sh
str_0_255=$(sed -n '/^#define str_0_255/,/^#define str_start_0_255/{/str_start_0_255/d;s/#define str_0_255 //;s/^"//;s/ \\$//;s/"$//;s/\\\\/\\/;s/\\"/"/;s/\\x../X/g;p}' tex.c|tr -d '\n'|wc -c)
str_rest=$(sed -n 's/\\\\/\\/g;s/\\"/"/g;s/^#define str_[0-9]\+ "\(.*\)"$/\1/p' tex.c|tr -d '\n'|wc -c)
pool_ptr=$((str_0_255+str_rest))
string_vacancies=$(sed -n 's/enum.string_vacancies= \([0-9]\+\).*/\1/p' tex.c)
pool_size=$(sed -n 's/enum.pool_size= \([0-9]\+\).*/\1/p' tex.c)
if [ $((pool_ptr+string_vacancies)) -gt $pool_size ]; then
  echo "! You have to increase POOLSIZE."
  exit 1
fi
