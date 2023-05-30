all:
	make -C web2w
	sed '194,199s/\(year\|month\|day\|time\)\b/sys_&/g' utex.patch|patch -so tex.w web2w/ctex.w
	tie -c tex.ch tex.w constants.ch special.ch paper+origin.ch log.ch $(CHF) >/dev/null
	ctangle tex tex
	gcc -DINIT tex.c -o initex -lm
	@./initex 'plain \input paper+origin \def\\{\nobreak\hskip0pt-\nobreak\hskip0pt\relax} \setbox0=\box1 \dump' >/dev/null && mv plain.fmt TeXformats/
	@./initex 'тех \input paper+origin \def\\{\nobreak\hskip0pt-\nobreak\hskip0pt\relax} \setbox0=\box1 \dump' >/dev/null && mv тех.fmt TeXformats/
	gcc -DSTAT tex.c -o virtex -lm
	@gcc -o newline newline.c

triptex:
	@[ $(MAKELEVEL) = 1 ]
	make -C web2w
	sed '194,199s/\(year\|month\|day\|time\)\b/sys_&/g' utex.patch|patch -so tex.w web2w/ctex.w
	tie -c tex.ch tex.w trip/constants.ch $(CHF) >/dev/null
	ctangle tex tex
	gcc -DINIT -DSTAT tex.c -o trip/triptex -lm

CHF=charset.ch path.ch interrupt.ch arg.ch print.ch preload.ch time.ch edit.ch name.ch exit.ch verify.ch close.ch
