all:
	make -C web2w && patch -so tex.w web2w/tex.w utex.patch
	tie -c tex.ch tex.w constants.ch special.ch $(CHF) >/dev/null
	/bin/ctangle tex tex
	gcc -g -Og -DINIT -o initex tex.c -lm
	@echo 'plain \input offset \dump' | ./initex >/dev/null; mv plain.fmt TeXformats/
	@echo 'тех \input offset \dump' | ./initex >/dev/null; mv тех.fmt TeXformats/
	gcc -g -Og -DSTAT -o virtex tex.c -lm

triptex:
	make -C web2w && patch -so tex.w web2w/tex.w utex.patch
	tie -c tex.ch tex.w trip/constants.ch $(CHF) >/dev/null
	/bin/ctangle tex tex
	gcc -DINIT -DSTAT -o trip/triptex tex.c -lm

CHF=path.ch interrupt.ch arg.ch output.ch editor.ch format.ch time.ch banner.ch exit.ch
