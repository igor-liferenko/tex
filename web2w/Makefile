all: ctangle
	./ctangle -bhp web2w printable
	flex -o web.lex.c web.l
	bison --warnings=none -d -v pascal.y
	gcc -o web2w web2w.c web.lex.c pascal.tab.c
	./web2w -o tex.w tex.web
	patch tex.w ctex.patch

ctangle:
	/var/local/bin/ctangle -bhp common.w /home/user/cweb-git/utf8/comm-show.ch
	gcc -w -c common.c
	/var/local/bin/ctangle -bhp ctangle.w /home/user/cweb-git/utf8/ctang-show.ch
	gcc -w -c ctangle.c
	gcc -w -o ctangle ctangle.o common.o
	/var/local/bin/ctangle -bhp cweave.w /home/user/cweb-git/utf8/cweav-show.ch
	gcc -w -c cweave.c
	gcc -w -o cweave cweave.o common.o
