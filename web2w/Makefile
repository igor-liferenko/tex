all:
	tie -c web2w.ch web2w.w time.ch `[ $(MAKELEVEL) = 2 ] || echo printable.ch hex.ch` >/dev/null
	ctangle web2w web2w
	flex -o web.lex.c web.l
	bison --warnings=none -d -v pascal.y
	gcc -o web2w web2w.c web.lex.c pascal.tab.c
	tie -m tex64.web tex.web 64bit.ch >/dev/null
	./web2w -o ctex.w tex64.web
	@patch -s ctex.w tex.patch
	sed '622,627s/\(time\|day\|month\|year\)\b/sys_&/g' ctex.patch | patch -s --no-backup-if-mismatch ctex.w
	@patch -s -R --no-backup-if-mismatch ctex.w tex.patch
	patch -s ctex.w c.patch
