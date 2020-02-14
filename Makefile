all:
	patch -s -o ctex.w tex.w ctex.patch
	ctangle ctex
	gcc -DINIT -o initex ctex.c -lm
	@echo 'plain \dump' | ./initex && mv plain.fmt TeXformats/; echo
	gcc -o virtex ctex.c -lm
