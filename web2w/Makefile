all:
	tie -c web2w.ch web2w.w tab.ch reserved.ch `[ $(MAKELEVEL) = 2 ] || echo printable.ch hex.ch` >/dev/null
	ctangle web2w web2w
	flex -o web.lex.c web.l
	bison --warnings=none -d -v pascal.y
	gcc -o web2w web2w.c web.lex.c pascal.tab.c
	cp tex.web tex-web2w.web
	@sed -i "s/(' '/(' _'/" tex-web2w.web
	./web2w -o ctex.w tex-web2w.web
	@sed -i 's/" _"/" "/' ctex.w
	patch -s ctex.w ctex.patch
