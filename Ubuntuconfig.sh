#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

printf "$GREEN password to perform apt adds of needed programs $NC \n"
sudo apt install rsync trash-cli cifs-utils zsh
echo "export ZDOTDIR=\"\$HOME/.config/zsh\""| sudo tee /etc/zsh/zshenv
mkdir -p ~/.cache/zsh
touch ~/.cache/zsh/history
git clone https://github.com/lincheney/fzf-tab-completion.git ~/.config/fzf-tab
rsync -av ./Downloads ~/
rsync -av ./.config ~/
rsync -av ./.local ~/
rsync -av ./vim ~/
rsync -av ./Pictures ~/
rsync -av ./.xinitrc ~/
[ ! -f /usr/bin/google-chrome-stable ] && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/Downloads
[ ! -f /usr/bin/google-chrome-stable ] && sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install -y
printf "$GREEN loading packages $NC \n"
xargs sudo apt install -y < ~/.local/bin/ubuntulist.txt && printf "$GREEN Successful pkgs $NC \n"||printf "$RED packages failed $NC \n"
chsh -s /bin/zsh
printf "$GREEN install dwm!! $NC \n"
cd $HOME/.config/dwm-6.5
sudo make clean install&&printf "$GREEN dwm success!! $NC \n"||printf "$RED dwm failed $NC \n"
printf "$GREEN install dwmblocks!! $NC \n"
cd $HOME/.config/dwmblocks-async
sudo make clean install&&printf "$GREEN dwmblocks success!! $NC \n"||printf "$RED dwmblocks failed!! $NC \n"
cd $HOME/.config/st
sudo make clean install&&printf "$GREEN st success!! $NC \n"||printf "$RED st failed!! $NC \n"
printf "$GREEN autoconfig conmplete $NC \n"
