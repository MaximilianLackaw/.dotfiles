bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle

if [[ -f /proc/version ]] && grep -iq Microsoft /proc/version; then
  os=WSL
else
  case "$(uname -s)" in
    Linux*)     os=LINUX;;
    Darwin*)    os=MAC;;
    CYGWIN*)    os=CYGWIN;;
  esac
fi

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

if [[ "$os" == "LINUX" ]]; then
  bindkey '^[[H' beginning-of-line     # Home
  bindkey '^[[F' end-of-line     # End
  bindkey '^[[3~' delete-char     # Delete
  bindkey '^?' backward-delete-char     # Backspace
fi