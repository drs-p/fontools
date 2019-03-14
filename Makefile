.PHONY: dist

dist:
	(cd ..; zip -r fontools-$(shell date +'%Y%m%d') fontools -x fontools/.git\* fontools/Makefile)
