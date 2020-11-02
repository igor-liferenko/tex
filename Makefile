all:
	make -C web2w
	patch -so tex.w web2w/ctex.w utex.patch
	patch -s tex.w goto.patch
	tie -c tex.ch tex.w constants.ch special.ch $(CHF) >/dev/null
	/bin/ctangle tex tex
	gcc -DINIT tex.c -lm -o initex
	@echo 'plain \dump' | ./initex >/dev/null; mv plain.fmt TeXformats/
	@echo 'тех \dump' | ./initex >/dev/null; mv тех.fmt TeXformats/
	gcc -DSTAT tex.c -lm -o virtex

triptex:
	make -C web2w
	patch -so tex.w web2w/ctex.w utex.patch
	patch -s tex.w goto.patch
	tie -c tex.ch tex.w trip/constants.ch $(CHF) >/dev/null
	/bin/ctangle tex tex
	gcc -DINIT -DSTAT tex.c -lm -o trip/triptex

CHF=path.ch interrupt.ch arg.ch print.ch editor.ch name.ch format.ch time.ch banner.ch verify.ch
