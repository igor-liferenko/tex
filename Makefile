all:
	@rm -f ctex.w
	patch -s -o ctex.w tex.w ctex.patch
	@chmod a-w ctex.w
	../cweb/ctangle ctex
	gcc -DINIT -o initex ctex.c -lm
	@echo 'plain \dump' | ./initex && mv plain.fmt TeXformats/; echo
	gcc -g -o virtex ctex.c -lm
