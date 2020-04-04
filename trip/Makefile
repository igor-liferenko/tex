all:
	@make -C .. triptex
	@rm -f trip.log trip.fmt
	@/bin/echo -e '\n\\input trip' | ./triptex >/dev/null || true
	@perl -i -pe 's/\(HINT\) //' trip.log
	@sed -i -f tripin.sed trip.log
	@diff tex/tripin.log trip.log
	@rm -f 8terminal.tex tripos.tex trip.dvi trip.log
	@/bin/echo ' &trip  trip ' | ./triptex >trip.fot || true
	@dvitype -output-level=2 -page-start='*.*.*.*.*.*.*.*.*.*' -max-pages=1000000 -dpi=72.27 -magnification=0 trip.dvi >trip.typ
	@sed -i -f triptyp.sed trip.typ
	@diff tex/trip.typ trip.typ
	@diff tex/tripos.tex tripos.tex
	@diff tex/8terminal.tex 8terminal.tex
	@perl -i -pe 's/\(HINT\) //'trip.log
	@sed -i -f triplog.sed trip.log
	@perl -i -pe 'BEGIN{$$x=`grep 0x80 ../mapping`;$$x=~s/.*\x27(.*)\x27;\n/$$1/}s/$$x/^^80/ if$$x' trip.log
	@perl -i -pe 'BEGIN{$$x=`grep 0x82 ../mapping`;$$x=~s/.*\x27(.*)\x27;\n/$$1/}s/$$x/^^82/ if$$x' trip.log
	@perl -i -pe 'BEGIN{$$x=`grep 0x83 ../mapping`;$$x=~s/.*\x27(.*)\x27;\n/$$1/}s/$$x/^^83/ if$$x' trip.log
	@diff tex/trip.log trip.log
	@perl -i -pe 's/\(HINT\) //' trip.fot
	@perl -i -l -0777 -pe 's/\n$$//' trip.fot
	@sed -i -f tripfot.sed trip.fot
	@diff tex/trip.fot trip.fot
	@echo
	@echo Passed.
	@echo
