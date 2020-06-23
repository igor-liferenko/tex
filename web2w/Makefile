all:
ifeq ($(MAKELEVEL),1)
	/bin/ctangle web2w printable
else
	/bin/ctangle web2w
endif
	flex -o web.lex.c web.l
	bison --warnings=none -d -v pascal.y
	gcc -o web2w web2w.c web.lex.c pascal.tab.c
	./web2w -o tex.w tex.web
	patch tex.w ctex.patch
