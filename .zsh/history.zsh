### ---- History Configuration -----------------------------------
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
