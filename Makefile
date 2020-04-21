include $(shell find Makefiles -name '*.mk' | sort)

system-update: packages-update nvim-update tmux-plugins-update fisher-update

