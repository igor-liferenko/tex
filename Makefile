all: change-file web2w/ctangle
	web2w/ctangle -bhp tex tex
	gcc -g -Og -o virtex tex.c -lm
	gcc -g -Og -DINIT -o initex tex.c -lm
	@echo Generating formats
	@./initex plain.ini >/dev/null && mv plain.fmt TeXformats/
	@sed -f no-offset.sed plain.ini | ./initex >/dev/null && mv plain.fmt TeXformats/plain-mpost.fmt
	@./initex lhplain.ini >/dev/null && mv lhplain.fmt TeXformats/
	@sed -f no-offset.sed lhplain.ini | ./initex >/dev/null && mv texput.fmt TeXformats/lhplain-mpost.fmt

SHELL=/bin/bash
triptex: change-file web2w/ctangle
	diff <(wmerge -h tex.w constants.ch) <(wmerge -h tex.w tex.ch) | patch -sl tex.w -o triptex.w # subtract constants.ch from tex.ch
	web2w/ctangle -bhp triptex.w trip/constants.ch
	gcc -DINIT -DSTAT triptex.c -lm -o trip/triptex

change-file:
	tie -bhp -c tex.ch tex.w constants.ch newline.ch path.ch interrupt.ch arg.ch out.ch edit.ch format.ch date.ch banner.ch exit.ch

web2w/ctangle:
	make -C web2w ctangle
