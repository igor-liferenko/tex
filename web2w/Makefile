all:
	ctangle web2w.w
	flex -o web.lex.c web.l
	bison -d -v pascal.y
	gcc -o web2w web2w.c web.lex.c pascal.tab.c
