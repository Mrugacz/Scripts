#!/usr/bin/env bash
#
# My programs
#

sudo apt install -y git bspwm sxhkd kitty nitrogen i3lock fish dmenu fonts-firacode thunar maim arandr vim
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install emacs27


git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
#
# polybar compile requirements
#

sudo apt install -y build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev

cd /tmp/
git clone --recursive https://github.com/polybar/polybar
cd polybar

mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install

install -Dm644 /usr/local/share/doc/polybar/config $HOME/.config/polybar/config

chsh -s /usr/bin/fish

mkdir ~/Scripts/ ~/.config/bspwm ~/.config/sxhkd ~/.config/kitty/ ~/.config/polybar/ ~/.config/fish ~/.config/fish/functions

cd ~/Scripts
wget https://raw.githubusercontent.com/JopStro/bspswallow/master/bspswallow
wget https://raw.githubusercontent.com/Mrugacz/Scripts/main/README.org

cd ~/.config
echo kitty > ~/.config/bspwm/terminals
wget https://raw.githubusercontent.com/Mrugacz/dotfiles/main/README.org

fish -c alias ssh="kitty +kitten ssh"

emacs
