sudo apt install zsh
ln -s $HOME/dotfiles/.functions $HOME/.functions
ln -s $HOME/dotfiles/.aliases $HOME/.aliases
ln -s $HOME/dotfiles/.nvimrc $HOME/.nvimrc
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.tmux.conf.local $HOME/.tmux.conf.local

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
ai build-essential cmake vim python3-dev
cd ~/.config/nvim/plugged/YouCompleteMe
p install.py --clangd-completer --ts-completer

# install oh-my-zsh and change .zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install power10k
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# install MesloLGS font from
# https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k

# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# relink .zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc -f

# swap esc and capslock
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape']"

# set vi-mode for terminal apps
echo "set editing-mode vi" >> "$HOME/.inputrc"
ipython profile create
echo "c.TerminalInteractiveShell.editing_mode = 'vi'" >> "~/.ipython/profile_default/ipython_config.py"

# install better themes
# 1. GOGH
ai dconf-cli uuid-runtime
bash -c  "$(wget -qO- https://git.io/vQgMr)"
# 2. Dracula
sudo apt-get install dconf-cli
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh
