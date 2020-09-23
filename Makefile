all:
	make -C web2w
	patch -so tex.w web2w/tex.w utex.patch
	patch -s tex.w goto.patch
	tie -c tex.ch tex.w constants.ch special.ch $(CHF) >/dev/null
	/bin/ctangle tex tex
	gcc -g -Og -DINIT -o initex tex.c
	@printf 'plain \dump' | ./initex >/dev/null; mv plain.fmt TeXformats/
	@printf 'тех \dump' | ./initex >/dev/null; mv тех.fmt TeXformats/
	gcc -g -Og -DSTAT -o virtex tex.c

triptex:
	make -C web2w
	patch -so tex.w web2w/tex.w utex.patch
	patch -s tex.w goto.patch
	tie -c tex.ch tex.w trip/constants.ch $(CHF) >/dev/null
	/bin/ctangle tex tex
	gcc -DINIT -DSTAT -o trip/triptex tex.c

CHF=path.ch interrupt.ch arg.ch output.ch editor.ch format.ch time.ch banner.ch input.ch debug.ch
