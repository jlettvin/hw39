Hello World! assembler
======================
# hw39
hello world assembler in 39x39 blocks.

Once you have cloned this repository;
build and run the executables, check
their output, and review file sizes.
Then restore the file set to original.

```
MacBookPro$ make
MacBookPro$ ls -al
MacBookPro$ make clean
```

Specialized for Mac OS X only for now.

This repository explores syntax for
three assemblers (clang, nasm, yasm)
to illustrate similarities and diffs.

Future development on other platforms
simply needs \`uname\`.mk to exist and
have contents appropriate to its needs.

Makefile and \`uname\`.mk are related
by export and/or include conditionally.
An unfortunately tricky relationship.

make does recursive $(MAKE) -f {}.mk
which then includes Makefile.
Presence of exported variables serve
as guards against incorrect operation.

The repository has 3 ASM source files.
They match logically line-by-line.
Compare syntax. Not much is different.
Deeper comparisons would expose more.
