#!/bin/sh
# The call of get_strings_started() is deleted in ctex.patch;
# most of what this function does is not needed due to web2w. But
# checking pool_size constant is necessary. This script
# provides this checking. Here we check the whole string pool,
# not string by string as in original initex, but outcome is the same.
# We do this check before compiling initex (not inside initex), because
# pool_size may be set to a smaller value than the actual pool size
# (which is initialized at compile time, due to web2w).
str_0_255=$(sed -n '/^#define str_0_255/,/^#define str_start_0_255/{/str_start_0_255/d;s/#define str_0_255 //;s/^"//;s/ \\$//;s/"$//;s/\\\\/\\/;s/\\"/"/;s/\\x../X/g;p}' tex.c|tr -d '\n'|wc -c)
str_rest=$(sed -n 's/\\\\/\\/g;s/\\"/"/g;s/^#define str_[0-9]\+ "\(.*\)"$/\1/p' tex.c|tr -d '\n'|wc -c)
pool_ptr=$((str_0_255+str_rest))
string_vacancies=$(sed -n 's/enum.string_vacancies= \([0-9]\+\).*/\1/p' tex.c)
pool_size=$(sed -n 's/enum.pool_size= \([0-9]\+\).*/\1/p' tex.c)
if [ $((pool_ptr+string_vacancies)) -gt $pool_size ]; then
  echo "! You have to increase POOLSIZE."
  exit 1
fi
