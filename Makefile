SOURCES=\
		.Xdefaults \
		.aliases \
		.blazerc \
		.config/powerline \
		.config/terminator \
		.env \
		.fonts.conf \
		.git5rc \
		.gitconfig \
		.gitignore_global \
		.gitk \
		.gnupg/gpg-agent.conf \
		.gnupg/gpg.conf \
		.msmtprc \
		.muttrc \
		.offlineimap.py \
		.offlineimaprc \
		.signature \
		.ssh/config \
		.tmux.conf \
		.vimrc \
		.xmonad \
		.xsession \
		.zshrc \

TARGETS=$(addprefix ~/, $(SOURCES))

.PHONY: install

install: $(TARGETS)

~/%: %
	- mkdir -p $(dir $@)
	ln -s ~/dotfiles/$< $@
