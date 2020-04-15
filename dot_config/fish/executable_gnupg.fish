set -x GPG_TTY (tty)

set -e SSH_AUTH_SOCK
set -U -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

gpg-connect-agent updatestartuptty /bye
