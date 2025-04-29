# LS aliases based on the selected tool.
#
# You can set the tool via the LS_TOOL variable: "eza", "lsd", or "ls".
# If unset or invalid, the first available tool is auto-selected (eza > lsd > ls).
# Default is eza if installed.
#
# Common aliases:
#   l     : base command (eza/lsd/ls), always with human-readable sizes
#   ll    : long list view, directories first
#   lla   : like ll, but includes hidden files (excluding . and ..)
#   la    : short list view with hidden files
#
# Additional aliases for eza and lsd:
#   llg   : long list with git info
#   llag  : like llg, but includes hidden files
#   llt   : long list sorted by modified time
#   llat  : like llt, but includes hidden files
#   lls   : long list sorted by size, includes total size
#   llas  : like lls, but includes hidden files

case "$LS_TOOL" in
  eza)
    command -v eza &> /dev/null && alias l='eza --icons=auto' || { echo "Warning: eza not found, falling back..."; unset LS_TOOL; }
    ;;
  lsd)
    command -v lsd &> /dev/null && alias l='lsd' || { echo "Warning: lsd not found, falling back..."; unset LS_TOOL; }
    ;;
  ls)
    alias l='ls -h'
    ;;
  "")
    # auto-detection
    ;;
  *)
    echo "Error: unsupported LS_TOOL value '$LS_TOOL'"
    unset LS_TOOL
    ;;
esac

# fallback if needed
if [[ -z "$LS_TOOL" ]]; then
  if command -v eza &> /dev/null; then
    alias l='eza --icons=auto'
    LS_TOOL="eza"
  elif command -v lsd &> /dev/null; then
    alias l='lsd'
    LS_TOOL="lsd"
  else
    alias l='ls -h'
    LS_TOOL="ls"
  fi
fi

# common aliases
alias ll='l -l --group-directories-first'
alias lla='ll -A'
alias la='l -A'

if [[ "$LS_TOOL" == "eza" ]]; then
  if [[ -d $HOME/.config/eza && -z "$EZA_CONFIG_DIR" ]]; then
    EZA_CONFIG_DIR=$HOME/.config/eza
  fi
  alias llg='ll --git'
  alias llt='l -l --sort=modified'
elif [[ "$LS_TOOL" == "lsd" ]]; then
  alias llg='ll -g'
  alias llt='l -l --sort=time'
fi

if [[ "$LS_TOOL" == "eza" || "$LS_TOOL" == "lsd" ]]; then
  alias llag='llg -A'
  alias llat='llt -A'

  alias lls='l -l --total-size --sort=size'
  alias llas='lls -A'
fi

