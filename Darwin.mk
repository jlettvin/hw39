#!/usr/bin/env make
# Darwin.mk assembles for Mac OS X
# jlettvin 20150724
#_____________________________________
AS=clang nasm yasm
O=.o
export

#_____________________________________
ifndef A
include Makefile
endif

#_____________________________________
define ASM
	$(__);\
	echo "assembler: $(1)";\
	$1 $(as_$1) -o hw_$1$O hw_$1.asm;\
	ld $(ld_$1) -o hw_$1 hw_$1$O;\
	rm -f hw_$1$O; strip hw_$1;\
	./hw_$1;
endef

#_____________________________________
M=-macosx_version_min 10.7.0 -e _main

as_yasm = -f macho64 -DDARWIN
as_nasm = -f macho
as_clang= -arch i386 -c

ld_yasm = $(M)
ld_nasm = $(M)
ld_clang= $(M) -no_pie -arch i386

#_____________________________________
Darwin: Makefile Darwin.mk $(SRC)
	@$(foreach a,$(AS),$(call ASM,$a))
	@$(__)
#_____________________________________
