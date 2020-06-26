all:
ifeq ($(MAKELEVEL),2)
	/bin/ctangle web2w
else
	/bin/ctangle web2w printable
endif
	flex -o web.lex.c web.l
	bison --warnings=none -d -v pascal.y
	gcc -o web2w web2w.c web.lex.c pascal.tab.c
	./web2w -o tex.w tex.web
	patch -s tex.w ctex.patch
