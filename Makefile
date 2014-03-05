SOURCES=\
		.Xdefaults \
		.aliases \
		.blazerc \
		.config/powerline \
		.config/terminator \
		.dir_colors \
		.env \
		.emacs \
		.fonts.conf \
		.git-prompt.sh \
		.git5rc \
		.gitconfig \
		.gitignore_global \
		.gitk \
		.gnupg/gpg-agent.conf \
		.gnupg/gpg.conf \
		.inputrc \
		.liquidpromptrc \
		.msmtprc \
		.muttrc \
		.offlineimap.py \
		.offlineimaprc \
		.signature \
		.ssh/config \
		.tmux.conf \
		.vim/mysnippets \
		.vimrc \
		.xmobarrc \
		.xmonad \
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
