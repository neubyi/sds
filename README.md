sds — Simple Drop Service
-------------------------------------------------------------------------------
%%VERSION%%

sds is TODO

sds is distributed under a BSD license, see LICENSE.md.

Homepage: https://github.com/neubyi/sds

## Installation

sds can be installed with `opam`:

    opam install sds

If you don't use `opam` consult the [`opam`](opam) file for build
instructions.

## Documentation

The documentation and API reference is generated from the source
interfaces. It can be consulted [online][doc] or via `odig doc
sds`.

[doc]: https://neubyi.github.io/sds/doc

## Sample programs

If you installed sds with `opam` sample programs are located in
the directory `opam opam show -f doc sds`.

In the distribution sample programs and tests are located in the
[`test`](test) directory. They can be built and run
with:

    topkg build --tests true && topkg test 
