SOURCES=.Xdefaults \
		.aliases \
		.blazerc \
		.env \
		.fonts.conf \
		.git5rc \
		.gitconfig \
		.gitignore_global \
		.gitk \
		.msmtprc \
		.muttrc \
		.offlineimap.py \
		.offlineimaprc \
		.tmux.conf \
		.vimrc \
		.xmonad \
		.xsession \
		.zshrc \
		.config/powerline

TARGETS=$(addprefix ~/, $(SOURCES))

.PHONY: install

install: $(TARGETS)

~/%: %
	- mkdir p $(dir $@)
	ln -s ~/dotfiles/$< $@
