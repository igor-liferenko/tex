all: ctangle
	@rm -f ctex.w
	patch -s -o ctex.w tex.w ctex.patch
	@chmod a-w ctex.w
	./ctangle ctex
	gcc -DINIT -o initex ctex.c -lm
	@echo 'plain \dump' | ./initex && mv plain.fmt TeXformats/; echo
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
