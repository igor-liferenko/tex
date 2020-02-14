all:
	patch -s -o ctex.w tex.w ctex.patch
	ctangle ctex
	gcc -DINIT -o initex ctex.c -lm
	gcc -o virtex ctex.c -lm
