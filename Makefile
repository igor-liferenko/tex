all: ctangle
	./ctangle tex tex
	gcc -DINIT -o initex tex.c -lm
	@echo plain.ini | ./initex && mv plain.fmt plain.log TeXformats/
	@echo lhplain.ini | ./initex && mv lhplain.fmt lhplain.log TeXformats/
	gcc -g -o virtex tex.c -lm

ctangle:
	cp ~/cweb/common.w .
	patch common.w web2w/common.patch
	ctangle common.w
	gcc -w -c common.c
	cp ~/cweb/ctangle.w .
	cp ~/cweb/common.h .
	patch ctangle.w web2w/ctangle.patch
	ctangle ctangle.w
	gcc -w -c ctangle.c
	gcc -w -o ctangle ctangle.o common.o
	rm ctangle.c ctangle.w ctangle.o common.h common.c common.w common.o
