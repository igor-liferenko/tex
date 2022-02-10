all:
ifeq ($(MAKELEVEL),2) # for TRIP
	ctangle web2w time
else
	cp web2w.w web2w-merged.w
	for i in time.ch printable.ch; do \
	  CWEBINPUTS=/home/user/cweb wmerge -h web2w-merged.w $$i >out.w || exit; \
	  mv out.w web2w-merged.w; done
	ctangle web2w-merged - web2w
endif
	flex -o web.lex.c web.l
	bison --warnings=none -d -v pascal.y
	gcc -o web2w web2w.c web.lex.c pascal.tab.c
	patch -so tex-2021.web tex.web 2021.patch
	./web2w -o ctex.w tex-2021.web
	sed '55,63d;631,636s/\(time\|day\|month\|year\)\b/sys_&/g;817{s/13/7/g;h};826{H;G}' ctex.patch | patch -s --no-backup-if-mismatch ctex.w
