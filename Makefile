all:
	sed '194,199s/\(year\|month\|day\|time\)\b/sys_&/g' utex.patch|patch -so tex.w web2w/ctex.w
	for i in constants.ch special.ch pdf.ch origin.ch $(CHF); do \
	  CWEBINPUTS=/home/user/cweb wmerge tex.w $$i >out.w || exit; mv out.w tex.w; done
	ctangle tex
	gcc -DINIT tex.c -o initex -lm
	@./initex 'plain \input origin \dump' >/dev/null; mv plain.fmt TeXformats/
	@./initex 'тех \input origin \dump' >/dev/null; mv тех.fmt TeXformats/
	gcc -DSTAT tex.c -o virtex -lm

triptex:
	sed '194,199s/\(year\|month\|day\|time\)\b/sys_&/g' utex.patch|patch -so tex.w web2w/ttex.w
	for i in trip/constants.ch $(CHF); do \
	  CWEBINPUTS=/home/user/cweb wmerge tex.w $$i >out.w || exit; mv out.w tex.w; done
	ctangle tex
	gcc -DINIT -DSTAT tex.c -o trip/triptex -lm

CHF=path.ch interrupt.ch arg.ch print.ch editor.ch preload.ch time.ch verify.ch exit.ch lm.ch
