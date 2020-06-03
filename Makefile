all: change-file
	/usr/bin/ctangle -bhp tex tex
	gcc -g -Og -DINIT -o initex tex.c -lm
	@echo 'plain \input offset \dump' | ./initex >/dev/null; mv plain.fmt TeXformats/
	@echo 'тех \input offset \dump' | ./initex >/dev/null; mv тех.fmt TeXformats/
	gcc -g -Og -o virtex tex.c -lm

triptex:
	tie -c tex.ch tex.w trip/constants.ch $(CHF) >/dev/null
	/usr/bin/ctangle -bhp tex tex
	gcc -DINIT -DSTAT tex.c -lm -o trip/triptex

change-file:
	tie -c tex.ch tex.w constants.ch $(CHF) >/dev/null
CHF=path.ch interrupt.ch arg.ch output.ch editor.ch format.ch time.ch banner.ch exit.ch special.ch
