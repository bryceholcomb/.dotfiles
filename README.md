#My dotfile configurations

##To-dos
- add vim multiple cursors

## How to create symlinks for your dotfiles
- Create a hidden dotfiles folder in your root directory

`mkdir ~/.dotfiles`

- Then move your current dotfiles to the new dotfiles folder

`mv .zshrc .dotfiles/zshrc`

- Create the symlinks in your root directory where they are expected to exist

`ln -s .dotfiles/zshrc .zshrc`
