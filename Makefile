PDFVIEWER := okular

all: build pub

# TODO: Option to weave to HTML instead of XeTeX

tex:
	mkdir -p doc
	noweave -delay totero.nw > doc/totero.tex

code:
	mkdir -p src
	notangle -Rtotero.m totero.nw > src/totero.m

pub: tex
	cd doc && xelatex totero
	cd doc && xelatex totero
view: pub
	cd doc && $(PDFVIEWER) totero.pdf

build: code
	mkdir -p bin
	cd src && mmc --make totero
	mv src/totero bin/

build_debug: code
	mkdir -p bin
	cd src && mmc -E --debug --grade=asm_fast.gc.debug.stseg totero
	mv src/totero bin/totero_dbg

run: build
	./bin/totero

debug: build_debug
	./bin/totero_dbg

clean:
	rm -rf Mercury src bin doc
