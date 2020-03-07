all: ctangle
	./ctangle -bhp web2w.w
	flex -o web.lex.c web.l
	bison --warnings=none -d -v pascal.y
	gcc -o web2w web2w.c web.lex.c pascal.tab.c
	./web2w -o tex.w tex.web
	patch tex.w ctex.patch

ctangle:
	patch common.w common.patch
	#?ctangle -bhp common.w
	#sed ...
	#gcc -w -c common.c
	patch ctangle.w ctangle.patch
	#?ctangle -bhp ctangle.w
	#gcc -w -c ctangle.c
	#gcc -w -o ctangle ctangle.o common.o
	patch cweave.w cweave.patch
	#?ctangle -bhp cweave
TODO: patch cweave etc already and rm *.patch
