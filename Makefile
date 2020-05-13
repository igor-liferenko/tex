all: web2w/ctangle change-file
	web2w/ctangle tex tex >/dev/null
	gcc -g -Og -DINIT -o initex tex.c -lm
	@echo 'plain \input offset \dump' | ./initex >/dev/null; mv plain.fmt TeXformats/
	@echo 'тех \input offset \dump' | ./initex >/dev/null; mv тех.fmt TeXformats/
	gcc -g -Og -o virtex tex.c -lm

triptex: web2w/ctangle
	tie -c tex.ch tex.w trip/constants.ch $(CHF) >/dev/null
	web2w/ctangle tex tex >/dev/null
	gcc -DINIT -DSTAT tex.c -lm -o trip/triptex

change-file:
	tie -c tex.ch tex.w constants.ch $(CHF) >/dev/null
CHF=path.ch interrupt.ch arg.ch output.ch editor.ch format.ch time.ch banner.ch exit.ch

web2w/ctangle:
	make -C web2w ctangle
