#!/bin/bash

YEAR=$(date +"%Y")
VERSION=$(git describe main)

if [ "$(git branch | grep '* main')" != "* main" ]; then \
	echo >&2 "[WARNING] not on 'main' branch"; \
fi
if [ "$(git describe | grep '-')" != "" ]; then \
	echo >&2 "[WARNING] release not tagged"; \
fi
if [ "$(git status --short)" != "" ]; then \
	echo >&2 "[ERROR] git repository not up-to-date"; \
	exit 1; \
fi
rm -rf fontools/ fontools-$VERSION.zip
mkdir -p fontools/doc
cp -r bin/ share/ LICENSE README.md fontools/
for name in afm2afm autoinst ot2kpx splitttc; do \
	sed -i "s:__YEAR__:$YEAR:g" fontools/bin/$name; \
	sed -i "s:__VERSION__:$VERSION:g" fontools/bin/$name; \
	pod2man --center="Marc Penninga" --release="fontools" --section=1 \
		fontools/bin/$name - \
	| groff -Tps -man - \
	| ps2pdf - fontools/doc/$name.pdf; \
done
sed -i "s:__YEAR__:$YEAR:g" fontools/README.md
chmod -R go+rX fontools/
zip -r fontools-$VERSION fontools
rm -rf fontools/
