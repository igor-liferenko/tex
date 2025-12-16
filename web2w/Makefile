all:
	tie -c web2w.ch web2w.w time.ch `[ $(MAKELEVEL) = 2 ] || echo printable.ch hex.ch` >/dev/null
	ctangle web2w web2w
	flex -o web.lex.c web.l
	bison --warnings=none -d -v pascal.y
	gcc -o web2w web2w.c web.lex.c pascal.tab.c
	./web2w -o ctex.w tex.web
	patch -s --no-backup-if-mismatch ctex.w ctex.patch
	patch -s ctex.w c.patch
