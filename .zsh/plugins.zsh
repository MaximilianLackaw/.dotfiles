# -- Plugin Configs --------------------------------------

# zsh-autosuggestions

ZSH_AUTOSUGGEST_STRATEGY=(history)

# -- Plugin Configs --------------------------------------

# nvm
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# -- Plugin "Manager" ----------------------------------

# where do you want to store your plugins?
ZPLUGINDIR=$HOME/.zsh/plugins

# get zsh_unplugged and store it with your other plugins
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh

# make list of the Zsh plugins you use
repos=(
  aloxaf/fzf-tab
  zsh-users/zsh-syntax-highlighting
  romkatv/zsh-defer
  zsh-users/zsh-completions
  # romkatv/powerlevel10k   # replaced by starship
  # rupa/z   # replaced by zoxide
  djui/alias-tips
  zsh-users/zsh-autosuggestions
  # unixorn/fzf-zsh-plugin # replaced by atuin
  so-fancy/diff-so-fancy
  lukechilds/zsh-nvm
)

# now load your plugins
plugin-load $repos

# load non git managed plugins
[[ -f $ZPLUGINDIR/sudo.zsh ]] && zsh-defer . $ZPLUGINDIR/sudo.zsh
[[ -f $ZPLUGINDIR/web-search.zsh ]] && zsh-defer . $ZPLUGINDIR/web-search.zsh
[[ -f $ZPLUGINDIR/copybuffer.zsh ]] && zsh-defer . $ZPLUGINDIR/copybuffer.zsh
source $ZPLUGINDIR/vsc.zsh

# -- Load more plugins ----------------------------------

# Zoxide
if command -v zoxide &> /dev/null
then
  eval "$(zoxide init --cmd cd zsh)"
fi

# Atuin

if [[ -f "$HOME/.atuin/bin/env" ]]
then
  . "$HOME/.atuin/bin/env"

  eval "$(atuin init zsh --disable-up-arrow)"
fi
