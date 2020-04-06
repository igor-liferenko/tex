all: change-file web2w/ctangle
	web2w/ctangle -bhp tex tex # if you need to disable ch-file, put `#' after constants.ch, not here
	gcc -g -Og -DINIT -o initex tex.c -lm
	@echo 'plain \input offset \dump' | ./initex >/dev/null; mv plain.fmt TeXformats/
	@echo 'тех \input offset \dump' | ./initex >/dev/null; mv тех.fmt TeXformats/
	gcc -g -Og -o virtex tex.c -lm

SHELL=/bin/bash
triptex: change-file web2w/ctangle
	diff <(wmerge -h tex.w constants.ch) <(wmerge -h tex.w tex.ch) | patch -sl tex.w -o triptex.w # subtract constants.ch from tex.ch
	web2w/ctangle -bhp triptex.w trip/constants.ch
	gcc -DINIT -DSTAT triptex.c -lm -o trip/triptex

change-file:
	tie -bhp -c tex.ch tex.w constants.ch path.ch interrupt.ch arg.ch output.ch editor.ch format.ch time.ch banner.ch exit.ch

web2w/ctangle:
	make -C web2w ctangle

.PHONY: mapping
mapping:
	gcc -Wall -fPIC -shared -o mapping.so mapping.c -ldl
