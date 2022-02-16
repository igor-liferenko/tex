all:
	make -C web2w
	sed '194,199s/\(year\|month\|day\|time\)\b/sys_&/g' utex.patch|patch -so tex.w web2w/ctex.w
	tie -c tex.ch tex.w constants.ch special.ch pdf.ch origin.ch $(CHF) >/dev/null
	CWEBINPUTS=/home/user/cweb ctangle ./tex ./tex
	gcc -DINIT tex.c -o initex -lm
	@./initex 'plain \input origin \dump' >/dev/null; mv plain.fmt TeXformats/
	@./initex 'тех \input origin \dump' >/dev/null; mv тех.fmt TeXformats/
	gcc -DSTAT tex.c -o virtex -lm

triptex:
	make -C web2w
	sed '194,199s/\(year\|month\|day\|time\)\b/sys_&/g' utex.patch|patch -so tex.w web2w/ttex.w
	tie -c tex.ch tex.w trip/constants.ch $(CHF) >/dev/null
	CWEBINPUTS=/home/user/cweb ctangle ./tex ./tex
	gcc -DINIT -DSTAT tex.c -o trip/triptex -lm

CHF=path.ch interrupt.ch arg.ch print.ch editor.ch preload.ch time.ch verify.ch exit.ch lm.ch
