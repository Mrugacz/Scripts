#!/usr/bin/env bash
#
# My programs
#

sudo apt install -y bspwm sxhkd kitty nitrogen i3lock fish dmenu fonts-firacode thunar maim arandr

#
# polybar compile requirements
#

sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev
sudo apt install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev

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

mkdir ~/Scripts ~/.config/bspwm ~/.config/sxhkd

cd ~/Scripts
wget https://raw.githubusercontent.com/JopStro/bspswallow/master/bspswallow

cd ~/.config
wget --output-document bspwm/bspwmrc https://pastebin.com/raw/pjeeft7n
echo kitty > ~/.config/bspwm/terminals
wget --output-document sxhkd/sxhkdrc https://pastebin.com/raw/DCsS6NeW

chmod +x bspwm/bspwmrc
chmod +x sxhkd/sxhkdrc
