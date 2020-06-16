all: tex тех

tex: change-file
	CWEBINPUTS=. /usr/bin/ctangle -bhp tex tex
	gcc -g -Og -DINIT -o initex tex.c -lm
	@echo 'plain \input offset \dump' | ./initex >/dev/null; mv plain.fmt TeXformats/
	gcc -g -Og -o virtex tex.c -lm

тех:
	@echo 'тех \input offset \dump' | ./initex >/dev/null; mv тех.fmt TeXformats/
.PHONY: тех

triptex:
	tie -c tex.ch tex.w trip/constants.ch $(CHF) >/dev/null
	CWEBINPUTS=. /usr/bin/ctangle -bhp tex tex
	gcc -DINIT -DSTAT tex.c -lm -o trip/triptex

change-file:
	tie -c tex.ch tex.w constants.ch special.ch $(CHF) >/dev/null
CHF=path.ch interrupt.ch arg.ch output.ch editor.ch format.ch time.ch banner.ch exit.ch
