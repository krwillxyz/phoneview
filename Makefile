PREFIX ?= $(HOME)/.local
BINDIR ?= $(PREFIX)/bin

install:
	@mkdir -p $(BINDIR)
	@cp phoneview $(BINDIR)/phoneview
	@chmod +x $(BINDIR)/phoneview
	@echo "Installed to $(BINDIR)/phoneview"

uninstall:
	@rm -f $(BINDIR)/phoneview
	@echo "Removed $(BINDIR)/phoneview"
