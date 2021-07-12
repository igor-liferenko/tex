all:
	make -C web2w
	patch -so tex.w web2w/ctex.w utex.patch
	tie -c tex.ch tex.w constants.ch special.ch pdf.ch origin.ch $(CHF) >/dev/null
	/bin/ctangle tex tex
	gcc -O3 -DINIT tex.c -o initex
	@echo 'plain \input origin \dump' | ./initex >/dev/null; mv plain.fmt TeXformats/
	@echo 'тех \input origin \dump' | ./initex >/dev/null; mv тех.fmt TeXformats/
	gcc -O3 -DSTAT tex.c -o virtex

triptex:
	make -C web2w
	patch -so tex.w web2w/ctex.w utex.patch
	tie -c tex.ch tex.w trip/constants.ch $(CHF) >/dev/null
	/bin/ctangle tex tex
	gcc -O3 -DINIT -DSTAT tex.c -o trip/triptex

CHF=path.ch interrupt.ch arg.ch print.ch editor.ch format.ch time.ch verify.ch exit.ch
