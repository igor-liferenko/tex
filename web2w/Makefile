all:
ifeq ($(MAKELEVEL),2) # for TRIP
	/bin/ctangle web2w time
else
	tie -c web2w.ch web2w.w time.ch printable.ch >/dev/null
	/bin/ctangle web2w web2w
endif
	flex -o web.lex.c web.l
	bison --warnings=none -d -v pascal.y
	gcc -o web2w web2w.c web.lex.c pascal.tab.c
	./web2w -o ctex.w tex.web
	sed 's/3.14159265\( (HINT)\)\?/3.141592653/;/print_int(day)/s/day/sys_day/;/wlog(months\[k\])/s/month\b/sys_month/g;/print_int(year)/s/year/sys_year/;/every label/{s|;|;@/|;s/every/every declared/};/BREAKPOINT/s|$$|@/|' ctex.patch | patch -s --no-backup-if-mismatch ctex.w
