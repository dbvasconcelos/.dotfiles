# .dotfiles targets

DIRS=$(shell find . -mindepth 1 -maxdepth 1 -not -name ".*" -type d -printf '%P\n')

.PHONY: install
install:
	$(foreach dir, $(DIRS), stow -v -t "${HOME}" $(dir);)

.PHONY: clean
clean:
	$(foreach dir, $(DIRS), stow -v -t "${HOME}" -D $(dir);)
