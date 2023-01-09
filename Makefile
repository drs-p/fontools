.PHONY: dist

YEAR=$(shell date +"%Y")
VERSION=$(shell git describe main)

dist:
	if [ "x$(shell git branch | grep '* main')" != "x* main" ]; then \
		echo >&2 "[WARNING] not on 'main' branch"; \
	fi
	if [ "x$(shell git describe | grep '-')" != "x" ]; then \
		echo >&2 "[WARNING] release not tagged"; \
	fi
	if [ "x$(shell git status --short)" != "x" ]; then \
		echo >&2 "[ERROR] git repository not up-to-date"; \
		exit 1; \
	fi
	rm -rf fontools/
	mkdir -p fontools/doc
	cp -r bin/ share/ GPLv2.txt README fontools/
	for name in afm2afm autoinst ot2kpx splitttc; do \
		sed -i "s:__YEAR__:$(YEAR):g" fontools/bin/"$${name}"; \
		sed -i "s:__VERSION__:$(VERSION):g" fontools/bin/"$${name}"; \
		pod2man --center="Marc Penninga" --release="fontools" --section=1 \
			fontools/bin/$${name} - \
		| groff -Tps -man - \
		| ps2pdf - fontools/doc/$${name}.pdf; \
	done
	sed -i "s:__YEAR__:$(YEAR):g" fontools/README
	chmod -R go+rX fontools/
	zip -r fontools-$(VERSION) fontools
	rm -rf fontools/
