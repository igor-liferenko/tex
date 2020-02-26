all: ctangle
	./ctangle -bhp tex tex
	gcc -O0 -DINIT -o initex tex.c -lm
	@./initex plain.ini >/dev/null && mv plain.fmt plain.log TeXformats/
	@./initex lhplain.ini >/dev/null && mv lhplain.fmt lhplain.log TeXformats/
	gcc -O0 -g -o virtex tex.c -lm # TODO: see what -O does and what is the default

ctangle:
	cp ~/cweb/common.w .
	patch common.w web2w/common.patch
	ctangle -bhp common.w ~/cweb-git/utf8/comm-show.ch
	gcc -w -c common.c
	cp ~/cweb/ctangle.w .
	cp ~/cweb/common.h .
	patch ctangle.w web2w/ctangle.patch
	ctangle -bhp ctangle.w ~/cweb-git/utf8/ctang-show.ch
	gcc -w -c ctangle.c
	gcc -w -o ctangle ctangle.o common.o
	rm ctangle.c ctangle.w ctangle.o common.h common.c common.w common.o
