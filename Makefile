all:
	make -C web2w
	patch -s -o tex.w web2w/ctex.w utex.patch
	tie -c tex.ch tex.w constants.ch special.ch pdf.ch origin.ch $(CHF) >/dev/null
	/bin/ctangle tex tex
	gcc -DINIT tex.c -o initex -lm
	@echo 'plain \input origin \dump' | ./initex >/dev/null; mv plain.fmt TeXformats/
	@echo 'тех \input origin \dump' | ./initex >/dev/null; mv тех.fmt TeXformats/
	gcc -DSTAT tex.c -o virtex -lm

triptex:
	make -C web2w
	patch -s -o tex.w web2w/ctex.w utex.patch
	tie -c tex.ch tex.w trip/constants.ch $(CHF) >/dev/null
	/bin/ctangle tex tex
	gcc -DINIT -DSTAT tex.c -o trip/triptex -lm

CHF=path.ch interrupt.ch arg.ch print.ch editor.ch preload.ch time.ch verify.ch exit.ch lm.ch
