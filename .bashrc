export SVN_EDITOR="vim"
export EDITOR="vim"

# Aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias l='ls'
alias theia='podman run -p 3000:3000 theiaide/theia-java'
alias code='codium'

# Needed to get vim to work in alacritty
export TERM=xterm-256color

# Status line
. ~/git-prompt.sh # https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='`printf "\\001\\033\033[1;31m\\002"``printf "\\001\\033[1;37m\\002"``printf "\\001\\033[41m\\002"``pwd | grep -Eoe "[^/]+$"``printf "\\001\\033[0;31m\\002"``printf "\\001\\033[46m\\002"``printf "\\001\\033[0;30m\\002"``printf "\\001\\033[46m\\002"``__git_ps1 "%s"``printf "\\001\\033[0m\\002"``printf "\\001\\033[0;36m\\002"``printf "\\001\\033[0m\\002"` '
