all:
	@make -C .. triptex
	@rm -f trip.log trip.fmt
	@/bin/echo -e '\n\\input trip' | ./triptex >/dev/null || true
	@sed -i -f tripin.sed trip.log
	@diff tex/tripin.log trip.log
	@rm -f 8terminal.tex tripos.tex trip.dvi trip.log
	@echo ' &trip  trip ' | ./triptex >trip.fot || true
	@dvitype -output-level=2 -page-start='*.*.*.*.*.*.*.*.*.*' -max-pages=1000000 -dpi=72.27 -magnification=0 trip.dvi >trip.typ
	@sed -i -f triptyp.sed trip.typ
	@diff tex/trip.typ trip.typ
	@diff tex/tripos.tex tripos.tex
	@diff tex/8terminal.tex 8terminal.tex
	@sed -i -f triplog.sed trip.log
	@#these perl commands allow to avoid regenerating tex.w without printable.ch ("printable" condition from §49 of tex.web cannot be changed in tex.w - it must be changed in web2w)
	@perl -i -pe 'BEGIN{$$x=`grep 0x80 ../mapping`;$$x=~s/.*\x27(.*)\x27;\n/$$1/}s/$$x/^^80/ if$$x' trip.log
	@perl -i -pe 'BEGIN{$$x=`grep 0x82 ../mapping`;$$x=~s/.*\x27(.*)\x27;\n/$$1/}s/$$x/^^82/ if$$x' trip.log
	@perl -i -pe 'BEGIN{$$x=`grep 0x83 ../mapping`;$$x=~s/.*\x27(.*)\x27;\n/$$1/}s/$$x/^^83/ if$$x' trip.log
	@diff tex/trip.log trip.log
	@sed -i -f tripfot.sed trip.fot
	@diff tex/trip.fot trip.fot
	@echo
	@echo Passed.
	@echo
