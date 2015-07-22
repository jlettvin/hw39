#!/usr/bin/env make all
# Makefile runs many asm hello worlds.
# See wiki.osdev.org/Tool_Comparison
#_____________________________________
A=yasm nasm clang
F=-macosx_version_min 10.7.0 -e _main
as_yasm=  -f macho64 -DDARWIN
as_nasm=  -f macho
as_clang= -arch i386 -c
ld_yasm=  $(F)
ld_nasm=  $(F)
ld_clang= $(F) -no_pie -arch i386
__=echo \
"____________________________________"

define ASM
	$(__);\
	echo "assembler: $(1)";\
	$1 $(as_$1) -o hw_$1.o hw_$1.asm;\
	ld $(ld_$1) -o hw_$1 hw_$1.o;\
	rm -f hw_$1.o; strip hw_$1;\
	./hw_$1;
endef

#_____________________________________
.PHONY: all
all: Makefile
	@-$(foreach a,$(A),$(call ASM,$a))
	@$(__)

#_____________________________________
.PHONY: clean
clean:
	@$(__)
	@-rm -f *.o; echo rm intermediates
	@-$(foreach a,$(A),rm -f hw_$a)
	@tar czf hw.tgz --exclude hw.tgz *
	@$(__)
#_____________________________________
