# Settings

## zsh-history-substring-search
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

# works on wsl
# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down

# zsh-autosuggestions

ZSH_AUTOSUGGEST_STRATEGY=(history)

# nvm
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=false
export NVM_AUTO_USE=true

# Plugin "Manager"

# where do you want to store your plugins?
ZPLUGINDIR=$HOME/.zsh/plugins

# get zsh_unplugged and store it with your other plugins
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh

# make list of the Zsh plugins you use
repos=(
  zsh-users/zsh-syntax-highlighting # always before history-substring-search
  romkatv/zsh-defer
  # romkatv/powerlevel10k
  zsh-users/zsh-completions
  # rupa/z
  djui/alias-tips
  # olets/zsh-abbr # makes no sens together with alias-tips
  zsh-users/zsh-history-substring-search
  unixorn/fzf-zsh-plugin # similar to history-substring-search
  zsh-users/zsh-autosuggestions
  lukechilds/zsh-nvm
)

# now load your plugins
plugin-load $repos

# load non git managed plugins
[[ -f $ZPLUGINDIR/sudo.zsh ]] && zsh-defer . $ZPLUGINDIR/sudo.zsh
[[ -f $ZPLUGINDIR/dirhistory.zsh ]] && zsh-defer . $ZPLUGINDIR/dirhistory.zsh
[[ -f $ZPLUGINDIR/web-search.zsh ]] && zsh-defer . $ZPLUGINDIR/web-search.zsh
[[ -f $ZPLUGINDIR/copybuffer.zsh ]] && zsh-defer . $ZPLUGINDIR/copybuffer.zsh
source $ZPLUGINDIR/vsc.zsh

