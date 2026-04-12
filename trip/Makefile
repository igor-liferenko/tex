all:
	@make -C .. triptex
	@rm -f trip.log trip.fmt
	@printf '\n%s\n' '\input trip' | ./triptex >/dev/null || true
	@diff tex/tripin.log trip.log
	@rm -f 8terminal.tex tripos.tex trip.dvi trip.log
	@printf '%s\n' ' &trip  trip ' | ./triptex >trip.fot || true
	@sed -i '2s/**/** \&trip  trip \n/;$$a\' trip.fot
	@dvitype -output-level 2 -page-start '*.*.*.*.*.*.*.*.*.*' -max-pages 1000000 -dpi 72.27 -magnification 0 trip.dvi >trip.typ
	@sed -i 's/ (TeX Live .*//' trip.typ
	@diff tex/trip.typ trip.typ
	@diff tex/tripos.tex tripos.tex
	@diff tex/8terminal.tex 8terminal.tex
	@diff tex/trip.log trip.log
	@diff tex/trip.fot trip.fot
	@printf '\n%s\n\n' 'Passed.'
