all:
	tie -c web2w.ch web2w.w time.ch `[ $(MAKELEVEL) = 2 ] || echo printable.ch hex.ch` >/dev/null
	ctangle web2w web2w
	flex -o web.lex.c web.l
	bison --warnings=none -d -v pascal.y
	gcc -o web2w web2w.c web.lex.c pascal.tab.c
	cp tex.web tex64.web
	@sed -i 's/max_quarterword=255/max_quarterword=65535/' tex64.web
	@sed -i 's/max_halfword==65535/max_halfword==@"3FFFFFFF/' tex64.web # 2*max_halfword must be less than 2^24-1, not produce an overflow - according to second edition of web2w.pdf
	./web2w -o ctex.w tex64.web
	@patch -s ctex.w tex.patch
	sed '622,627s/\(time\|day\|month\|year\)\b/sys_&/g' ctex.patch | patch -s --no-backup-if-mismatch ctex.w
	@patch -s -R --no-backup-if-mismatch ctex.w tex.patch
	patch -s ctex.w c.patch
