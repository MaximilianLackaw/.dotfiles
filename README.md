# .dotfiles
My dotfile configurations

## Symlinks

```sh
export REPO=$PWD # or path to this repo

ln -s $REPO/.zshrc $HOME/.zshrc
ln -s $REPO/.zsh $HOME/.zsh
ln -s $REPO/starship.toml $HOME/.config/starship.toml

touch $HOME/..gitignore_global
```
## Gitconfig
Add the following lines to your git config
```
[include]
  path = {Path to this repo}/.gitconfig
```

ln -s $REPO/.gitconfig $HOME/.gitconfig