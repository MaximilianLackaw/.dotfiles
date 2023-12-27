export ZSH=$HOME/.zsh

# [[ -f $ZSH/p10k.zsh ]] && source $ZSH/p10k.zsh # if disabled, also disabled plugin in `$ZSH/plugins.zsh`
[[ -f $ZSH/aliases.zsh ]] && source $ZSH/aliases.zsh
[[ -f $ZSH/history.zsh ]] && source $ZSH/history.zsh
[[ -f $ZSH/plugins.zsh ]] && source $ZSH/plugins.zsh


# Fix arrow keys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Starship (Best end of zshrc)
# export STARSHIP_CONFIG=~/.zsh/starship.toml
# default config path: ~/.config/starship.toml
eval "$(starship init zsh)"
