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
	for script in bin/*; do \
		pod2man --center="Marc Penninga" --release="fontools" --section=1 \
			$script - | groff -Tps -man - | ps2pdf - doc/$(basename script); \
	done
	(cd ..; zip -r fontools-$(shell date +'%Y%m%d') fontools -x fontools/.git\* fontools/Makefile)
