DOTFILES = \
	Makefile* \
	.config/nvim/init.vim \
	.config/i3* \
	.config/fish/ \
	.config/zathura/zathurarc \
	.tmux* \
	.local/share/fonts \
	.profile

OUTPUT_DOTFILES_BACKUP = dot.zip

backup-dotfiles:
> zip -r $(OUTPUT_DOTFILES_BACKUP) $(DOTFILES)

