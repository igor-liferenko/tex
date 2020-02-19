all:
	make -C .. ctangle
	cp ../web2w.w .
	patch web2w.w web2w.patch
	../ctangle web2w.w
	flex -o web.lex.c web.l
	bison --warnings=none -d -v pascal.y
	gcc -o web2w web2w.c web.lex.c pascal.tab.c
	rm web2w.w
	./web2w -o tex.w tex.web
	patch tex.w ctex.patch # TODO: merge ../tex.w and ../ctex.patch into tex.w and edit it directly
	./edit.pl tex.w | sponge tex.w
