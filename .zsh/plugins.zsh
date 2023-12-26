# Plugin "Manager"

# where do you want to store your plugins?
ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$ZSH}/plugins}

# get zsh_unplugged and store it with your other plugins
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh

# make list of the Zsh plugins you use
repos=(
  # romkatv/powerlevel10k
  zsh-users/zsh-completions
  rupa/z
  djui/alias-tips
  # olets/zsh-abbr # makes no sens together with alias-tips
  zsh-users/zsh-syntax-highlighting # always before history-substring-search
  zsh-users/zsh-history-substring-search
  unixorn/fzf-zsh-plugin # similar to history-substring-search
  zsh-users/zsh-autosuggestions
)

# now load your plugins
plugin-load $repos

# load non git managed plugins
[[ -f $ZPLUGINDIR/sudo.zsh ]] && source $ZPLUGINDIR/sudo.zsh
[[ -f $ZPLUGINDIR/dirhistory.zsh ]] && source $ZPLUGINDIR/dirhistory.zsh # https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/dirhistory/README.md
[[ -f $ZPLUGINDIR/web-search.zsh ]] && source $ZPLUGINDIR/web-search.zsh # https://github.com/sineto/web-search/tree/master
[[ -f $ZPLUGINDIR/copybuffer.zsh ]] && source $ZPLUGINDIR/copybuffer.zsh  # https://github.com/guillaumeboehm/zsh-copybuffer/tree/master


# Settings
## zsh-history-substring-search
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down


