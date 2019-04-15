.PHONY: dist

dist:
	if [ "xx$(shell git branch | grep '* master')" == "xx" ]; then \
		echo >&2 "ERROR: not on 'master' branch"; \
		exit 1; \
	fi
	if [ "xx$(shell git status --short)" != "xx" ]; then \
		echo >&2 "ERROR: git not up-to-date"; \
		exit 1; \
	fi
	pod2man --center="Marc Penninga" --release="fontools" --section=1 \
		bin/afm2afm - | groff -Tps -man - | ps2pdf - doc/afm2afm.pdf
	pod2man --center="Marc Penninga" --release="fontools" --section=1 \
		bin/autoinst - | groff -Tps -man - | ps2pdf - doc/autoinst.pdf
	pod2man --center="Marc Penninga" --release="fontools" --section=1 \
		bin/ot2kpx - | groff -Tps -man - | ps2pdf - doc/ot2kpx.pdf
	(cd ..; zip -r fontools-$(shell date +'%Y%m%d') fontools -x fontools/.git\* fontools/Makefile)
