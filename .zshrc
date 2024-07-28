export ZSH=$HOME/.zsh

# [[ -f $ZSH/p10k.zsh ]] && source $ZSH/p10k.zsh # if disabled, also disabled plugin in `$ZSH/plugins.zsh`
[[ -f $ZSH/aliases.zsh ]] && source $ZSH/aliases.zsh
[[ -f $ZSH/history.zsh ]] && source $ZSH/history.zsh
[[ -f $HOME/.local-config.zsh ]] && source $HOME/.local-config.zsh  # local configs and aliases (optinal)
[[ -f $ZSH/plugins.zsh ]] && source $ZSH/plugins.zsh

if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# Zoxide
if command -v zoxide &> /dev/null
then
  eval "$(zoxide init --cmd cd zsh)"
fi

# Starship (Best end of zshrc)
if [ "${TERM_PROGRAM}" = "vscode" ]; then
  export STARSHIP_CONFIG=~/.config/starship-vscode.toml
else
  export STARSHIP_CONFIG=~/.config/starship.toml
fi

if command -v starship &> /dev/null
then
  eval "$(starship init zsh)"
fi
