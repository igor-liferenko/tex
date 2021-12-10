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
	sed 's/ (HINT)//' ctex.patch | patch -s --no-backup-if-mismatch ctex.w
