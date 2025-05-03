if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$PATH:$HOME/.local/bin"
fi

if [ -d "$HOME/.cargo/bin" ] ; then
  PATH="$PATH:$HOME/.cargo/bin"
fi

# ---- aliases ---------------------

## tmux
alias tm='tmux'
alias tmls='tmux ls'
alias tma='tmux attach-session -t $1'
alias tmn='tmux new -s $1'
alias mux='tmux new -A -s base-remote'

## Docker
alias dkps="docker ps"
alias dkst="docker stats"
alias dkpsa="docker ps -a"
alias dkimgs="docker images"
alias dkcpup="docker-compose up -d"
alias dkcpdown="docker-compose down"
alias dkcpstart="docker-compose start"
alias dkcpstop="docker-compose stop"
alias dkcprestart="docker-compose down && docker-compose up -d"

## apt
alias aptu='sudo apt update'
alias apti='sudo apt install'
alias aptug='sudo apt upgrade'

## add parameters to common commands
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

## ls
if command -v eza &> /dev/null; then
  alias l='eza --icons=auto'
elif command -v lsd &> /dev/null; then
  alias l='lsd'
else
  alias l='ls -h'
fi

alias ll='l -l --group-directories-first'
alias lla='ll -A'
alias la='l -A'

## misc
alias svi='sudo vim'
alias svim='sudo vim'
alias bd='cd "$OLDPWD"'
alias df='df -h -x overlay'
alias free='free -m'
alias reload='source ~/.zshrc'

# ---- History Configuration -----------------------------------
HISTSIZE=100000               #How many lines of history to keep in memory
HISTFILE=$HOME/.zsh_history     #Where to save history to disk
SAVEHIST=100000               #Number of history entries to save to disk
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space #ignores all commands starting with a blank space! Usefull for passwords
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups

# ---- Plugins ------------------

## Zoxide
if command -v zoxide &> /dev/null
then
  eval "$(zoxide init --cmd cd zsh)"
fi

## Atuin

if [[ -f "$HOME/.atuin/bin/env" ]]
then
  . "$HOME/.atuin/bin/env"

  eval "$(atuin init zsh --disable-up-arrow)"
fi


if command -v starship &> /dev/null
then
  if [ "${TERM_PROGRAM}" = "vscode" ]; then
    export STARSHIP_CONFIG=~/.config/starship-vscode.toml
  else
    export STARSHIP_CONFIG=~/.config/starship.toml
  fi

  eval "$(starship init zsh)"
fi
