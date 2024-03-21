# Alacritty Shell Setup

## Install Alacritty 
* Install Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

rustup override set stable
rustup update stable
```
* Install Alacritty from Source
```bash
make app
cp -r target/release/osx/Alacritty.app /Applications/
```
* Post Install 
[See Instructions](https://github.com/alacritty/alacritty/blob/master/INSTALL.md#terminfo)


## Install Nerd Fonts
```bash
brew tap homebrew/cask-fonts
brew install --cask <font_name>
```

More detail [here](https://www.geekbits.io/how-to-install-nerd-fonts-on-mac/)

## Install Starship (prompt)
[Starship](https://starship.rs/) config is in .config/starship.yml
It can be moved if desired by exporting an environment variable.
```bash
brew install Starship
```
## Nice LS
LSD config is in .config/lsd/config.yml
```bash
brew install lsd
```
## Nice CAT
(Bat)[https://github.com/sharkdp/bat] is an enhanced version of cat with syntax highlighting.

### Zsh config
The main .zshrc file is in the process of being modularized into .config/zsh


## Look into ansible
https://github.com/ThePrimeagen/ansible/blob/master/tasks/dotfiles.yml
