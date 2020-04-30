set -x EDITOR nvim
set -x PATH $PATH ~/go/bin ~/.cargo/bin ~/.gem/ruby/2.6.0/bin ~/.config/yarn/global/node_modules/.bin

source /usr/share/autojump/autojump.fish

status --is-interactive; and source (pyenv init -|psub)

set -x GPG_TTY (tty)
set -U -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpg-connect-agent updatestartuptty /bye > /dev/null

if command -v tmux > /dev/null && ! set -q TMUX && status is-interactive
    exec tmux new-session -A -s default
end

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true
