all:
	ctie -m ctex.w tex.w utf.ch
	patch ctex.w <ctex.patch
	ctangle ctex
	gcc -o virtex ctex.c -lm
