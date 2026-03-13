all:
	make -C web2w
	tie -m tex.w web2w/ctex.w web2w/ctex.ch >/dev/null
	patch -s tex.w utex.patch
	tie -c tex.ch tex.w $(CHF) path.ch constants.ch special.ch pool.ch paper+origin.ch comment.ch exten.ch hyph.ch >/dev/null
	ctangle tex tex
	gcc -DINIT tex.c -o initex -lm
	@./initex 'plain \input paper+origin \dump' >/dev/null && mv plain.fmt TeXformats/
	gcc -DSTAT tex.c -o virtex -lm

triptex:
	@[ $(MAKELEVEL) = 1 ]
	make -C web2w
	patch -so tex.w web2w/ctex.w utex.patch
	tie -c tex.ch tex.w $(CHF) trip/constants.ch >/dev/null
	ctangle tex tex
	gcc -DINIT -DSTAT tex.c -o trip/triptex -lm

CHF=charset.ch interrupt.ch arg.ch print.ch preload.ch time.ch log.ch edit.ch name.ch exit.ch input.ch close.ch 64bit.ch
