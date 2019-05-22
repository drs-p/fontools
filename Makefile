.PHONY: dist

VERSION=$(shell git describe master)
dist:
	if [ "x$(shell git branch | grep '* master')" != 'x* master' ]; then \
		echo >&2 "ERROR: not on 'master' branch"; \
		exit 1; \
	fi
	if [ "x$(shell git status --short)" != "x" ]; then \
		echo >&2 "ERROR: git not up-to-date"; \
		exit 1; \
	fi
	rm -rf fontools/
	mkdir -p fontools/doc
	cp -r bin/ share/ GPLv2.txt README fontools/
	sed -i "s:__VERSION__:$(VERSION):g" fontools/bin/afm2afm
	sed -i "s:__VERSION__:$(VERSION):g" fontools/bin/autoinst
	sed -i "s:__VERSION__:$(VERSION):g" fontools/bin/ot2kpx
	for name in afm2afm autoinst ot2kpx; do \
		pod2man --center="Marc Penninga" --release="fontools" --section=1 \
			fontools/bin/$${name} - \
		| groff -Tps -man - \
		| ps2pdf - fontools/doc/$${name}.pdf; \
	done
	chmod -R go+rX fontools/
	zip -r fontools-$(VERSION) fontools
	rm -rf fontools/
