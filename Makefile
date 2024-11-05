# .dotfiles targets

PKGS=$(shell find . -mindepth 1 -maxdepth 1 -not -name ".*" -type d -printf '%P\n')

.PHONY: install
install:
	$(foreach pkg, $(PKGS), stow $(pkg);)

.PHONY: uninstall
clean:
	$(foreach pkg, $(PKGS), stow -D $(pkg);)
