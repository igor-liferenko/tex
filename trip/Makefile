all:
	make -C .. trip
	../web2w/ctangle -bhp triptex.w trip.ch
	gcc -DINIT -DSTAT triptex.c -lm -o triptex
	/bin/echo -e '\n\\input trip'|./triptex >/dev/null
	sed -i -f tripin.sed trip.log
	diff trip.log tripin.log
	/bin/echo ' &trip  trip '|./triptex >trip.fot
	TEXFONTS=../TeXfonts dvitype -output-level=2 -page-start='*.*.*.*.*.*.*.*.*.*' -max-pages=1000000 -dpi=72.27 -magnification=0 trip.dvi >trip.typ.out
	diff trip.typ.out trip.typ
	diff tripos.tex tex/tripos.tex
	diff trip.fot tex/trip.fot
	diff trip.log tex/trip.log
