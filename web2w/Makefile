all:
	tie -c web2w.ch web2w.w tab.ch pstring.ch reserved.ch `[ $(MAKELEVEL) = 2 ] || echo printable.ch hex.ch` web2w-tex.ch >/dev/null
	ctangle web2w web2w
	patch -so web-tex.l web.l web-tex.patch
	flex -o web.lex.c web-tex.l
	patch -so pascal-tex.y pascal.y pascal-tex.patch
	bison --warnings=none -d -v pascal-tex.y
	gcc -o web2w web2w.c web.lex.c pascal-tex.tab.c
	cp tex.web tex-web2w.web
	@sed -i 's/"@@"/"@"/' tex-web2w.web
	@sed -i "s/\([(,]\)'\([ s]\)'/\1'\2_'/" tex-web2w.web
	./web2w -o ctex.w tex-web2w.web
	@sed -i "s/'@'/'@@'/" ctex.w
	@sed -i 's/: 1\b//g;s/,"\(.[^@]\)/, "\1/g;s/"\(.\)_"/"\1"/g' ctex.w
	sed -n -f pool.sed ctex.w | sed -i -f - ctex.w
	sed -i '/@d str_[0-9]\+ /s^\\^\\\\^g' ctex.w
	patch -s ctex.w ctex.patch
