SOURCES=\
		.Xdefaults \
		.aliases \
		.blazerc \
		.config/powerline \
		.config/terminator \
		.dircolors \
		.env \
		.fonts.conf \
		.git-prompt.sh \
		.git5rc \
		.gitconfig \
		.gitignore_global \
		.gitk \
		.gnupg/gpg-agent.conf \
		.gnupg/gpg.conf \
		.inputrc \
		.msmtprc \
		.muttrc \
		.offlineimap.py \
		.offlineimaprc \
		.signature \
		.ssh/config \
		.tmux.conf \
		.vimrc \
		.xmonad \
		.xmobarrc \
		.xsession \
		.zshrc \

# git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
# sudo apt-get install atool

TARGETS=$(addprefix ~/, $(SOURCES))

.PHONY: install

install: $(TARGETS)

~/%: %
	- mkdir -p $(dir $@)
	ln -s ~/dotfiles/$< $@
