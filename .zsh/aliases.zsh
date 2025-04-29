# cd
alias cd..='cd ..' ## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../'
alias .4='cd ../../../'
alias .5='cd ../../../../'

# tmux
alias tm='tmux'
alias tmls='tmux ls'
alias tma='tmux attach-session -t $1'
alias tmn='tmux new -s $1'

# git
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gA='git add -A'
alias gl='git log'
alias gci='git commit'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gpp='git pp'
alias gitv='GIT_EDITOR=vim git'

# NPM/Node
alias nr='npm run'

# Docker
alias dkps="docker ps"
alias dkst="docker stats"
alias dkpsa="docker ps -a"
alias dkimgs="docker images"
alias dkcpup="docker-compose up -d"
alias dkcpdown="docker-compose down"
alias dkcpstart="docker-compose start"
alias dkcpstop="docker-compose stop"
alias dkcprestart="docker-compose down && docker-compose up -d"

# apt
alias aptu='sudo apt update'
alias apti='sudo apt install'
alias aptug='sudo apt upgrade'

# add parameters to common commands
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

#misc
alias svi='sudo vim'
alias svim='sudo vim'
alias bd='cd "$OLDPWD"'
if command -v fzf &> /dev/null
then
  alias f="find . | fzf "
else
  alias f="find . | grep `$1`"
fi
alias hist='history 1 | grep `$1`'

if command -v batcat &> /dev/null
then
  alias cat='batcat -n'
elif command -v bat &> /dev/null
then
  alias cat='bat -n'
fi
alias df='df -h -x overlay'

alias free='free -m'

if command -v xdg-open &> /dev/null
then
  alias open='xdg-open' # WSL: install wslu and `sudo ln -s ../../bin/wslview /usr/local/bin/xdg-open`
fi

alias fixclock='sudo hwclock -s' # relevant for WSL after sleep
alias reload='source ~/.zshrc'
