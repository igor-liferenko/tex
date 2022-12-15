all:
	make -C web2w
	sed '194,199s/\(year\|month\|day\|time\)\b/sys_&/g' utex.patch|patch -so tex.w web2w/ctex.w
	tie -c tex.ch tex.w constants.ch special.ch paper+origin.ch $(CHF) >/dev/null
	CWEBINPUTS=~/cweb ctangle ./tex ./tex
	gcc -DINIT tex.c -o initex -lm
	./initex 'plain \input paper+origin \dump' >/dev/null && mv plain.fmt TeXformats/
	./initex 'тех \input paper+origin \dump' >/dev/null && mv тех.fmt TeXformats/
	gcc -DSTAT tex.c -o virtex -lm

triptex:
	@[ $(MAKELEVEL) = 1 ]
	make -C web2w
	sed '194,199s/\(year\|month\|day\|time\)\b/sys_&/g' utex.patch|patch -so tex.w web2w/Ctex.w
	tie -c tex.ch tex.w trip/constants.ch $(CHF) >/dev/null
	CWEBINPUTS=~/cweb ctangle ./tex ./tex
	gcc -DINIT -DSTAT tex.c -o trip/triptex -lm

CHF=charset.ch path.ch interrupt.ch arg.ch print.ch preload.ch time.ch verify.ch edit.ch name.ch exit.ch
