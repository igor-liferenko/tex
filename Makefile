all: change-file web2w/ctangle
	web2w/ctangle -bhp tex tex
	gcc -o virtex tex.c -lm
	gcc -DINIT -o initex tex.c -lm
	@echo Generating formats
	@./initex plain.ini >/dev/null && mv plain.fmt plain.log TeXformats/
	@sed /hoffset/,/catcode...=12/d plain.ini >plain-no-offset.ini
	@./initex plain-no-offset.ini >/dev/null && mv plain-no-offset.fmt plain-no-offset.log TeXformats/
	@./initex lhplain.ini >/dev/null && mv lhplain.fmt lhplain.log TeXformats/
	@sed /hoffset/,/catcode...=12/d lhplain.ini >lhplain-no-offset.ini
	@./initex lhplain-no-offset.ini >/dev/null && mv lhplain-no-offset.fmt lhplain-no-offset.log TeXformats/

SHELL=/bin/bash
triptex: change-file web2w/ctangle
	diff <(wmerge -h tex.w constants.ch) <(wmerge -h tex.w tex.ch) | patch -s -l -o triptex.w tex.w
	web2w/ctangle -bhp triptex.w trip/triptex.ch
	gcc -DINIT -DSTAT triptex.c -lm -o trip/triptex

change-file:
	tie -bhp -c tex.ch tex.w constants.ch newline.ch path.ch arg.ch edit.ch format.ch date.ch interrupt.ch banner.ch

web2w/ctangle:
	make -C web2w ctangle
