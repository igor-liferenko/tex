all: ctangle cweave
	./ctangle web2w.w
	flex -o web.lex.c web.l
	bison --warnings=none -d -v pascal.y
	gcc -o web2w web2w.c web.lex.c pascal.tab.c
	./web2w -o tex.w tex.web
	patch tex.w ctex.patch

ctangle cweave:
	/var/local/bin/ctangle -bhp common.w
	sed -i 's/wrap_up(){/wrap_up(){if(show_happiness)/' common.c # for -bhp
	gcc -w -c common.c
	/var/local/bin/ctangle -bhp ctangle.w
	gcc -w -c ctangle.c
	gcc -w -o ctangle ctangle.o common.o
	/var/local/bin/ctangle -bhp cweave.w
	gcc -w -c cweave.c
	gcc -w -o cweave cweave.o common.o
