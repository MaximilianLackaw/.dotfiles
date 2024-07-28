# Local settings for different systems

## Fedora

```shell
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word
bindkey '^[[H' beginning-of-line     # Home
bindkey '^[[F' end-of-line     # End
bindkey '^[[3~' delete-char     # Delete
bindkey '^?' backward-delete-char     # Backspace
```

## Windows WSL

```shell
#Fix arrow keys
#bindkey "^[[1;5C" forward-word
#bindkey "^[[1;5D" backward-word
```