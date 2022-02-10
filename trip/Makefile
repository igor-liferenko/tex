all:
	@make -C .. triptex
	@rm -f trip.log trip.fmt
	@/bin/echo -e '\n\\input trip' | ./triptex >/dev/null || true
	@sed -i -f tripin.sed trip.log
	@diff tex/tripin.log trip.log
	@rm -f 8terminal.tex tripos.tex trip.dvi trip.log
	@echo ' &trip  trip ' | ./triptex >trip.fot || true
	@dvitype -output-level 2 -page-start '*.*.*.*.*.*.*.*.*.*' -max-pages 1000000 -dpi 72.27 -magnification 0 trip.dvi >trip.typ
	@sed -i -f triptyp.sed trip.typ
	@diff tex/trip.typ trip.typ
	@diff tex/tripos.tex tripos.tex
	@diff tex/8terminal.tex 8terminal.tex
	@sed -i -f triplog.sed trip.log
	@diff tex/trip.log trip.log
	@sed -i -f tripfot.sed trip.fot
	@echo >>trip.fot
	@diff tex/trip.fot trip.fot
	@echo
	@echo Passed.
	@echo
