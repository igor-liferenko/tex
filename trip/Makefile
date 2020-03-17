all:
	make -C .. trip
	../web2w/ctangle -bhp triptex.w trip.ch
	gcc -DINIT -DSTAT triptex.c -lm -o triptex
	/bin/echo -e '\n\\input trip' | ./triptex >/dev/null
	sed -i -f tripin.sed trip.log
	diff tripin.log trip.log
	/bin/echo ' &trip  trip ' | ./triptex >trip.fot
	TEXFONTS=../TeXfonts dvitype -output-level=2 -page-start='*.*.*.*.*.*.*.*.*.*' -max-pages=1000000 -dpi=72.27 -magnification=0 trip.dvi >trip.typ
	sed -i -f triptyp.sed trip.typ
	diff tex/trip.typ trip.typ
	diff tex/tripos.tex tripos.tex
	diff tex/8terminal.tex 8terminal.tex
	sed -i -f triplog.sed trip.log
	perl -i -pe's/\xd0\x90/^^80/g;s/\xd0\x92/^^82/g;s/\xd0\x93/^^83/g' trip.log
	diff tex/trip.log trip.log
	sed -i -f tripfot.sed trip.fot
	diff tex/trip.fot trip.fot
