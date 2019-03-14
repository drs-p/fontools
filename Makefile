.PHONY: dist

dist:
	(cd ..; zip -r fontools fontools -x fontools/.git\* fontools/Makefile)
