# Getting all the files

git clone https://github.com/systeminstall/systeminstall ~/systeminstall 

# Writing zshrc ##################################

cat ~/systeminstall/zshrc > ~/.zshrc

# Writing polybar config ###############################

sudo rm -rf ~/.config/polybar/ && sudo cp ~/systeminstall/polybar ~/.config/ -r &&

sudo chmod +x ~/.config/polybar/scripts/check-network
sudo chmod +x ~/.config/polybar/launch.sh
# Writing bspwmrc ##############################################

sudo rm ~/.config/bspwm/bspwmrc
cat ~/systeminstall/bspwmrc > ~/.config/bspwm/bspwmrc

# Writin sxhkdrc ########################################

sudo rm ~/.config/sxhkd/sxhkdrc
cat ~/systeminstall/sxhkdrc >  ~/.config/sxhkd/sxhkdrc

# Writing rofi ################################

rm -rf /.config/rofi && cp ~/systeminstall/rofi ~/.config/ -r

# Writing terminator ###################################

sudo rm ~/.config/terminator/config
mkdir -p ~/.config/terminator && cat ~/systeminstall/terminator > ~/.config/terminator/config

# Writing nvim #########################################

rm -rf /.config/nvim && cp ~/systeminstall/nvim ~/.config/ -r

#Installing all packages ##########################################################

sudo echo " " && # prevent having to enter password again 

yay -Syu --noconfirm etcher-bin ventoy-bin sxhkd protonvpn-gui rustdesk-bin syncthing-gtk visual-studio-code-bin burpsuite oh-my-zsh-plugin-autosuggestions oh-my-zsh-plugin-syntax-highlighting && sudo pacman -S --noconfirm ttf-hack polkit-kde-agent brasero rofi feh polybar tree chromium cmake firefox-developer-edition wmname gnome-disk-utility gnu-netcat gparted kate keepassxc libreoffice-still btop prusa-slicer maim neofetch neovim nmap p7zip python-pip ripgrep sxiv syncthing terminator torbrowser-launcher ufw unzip vim virtualbox wget whois xclip zenity zsh && sudo chsh -s /usr/bin/zsh && sudo chsh -s /usr/bin/zsh n0ne && sudo pacman -Rns --noconfirm firewalld

cp ~/systeminstall/wallpaper.jpg ~/Documents/ && feh --bg-scale ~/Documents/wallpaper.jpg

# Setting up zsh plugins #####################

sudo mkdir -p /usr/share/zsh/plugins && sudo mkdir -p /usr/share/zsh/plugins/zsh-syntax-highlighting && sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/share/zsh/plugins/zsh-syntax-highlighting  && sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git /usr/share/zsh-autosuggestions

# Disable endeavour pop Up shit ########

eos-welcome --disable

# Set up start up programs

sudo systemctl enable bluetooth
