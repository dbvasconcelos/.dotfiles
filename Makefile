# .dotfiles targets

DIRS=$(shell find . -mindepth 1 -maxdepth 1 -not -name ".*" -type d -printf '%P\n')

install:
	$(foreach dir, $(DIRS), stow -v -t "${HOME}" $(dir);)

clean:
	$(foreach dir, $(DIRS), stow -v -t "${HOME}" -D $(dir);)

.PHONY: install clean
