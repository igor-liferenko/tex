all:
	make -C .. trip
	patch -s triptex.w trip.patch
	../web2w/ctangle -bhp triptex.w
	gcc -DINIT -DSTAT triptex.c -lm -o triptex
	/bin/echo -e '\n\\input trip'|./triptex >/dev/null
	sed -i -f tripin.sed trip.log
	diff trip.log tripin.log
