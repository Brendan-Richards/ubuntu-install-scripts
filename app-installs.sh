#!/bin/bash

# export TZ='America/Detroit'
# export DEBIAN_FRONTEND='noninteractive'
# sudo ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && sudo echo $TZ > /etc/timezone

sudo apt-get update 
sudo apt-get upgrade -y
sudo apt-get install -y \
    wget \
    git \
    curl \
    gpg \
    ca-certificates \
    gnupg \
    lsb-release \
    build-essential \
    libssl-dev \
    libffi-dev \
    libncurses5-dev \
    zlib1g \
    zlib1g-dev \
    libreadline-dev \
    libbz2-dev \
    libsqlite3-dev \
    make \
    gcc \
    liblzma-dev \
    nano \
    software-properties-common \
    zenity \
    libc++1 \
    libgconf-2-4 \
    htop \
    unzip

# install docker
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-compose-plugin

# install chrome
mkdir ~/temp
cd ~/temp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f -y
sudo dpkg -i google-chrome-stable_current_amd64.deb

# install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc
# allows us to source the bashrc in a non-interactive shell. probably not good practice
export PS1=false
source ~/.bashrc
pyenv install 3.10.0
pyenv global 3.10.0

# install poetry
curl -sSL https://install.python-poetry.org | python3 -
echo 'export PATH="/home/brendan/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# install vscode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo rm -f packages.microsoft.gpg
sudo apt-get install apt-transport-https -y
sudo apt-get update -y
sudo apt-get install code -y

# set vscode as the default text editor
update-alternatives --set editor /usr/bin/code

# install steam
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y steam

# install discord
wget -O discord_deb "https://discord.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord_deb
sudo apt update
sudo apt install -f -y
sudo dpkg -i discord_debs

# install spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install -y spotify-client

# install keepass password safe
sudo add-apt-repository ppa:phoerious/keepassxc -y
sudo apt update
sudo apt install keepassxc -y

# install cuda and cudnn
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.0.0/local_installers/cuda-repo-ubuntu2204-12-0-local_12.0.0-525.60.13-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2204-12-0-local_12.0.0-525.60.13-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2204-12-0-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda


# install reaper
cd ~
wget -P ~ "https://www.reaper.fm/files/6.x/reaper670_linux_x86_64.tar.xz"
tar xf ~/reaper670_linux_x86_64.tar.xz
sudo ~/reaper_linux_x86_64/install-reaper.sh  --install /opt --integrate-desktop --usr-local-bin-symlink

# install vlc player
sudo apt install -y vlc

# install gimp
sudo apt install -y gimp

# install wine (interactive)
sudo dpkg --add-architecture i386 && sudo apt-get update
sudo apt-get install wine32:i386 wine64 -y
wineboot
wine winecfg

# install winetricks
sudo apt update && sudo apt upgrade -y
sudo apt install -y winetricks

# install linvst
wget https://github.com/osxmidi/LinVst/releases/download/4.78/LinVst-4.78.zip
unzip LinVst-4.78.zip
sudo cp LinVst-4.78/linvstconvert /usr/bin
sudo cp LinVst-4.78/LinVst-4.78-drag-drop/lin* /usr/bin

# install toontrack product manager
echo "go to this link and download the windows verison: https://www.toontrack.com/product-manager/"
while [ true ] ; do
    read -t 100 -n 1
    if [ $? = 0 ] ; then
        break ;
    else
        echo "waiting for keypress"
    fi
done
unzip /home/brendan/Downloads/Toontrack_Product_Manager_WIN.zip && wine Toontrack_Product_Manager_WIN/Windows\ 10/Toontrack\ Product\ Manager\ Installer.exe
wine /home/brendan/.wine/drive_c/Program\ Files\ \(x86\)/Toontrack/Toontrack\ Product\ Manager.exe
echo "Install product manager, then install superior drummer. Press any key when done..."
echo "command is: 'wine /home/brendan/.wine/drive_c/Program\ Files\ \(x86\)/Toontrack/Toontrack\ Product\ Manager.exe'"
while [ true ] ; do
    read -t 100 -n 1
    if [ $? = 0 ] ; then
        break ;
    else
        echo "waiting for keypress"
    fi
done
echo "Convert toontrack vsts, then exit linvstconvert"
echo "for top option: navigate to the main linvst file from the download"
echo "for the bottom option navigate to the vst folder in your ~/.wine/c_drive folders"
linvstconvert

# install lutris
sudo apt install -y lutris

# install league of legends
# wget https://m-reimer.de/wine-lol/debian/wine-lol-glibc_2.33-1_i386.deb
# wget https://m-reimer.de/wine-lol/debian/wine-lol_5.6-1_i386.deb
# sudo dpkg -i wine-lol-glibc_2.33-1_i386.deb
# sudo dpkg -i wine-lol_5.6-1_i386.deb

# install gp7
wget "https://alt-downloads.guitar-pro.com/gp7/stable/guitar-pro-7-setup.exe"
wine guitar-pro-7-setup.exe

# install axe fx driver (interactive)
# add-sudo apt-repository ppa:albaguirre/axe-fx2 && sudo apt -y update && sudo apt install -y axefx2-usb-firmware
wget http://archive.axefx.fr/AxeFX%20II/Drivers/Axe-Fx_II_USB_Driver_Setup_Linux_106.zip
unzip Axe-Fx_II_USB_Driver_Setup_Linux_106.zip
sudo apt install -y fxload
sudo Axe-Fx_II_USB_Driver_Setup/axefx2setup.sh

# install axe-edit with wine (interactive) -
wget "https://www.fractalaudio.com/downloads/axe-edit/Axe-Edit-Win-v3p14p6.exe"
wine Axe-Edit-Win-v3p14p6.exe
echo "alias axe-edit='wine \"C:\Program Files (x86)\Fractal Audio\Axe-Edit\Axe-Edit.exe\"'" >> ~/.bashrc

# install jack
sudo apt-get install -y qjackctl pulseaudio-module-jack
echo $'\n'
echo "In QJackctl"
echo "go to setup -> Misc, check 'Enable Jack D-Bus interface', and uncheck 'Replace Connections with Graph Button'"
echo "go to setup -> Options, in Execute script after Startup put: 'pacmd load-module module-jack-source channels=2; pacmd load-module module-jack-sink channels=2;'"
echo "In setup -> Settings -> Advanced, select focusrite 2i2 for input device and output device"
echo "Set up connections in the main connect menu like the image in the install script repo"
echo "press any key when done..."
while [ true ] ; do
    read -t 100 -n 1
    if [ $? = 0 ] ; then
        break ;
    else
        echo "waiting for keypress"
    fi
done

# set favorites bar
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'snap-store_ubuntu-software.desktop', 'org.gnome.Terminal.desktop', 'google-chrome.desktop', 'org.keepassxc.KeePassXC.desktop', 'spotify.desktop', 'discord.desktop', 'steam.desktop', 'code.desktop', 'cockos-reaper.desktop', 'org.rncbc.qjackctl.desktop', 'wine-Programs-Fractal Audio-Axe-Edit.desktop', 'vlc.desktop', 'wine-Programs-Guitar Pro 7-Guitar Pro 7.desktop', 'net.lutris.Lutris.desktop']"

# install dropbox (interactive)
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
/home/brendan/.dropbox-dist/dropboxd

# install android studio (interactive)
wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2023.1.1.26/android-studio-2023.1.1.26-linux.tar.gz
tar -xzvf android-studio-2023.1.1.26-linux.tar.gz
cd android-studio/bin
./studio.sh
