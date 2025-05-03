#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

printf "$GREEN password to perform pacman adds of needed programs $NC \n"
sudo apt install rsync trash-cli cifs-utils zsh
echo "export ZDOTDIR=\"\$HOME/.config/zsh\""| sudo tee /etc/zsh/zshenv
sudo mkdir -p /media/winshare
sudo mount -t cifs -o user=cliff,password=2oo@BLU4u$,uid=1000,gid=1000 //192.168.1.218/cliff /media/winshare
mkdir -p ~/.cache/zsh
touch ~/.cache/zsh/history
rsync -av /media/winshare/Ubuntu/Downloads ~/
rsync -av /media/winshare/Ubuntu/.config/zsh ~/.config
rsync -av /media/winshare/Ubuntu/.config/dwm-6.5 ~/.config
rsync -av /media/winshare/Ubuntu/.config/dwmblocks ~/.config
rsync -av /media/winshare/Ubuntu/.config/st ~/.config
rsync -av /media/winshare/Ubuntu/.config/fontconfig ~/.config
rsync -av /media/winshare/Ubuntu/.local/bin ~/.local/
rsync -av /media/winshare/Ubuntu/.vim ~/
rsync -av /media/winshare/ArchPC/Pictures ~/
rsync -av /media/winshare/Ubuntu/.xinitrc ~/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install -y
printf "$GREEN loading packages $NC \n"
xargs sudo apt install -y < ~/.local/bin/ubuntulist.txt && printf "$GREEN Successful pkgs $NC \n"||printf "$RED packages failed $NC \n"
#printf "$GREEN loading sound  packages"
#sudo pacman -S --needed - < ~/.local/bin/soundpkg.txt && printf "$GREEN Successful sound pkgs $NC \n"||printf "$RED sound packages failed $NC \n"
#printf "$GREEN loading print packages"
#sudo pacman -S --needed - < ~/.local/bin/printpkg.txt && printf "$GREEN Successful print pkgs $NC \n"||printf "$RED print packages failed $NC \n"
chsh -s /bin/zsh
printf "$GREEN install dwm!! $NC \n"
cd $HOME/.config/dwm-6.5
sudo make clean install&&printf "$GREEN dwm success!! $NC \n"||printf "$RED dwm failed $NC \n"
printf "$GREEN install dwmblocks!! $NC \n"
cd $HOME/.config/dwmblocks
sudo make clean install&&printf "$GREEN dwmblocks success!! $NC \n"||printf "$RED dwmblocks failed!! $NC \n"
cd $HOME/.config/st
sudo make clean install&&printf "$GREEN st success!! $NC \n"||printf "$RED st failed!! $NC \n"
printf "$GREEN autoconfig conmplete $NC \n"
