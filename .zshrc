export ZSH=$HOME/.zsh

# [[ -f $ZSH/p10k.zsh ]] && source $ZSH/p10k.zsh # if disabled, also disabled plugin in `$ZSH/plugins.zsh`
[[ -f $ZSH/aliases.zsh ]] && source $ZSH/aliases.zsh
[[ -f $ZSH/history.zsh ]] && source $ZSH/history.zsh
[[ -f $ZSH/plugins.zsh ]] && source $ZSH/plugins.zsh


# Fix arrow keys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Starship (Best end of zshrc)
if [ "${TERM_PROGRAM}" = "vscode" ]; then
  export STARSHIP_CONFIG=~/.config/starship-vscode.toml
else
  export STARSHIP_CONFIG=~/.config/starship.toml
fi

eval "$(starship init zsh)"
