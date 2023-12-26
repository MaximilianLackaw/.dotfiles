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
alias gA='git add -A'
alias gl='git log'
alias gci='git commit'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gpp='git pp'
alias gitv='GIT_EDITOR=vim git'

# Docker
alias dkps="docker ps"
alias dkst="docker stats"
alias dkpsa="docker ps -a"
alias dkimgs="docker images"
alias dkcpup="docker-compose up -d"
alias dkcpdown="docker-compose down"
alias dkcpstart="docker-compose start"
alias dkcpstop="docker-compose stop"

# apt
alias aptu='sudo apt update'
alias apti='sudo apt install'
alias aptug='sudo apt upgrade'


# ls (lsd)
alias l='lsd'
alias ll='l -l'
# alias ll='ls -l'
alias lla='ll -a'
alias la='l -a'

# zsh
alias editzshconfig='code ~/.zshrc'
alias editzshalias='code ~/Nextcloud/Settings/zsh/aliases.zsh'
alias reload='source ~/.zshrc'

#misc
alias hist='history 1 | grep `$1`'
alias cat='batcat -n'
alias free='free -m'
alias copy="tr -d '\n' | pbcopy"
alias pwdc='pwd | copy'  # copy current dir to clipboard
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias copydir='echo $PWD | pbcopy'
alias open='xdg-open' # WSL: install wslu and `sudo ln -s ../../bin/wslview /usr/local/bin/xdg-open`
alias more=less
alias autossh-default='autossh -M 0 -f -T -N'
alias fixclock='sudo hwclock -s' # relevant for WSL after sleep

# fixes for things which are not features but bugs
# alias history='history 1'
