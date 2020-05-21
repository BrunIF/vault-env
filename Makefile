
BIN ?= vault-ent-local
PREFIX ?= /usr/local

install:
	cp *.sh $(PREFIX)/bin/$(BIN)

uninstall:
	rm -rf $(PREFIX)/bin/$(BIN)

.PHONY: install

