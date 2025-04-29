export ZSH=$HOME/.zsh

if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$PATH:$HOME/.local/bin"
fi

if [ -d "$HOME/.cargo/bin" ] ; then
  PATH="$PATH:$HOME/.cargo/bin"
fi

[[ -f $HOME/.zsh-envs.zsh ]] && source $HOME/.zsh-envs.zsh  # local configs and aliases (optional)
# [[ -f $ZSH/p10k.zsh ]] && source $ZSH/p10k.zsh # if disabled, also disabled plugin in `$ZSH/plugins.zsh`
[[ -f $ZSH/aliases.zsh ]] && source $ZSH/aliases.zsh
[[ -f $ZSH/ls.zsh ]] && source $ZSH/ls.zsh
[[ -f $ZSH/clipboard.zsh ]] && source $ZSH/clipboard.zsh
[[ -f $ZSH/history.zsh ]] && source $ZSH/history.zsh
[[ -f $HOME/.local-config.zsh ]] && source $HOME/.local-config.zsh  # local configs and aliases (optional)
[[ -f $ZSH/plugins.zsh ]] && source $ZSH/plugins.zsh
[[ -f $ZSH/keybindings.zsh ]] && source $ZSH/keybindings.zsh

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
