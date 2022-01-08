set -x EDITOR "code -w"
set -x PATH $PATH ~/go/bin ~/.cargo/bin ~/.gem/ruby/2.6.0/bin ~/.config/yarn/global/node_modules/.bin ~/.dotnet/tools
set --universal nvm_default_version latest
set -x DOCKER_BUILDKIT 1

status --is-interactive; and source (pyenv init -|psub)

set -x GPG_TTY (tty)
set -U -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpg-connect-agent updatestartuptty /bye > /dev/null

# if command -v tmux > /dev/null && ! set -q TMUX && status is-interactive
#     exec tmux new-session -A -s default
# end

# Enable vi bindings + tweaks to still use Ctrl-F, Ctrl-N, Ctrl-P
fish_vi_key_bindings
for mode in insert default visual
	bind -M $mode \cf forward-char
    bind -M $mode \cp up-or-search
    bind -M $mode \cn down-or-search
end


# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true
