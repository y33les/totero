PDFVIEWER := okular

all: build pub

# TODO: Option to weave to HTML instead of XeTeX
# TODO: Option to publish ebook or print book (assume ebook for now)

tex:
	mkdir -p doc
	noweave -delay opcodes.nw > doc/opcodes.tex
	noweave -delay hello.nw > doc/hello.tex
	noweave -delay totero.nw > doc/totero.tex

code:
	mkdir -p src
	notangle -Ropcodes.m opcodes.nw > src/opcodes.m
	notangle -Rhello.m hello.nw > src/hello.m
	notangle -Rtotero.m totero.nw > src/totero.m

pub: tex
	cd doc && pdflatex totero
	cd doc && pdflatex totero
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
