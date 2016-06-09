NULLCMD = :

all:    Makefile
static::
.PHONY: all install static install-so install-rb
.PHONY: clean clean-so clean-static clean-rb

clean-static::
clean-rb-default::
clean-rb::
clean-so::
clean::
distclean-rb-default::
distclean-rb::
distclean-so::
distclean-static::
distclean::

realclean: distclean
install: install-so install-rb

install-so: Makefile
install-rb: pre-install-rb install-rb-default
install-rb-default: pre-install-rb-default
pre-install-rb: Makefile
pre-install-rb-default: Makefile
pre-install-rb-default:
	@$(NULLCMD)

site-install: site-install-so site-install-rb
site-install-so: install-so
site-install-rb: install-rb
