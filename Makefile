all: web2w/ctangle
	tie -bhp -c tex.ch tex.w constants.ch newline.ch path.ch arg.ch edit.ch format.ch date.ch
	web2w/ctangle -bhp tex tex
	gcc -DINIT -o initex tex.c -lm
	@./initex plain.ini >/dev/null && mv plain.fmt plain.log TeXformats/
	@./initex lhplain.ini >/dev/null && mv lhplain.fmt lhplain.log TeXformats/
	@sed /hoffset/,/catcode...=12/d plain.ini >plain-no-offset.ini
	@./initex plain-no-offset.ini >/dev/null && mv plain-no-offset.fmt plain-no-offset.log TeXformats/
	@sed /hoffset/,/catcode...=12/d lhplain.ini >lhplain-no-offset.ini
	@./initex lhplain-no-offset.ini >/dev/null && mv lhplain-no-offset.fmt lhplain-no-offset.log TeXformats/
	gcc -o virtex tex.c -lm

vanilla: test
	gcc -g -Og -DINIT -o initex tex.c -lm
	@echo plain.ini | ./initex >/dev/null && mv plain.fmt plain.log TeXformats/

test: web2w/ctangle
	web2w/ctangle -bhp tex
	gcc -g -Og -o virtex tex.c -lm

web2w/ctangle:
	make -C web2w ctangle
