all:
	make -C web2w
	patch -so tex.w web2w/ctex.w utex.patch
	tie -c tex.ch tex.w $(CHF) constants.ch special.ch paper+origin.ch >/dev/null
	ctangle tex tex
	gcc -DINIT tex.c -o initex -lm -fno-builtin-ceil -fno-builtin-floor -fno-builtin-abs
	@./initex 'plain \input paper+origin \dump' >/dev/null && mv plain.fmt TeXformats/
	gcc -DSTAT tex.c -o virtex -lm -fno-builtin-ceil -fno-builtin-floor -fno-builtin-abs

triptex:
	@[ $(MAKELEVEL) = 1 ]
	make -C web2w
	patch -so tex.w web2w/ctex.w utex.patch
	tie -c tex.ch tex.w $(CHF) trip/constants.ch >/dev/null
	ctangle tex tex
	gcc -DINIT -DSTAT tex.c -o trip/triptex -lm -fno-builtin-ceil -fno-builtin-floor -fno-builtin-abs

CHF=charset.ch path.ch interrupt.ch arg.ch print.ch preload.ch time.ch log.ch edit.ch name.ch exit.ch input.ch close.ch hyph.ch 64bit.ch
