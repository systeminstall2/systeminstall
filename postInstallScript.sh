# Getting all the files

git clone https://github.com/systeminstall/systeminstall ~/systeminstall 

mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd

#Installing all packages ##########################################################

sudo echo " " && # prevent having to enter password again 

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > installRust.sh && sudo chmod +x installRust.sh && ./installRust.sh -q -y
echo 'export RUSTUP_HOME=/opt/rust' | sudo tee -a /etc/profile.d/rust.sh
echo 'export PATH=$PATH:/opt/rust/bin' | sudo tee -a /etc/profile.d/rust.sh
source ~/.cargo/env
source /etc/profile

yay -Syu --noconfirm etcher-bin ventoy-bin sxhkd protonvpn-gui rustdesk-bin syncthing-gtk visual-studio-code-bin burpsuite oh-my-zsh-plugin-autosuggestions oh-my-zsh-plugin-syntax-highlighting && sudo pacman -S --noconfirm ripgrep ttf-hack polkit-kde-agent brasero rofi feh polybar tree chromium network-manager-applet cmake firefox-developer-edition wmname gnome-disk-utility gnu-netcat gparted kate keepassxc libreoffice-still btop prusa-slicer maim fastfetch neovim nmap p7zip python-pip ripgrep sxiv syncthing terminator torbrowser-launcher ufw unzip vim virtualbox wget whois xclip zenity zsh && sudo chsh -s /usr/bin/zsh && sudo chsh -s /usr/bin/zsh n0ne && sudo pacman -Rns --noconfirm firewalld

curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh" | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install --lts

cp ~/systeminstall/thisImage ~/Documents/ && feh --bg-scale ~/Documents/thisImage

# Setting up zsh plugins #####################

sudo mkdir -p /usr/share/zsh/plugins && sudo mkdir -p /usr/share/zsh/plugins/zsh-syntax-highlighting && sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/share/zsh/plugins/zsh-syntax-highlighting  && sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git /usr/share/zsh-autosuggestions

# Disable endeavour pop Up shit ########

eos-welcome --disable

# Set up start up programs

sudo systemctl enable bluetooth

# Install Nerdfonts for emojis

mkdir fonts && cd fonts && wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip" && unzip Hack.zip && sudo mkdir -p /usr/local/share/fonts && rm Hack.zip && sudo mv * /usr/local/share/fonts/ && cd ..
cd fonts && wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip" && unzip JetBrainsMono.zip && rm JetBrainsMono.zip && sudo mv * /usr/local/share/fonts/ && cd ..

#Fix weird themeing stuff if kde and bspwm are installed alongside

cat ~/systeminstall/.xprofile > ~/.xprofile

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

rm -rf ~/.config/rofi && mkdir ~/.config/rofi && cp ~/systeminstall/rofi/* ~/.config/rofi/ -r

# Writing terminator ###################################

sudo rm ~/.config/terminator/config
mkdir -p ~/.config/terminator && cat ~/systeminstall/terminator > ~/.config/terminator/config

# Writing nvim #########################################

python3 -m venv venv && source venv/bin/activate

LV_BRANCH='release-1.3/neovim-0.9' yes | bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

rm -rf ~/.config/lvim && cp ~/systeminstall/lvim ~/.config/ -r

echo "export PATH=/home/n0ne/.local/bin:$PATH" >> ~/.zshenv && source ~/.zshenv

sudo chmod 755 ~/.config/bspwm/bspwmrc
sudo chmod 644 ~/.config/sxhkd/sxhkdrc

sudo cp ~/systeminstall/timetracker.sh /usr/bin/tt

echo "\n\nInstallation finished\n\n\nDon't forget to install the correct driver for this device!"
