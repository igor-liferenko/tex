all: change-file web2w/ctangle
	web2w/ctangle -bhp tex tex
	gcc -g -Og -DINIT -o initex tex.c -lm
	@echo 'plain \input offset \dump' | ./initex >/dev/null; mv plain.fmt TeXformats/
	@echo 'тех \input offset \dump' | ./initex >/dev/null; mv тех.fmt TeXformats/
	gcc -g -Og -o virtex tex.c -lm

SHELL=/bin/bash
triptex: web2w/ctangle
	tie -bhp -c triptex.ch trip/constants.ch $(CHF)
	web2w/ctangle -bhp tex.w triptex.ch triptex.c
	gcc -DINIT -DSTAT triptex.c -lm -o trip/triptex

CHF=path.ch interrupt.ch arg.ch output.ch editor.ch format.ch time.ch banner.ch exit.ch
change-file:
	tie -bhp -c tex.ch tex.w constants.ch $(CHF)

web2w/ctangle:
	make -C web2w ctangle
