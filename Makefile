all: ctangle
	@rm -f ctex.w
	patch -s -F0 -o ctex.w tex.w ctex.patch
	@chmod a-w ctex.w
	./ctangle ctex tex
	gcc -DINIT -o initex ctex.c -lm
	@echo 'plain \dump' | ./initex && mv plain.fmt plain.log TeXformats/; echo
	@echo lhplain.ini | ./initex && mv lhplain.fmt lhplain.log TeXformats/; echo
	gcc -g -o virtex ctex.c -lm

ctangle:
	cp ~/cweb/common.w .
	patch common.w common.patch
	ctangle common.w
	gcc -w -c common.c
	cp ~/cweb/ctangle.w .
	cp ~/cweb/common.h .
	patch ctangle.w ctangle.patch
	ctangle ctangle.w
	gcc -w -c ctangle.c
	gcc -w -o ctangle ctangle.o common.o
	rm ctangle.c ctangle.w ctangle.o common.h common.c common.w common.o
