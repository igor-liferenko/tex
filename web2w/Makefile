all:
ifeq ($(MAKELEVEL),2) # for TRIP
	ctangle web2w time
else
	tie -c web2w.ch web2w.w printable.ch time.ch >/dev/null
	CWEBINPUTS=/home/user/cweb ctangle ./web2w ./web2w
endif
	flex -o web.lex.c web.l
	bison --warnings=none -d -v pascal.y
	gcc -o web2w web2w.c web.lex.c pascal.tab.c
	patch -so tex-2021.web tex.web 2021.patch
	./web2w -o `[ $(MAKELEVEL) = 2 ] && echo ttex.w || echo ctex.w` tex-2021.web
	sed '55,63d;631,636s/\(time\|day\|month\|year\)\b/sys_&/g;817{s/13/7/g;h};826{H;G}' ctex.patch | patch -s --no-backup-if-mismatch `[ $(MAKELEVEL) = 2 ] && echo ttex.w || echo ctex.w`
