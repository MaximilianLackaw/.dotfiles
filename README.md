# .dotfiles
My dotfile configurations

## Symlinks

```sh
export REPO=$PWD # or path to this repo

ln -s $REPO/.zshrc $HOME/.zshrc
ln -s $REPO/.zsh $HOME/.zsh
ln -s $REPO/starship.toml $HOME/.config/starship.toml
ln -s $REPO/starship-vscode.toml $HOME/.config/starship-vscode.toml
ln -s $REPO/.vimrc $HOME/.vimrc
ln -s $REPO/.tmux.conf $HOME/.tmux.conf # or .tmux-wsl.conf
ln -s $REPO/lsd $HOME/.config/lsd
ln -s $REPO/eza/dracula.yml ~/.config/eza/theme.yml

touch $HOME/.gitignore_global
touch $HOME/.local-config.zsh

```

## Local settings
Put local zsh settings and overrides into the file `$HOME/.local-config.zsh`


## Gitconfig
Add the following lines to your local git config

```
[include]
  path = {Full path to this repo}/.gitconfig
```

## Programs/tools to install
* zsh (required)
* [fzf](https://github.com/junegunn/fzf?tab=readme-ov-file#linux-packages) (required)
* [starship](https://github.com/starship/starship)
* [zoxide](https://github.com/ajeetdsouza/zoxide)
* [bat](https://github.com/sharkdp/bat)
* [eza](https://github.com/eza-community/eza)
* [lsd](https://github.com/lsd-rs/lsd) (alternative to eza)
* [ws-copy](https://github.com/bugaevc/wl-clipboard) (when using wayland)
