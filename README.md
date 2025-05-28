# Totero: A literate CHIP-8 emulator in Mercury

> **Tot**/**er**/**o**: (Esperanto) The smallest part of the god Thoth, who was the ancient Egyptian equivalent of the Greek Hermes and the Roman Mercury.  **A _chip_ off the old Thoth, as it were.**,

Totero is a [literate](https://en.wikipedia.org/wiki/Literate_programming) [Mercury](https://www.mercurylang.org/) program emulating the [CHIP-8](https://en.wikipedia.org/wiki/CHIP-8) fantasy system.

This project fulfils three purposes&ndash;

- To develop something substantial using Mercury
- To develop a substantial literate program
- To add to the scant learning resources for Mercury

# Building

Totero is built using [noweb](https://www.cs.tufts.edu/~nr/noweb/), meaning that its documentation and code are written together in `.nw` files.  Before building either the code or the documentation, the code must be 'tangled' out into traditional source files, and the documentation must be 'woven' into XeTeX source.  A Makefile is provided to simplify this process:

- `make` will build the `totero` executable in `bin/` and `totero.pdf` in `doc/`
- `make code` will tangle the code into Mercury source files in `src/`
- `make tex` will weave the documentation into XeTeX source files in `doc/`
- `make clean` will revert the directory to its original state (no `bin/`, `doc/`, &c.)

## Dependencies

I have built Totero under Mercury 22.01.8.  The source distribution for this version can be found [here](http://dl.mercurylang.org/index.html).

Totero makes use of `mercury_allegro`, which you will need to build yourself.  It can be found in `extras/graphics/mercury_allegro` in the Mercury source distribution.  `mercury_allegro` is dependent on Allegro 4, which can be found [here](https://liballeg.org/old.html) (I've tested Totero against Allegro 4.4.3.1, the final release of Allegro 4).

The documentation is built with [noweb 2.13](https://github.com/nrnrnr/noweb/releases/tag/v2_13) and [XeTeX](https://xetex.sourceforge.net/).  **You must copy or symlink `noweb.sty` into this directory before building the documentation.**

> **N.B.:** Make sure that Mercury, Allegro and noweb and their respective libraries are in your `$PATH`, `$LIBRARY_PATH` and `$LD_LIBRARY_PATH`!  I added the following lines to my `~/.bashrc` based on my installations:
> ```bash
> export PATH=$PATH:/usr/local/mercury-22.01.8/bin:/usr/local/noweb
> export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/lib:/usr/local/noweb/lib
> export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/local/noweb/lib
> ```
