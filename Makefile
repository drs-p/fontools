.PHONY: dist

VERSION=$(shell git describe master)

dist:
	if [ "x$(shell git branch | grep '* master')" != "x* master" ]; then \
		echo -e >&2 "\e[31m[WARNING] not on 'master' branch\e[0m"; \
	fi
	if [ "x$(shell git describe | grep '-')" != "x" ]; then \
		echo -e >&2 "\e[31m[WARNING] release not tagged\e[0m"; \
	fi
	if [ "x$(shell git status --short)" != "x" ]; then \
		echo -e >&2 "\e[31m[ERROR] git repository not up-to-date\e[0m"; \
		exit 1; \
	fi
	rm -rf fontools/
	mkdir -p fontools/doc
	cp -r bin/ share/ GPLv2.txt README fontools/
	for name in afm2afm autoinst ot2kpx splitttc; do \
		sed -i "s:__VERSION__:$(VERSION):g" fontools/bin/"$${name}"; \
		pod2man --center="Marc Penninga" --release="fontools" --section=1 \
			fontools/bin/$${name} - \
		| groff -Tps -man - \
		| ps2pdf - fontools/doc/$${name}.pdf; \
	done
	chmod -R go+rX fontools/
	zip -r fontools-$(VERSION) fontools
	rm -rf fontools/
