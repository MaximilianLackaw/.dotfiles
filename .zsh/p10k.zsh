if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ -f $ZSH/p10k-setup.zsh ]] && source $ZSH/p10k-setup.zsh

ZSH_THEME="powerlevel10k/powerlevel10k"