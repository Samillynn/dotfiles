sudo apt install zsh
ln -s $HOME/dotfiles/.functions $HOME/.functions
ln -s $HOME/dotfiles/.aliases $HOME/.aliases
ln -s $HOME/dotfiles/.nvimrc $HOME/.config/nvim/init.vim
ln -s $HOME/.config/nvim/init.vim $HOME/.nvimrc
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.tmux.conf.local $HOME/.tmux.conf.local
ln -s $HOME/dotfiles/.i3rc $HOME/.config/i3/config
ln -s $HOME/.config/i3/config $HOME/.i3rc

source ~/.functions
source ~/.aliases

# upgrade apt
sudo apt update
sudo apt upgrade

# some necessary apps
ai git
git config --global credential.helper cache
git config --global user.email "2837931428@qq.com"
git config --global user.name "Samillynn"
git config --global core.editor "vim"

ai nodejs npm
ai curl
ai tmux

ai python3-pip
pi IPython


# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install YCM
# ai build-essential cmake vim python3-dev
# cd ~/.config/nvim/plugged/YouCompleteMe
# p install.py --clangd-completer --ts-completer
 
# set vi-mode for terminal apps
echo "set editing-mode vi" >> "$HOME/.inputrc"
ipython profile create
echo "c.TerminalInteractiveShell.editing_mode = 'vi'" >> "~/.ipython/profile_default/ipython_config.py"

# install better themes
# 1. GOGH
# ai dconf-cli uuid-runtime
# bash -c  "$(wget -qO- https://git.io/vQgMr)"
