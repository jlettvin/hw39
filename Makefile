#!/usr/bin/env make
# Makefile assembles many hello worlds
# jlettvin 20150724
# See wiki.osdev.org/Tool_Comparison
#_____________________________________
__=echo \
"____________________________________"
OS=$(shell uname)
SRC=$(foreach a,$(AS),hw_$a.asm)
export

.PHONY: all
.PHONY: clean
ifdef AS
ifdef O #_____________________________
all:
	@-$(MAKE) -f $(OS).mk $(OS)

clean:
	@$(__)
	@-rm -f *$O; echo rm intermediates
	@-rm -f $(foreach a,$(AS),hw_$a)
	@tar czf hw.tgz --exclude hw.tgz *
	@$(__)
else #________________________________
all:
	@-$(MAKE) -f $(OS).mk $(OS)

clean:
	@-$(MAKE) -f $(OS).mk clean
endif
else #________________________________
all:
	@-$(MAKE) -f $(OS).mk $(OS)

clean:
	@-$(MAKE) -f $(OS).mk clean
endif
#_____________________________________
