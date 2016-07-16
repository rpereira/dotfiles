MAN1_MD = $(wildcard *.1.md)

dotfiles = $(HOME)/.dotfiles
mandir   = $(dotfiles)/man
man1dir  = $(mandir)/man1

install:
	install -d -m 755 $(DESTDIR)$(man1dir)
	pandoc -s -t man git-unpushed.1.md -o man1/git-unpushed.1
	pandoc -s -t man mac.1.md -o man1/mac.1
	pandoc -s -t man ports.1.md -o man1/ports.1

print-man1:
	@for i in $(MAN1_MD); do \
		echo "$(patsubst %md,%,$$i)"; \
	done
