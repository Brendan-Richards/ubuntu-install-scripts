#!/bin/bash

export TZ='America/Detroit'
export DEBIAN_FRONTEND='noninteractive'
sudo ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

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
    zenity

# install docker
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/sudo apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/sudo apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/sudo apt/sources.list.d/docker.list > /dev/null
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

# install pyenv -
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc
# allows us to source the bashrc in a non-interactive shell. probably not good practice
export PS1=false
source ~/.bashrc
pyenv install 3.10.0
pyenv global 3.10.0

# install poetry -
curl -sSL https://install.python-poetry.org | python3 -
echo 'export PATH="/root/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# install vscode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt-get install apt-transport-https -y
sudo apt-get update -y
sudo apt-get install code -y

# set vscode as the default text editor
update-alternatives --set editor /usr/bin/code

# install steam
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y gcc-12-base:i386 i965-va-driver i965-va-driver:i386 intel-media-va-driver \
  intel-media-va-driver:i386 krb5-locales libapparmor1:i386 libasound2:i386 \
  libasound2-plugins:i386 libasyncns0:i386 libatomic1:i386 libblkid1:i386 \
  libbrotli1:i386 libbsd0:i386 libc6:i386 libcap2:i386 libcom-err2:i386 \
  libcrypt1:i386 libdb5.3:i386 libdbus-1-3:i386 libdrm-amdgpu1:i386 \
  libdrm-intel1:i386 libdrm-nouveau2:i386 libdrm-radeon1:i386 libdrm2:i386 \
  libedit2:i386 libegl-mesa0:i386 libegl1:i386 libelf1:i386 libexpat1:i386 \
  libffi8:i386 libflac8:i386 libfontconfig1:i386 libfreetype6:i386 \
  libgbm1:i386 libgcc-s1:i386 libgcrypt20:i386 libgl1:i386 \
  libgl1-mesa-dri:i386 libglapi-mesa:i386 libglib2.0-0:i386 libglvnd0:i386 \
  libglx-mesa0:i386 libglx0:i386 libgmp10:i386 libgnutls30:i386 \
  libgpg-error-l10n libgpg-error0:i386 libgssapi-krb5-2:i386 libhogweed6:i386 \
  libicu70:i386 libidn2-0:i386 libigdgmm12 libigdgmm12:i386 \
  libjack-jackd2-0:i386 libk5crypto3:i386 libkeyutils1:i386 libkrb5-3:i386 \
  libkrb5support0:i386 libllvm13:i386 liblz4-1:i386 liblzma5:i386 libmd0:i386 \
  libmount1:i386 libnettle8:i386 libnm0:i386 libnsl2:i386 libnss-nis:i386 \
  libnss-nisplus:i386 libogg0:i386 libopus0:i386 libp11-kit0:i386 \
  libpciaccess0:i386 libpcre2-8-0:i386 libpcre3:i386 libpng16-16:i386 \
  libpulse0:i386 libsamplerate0:i386 libselinux1:i386 libsensors5:i386 \
  libsndfile1:i386 libssl3:i386 libstdc++6:i386 libsystemd0:i386 \
  libtasn1-6:i386 libtinfo6:i386 libtirpc3:i386 libudev1:i386 \
  libunistring2:i386 libuuid1:i386 libva-drm2 libva-drm2:i386 libva-glx2 \
  libva-glx2:i386 libva-x11-2 libva-x11-2:i386 libva2 libva2:i386 \
  libvorbis0a:i386 libvorbisenc2:i386 libvulkan1:i386 libwayland-client0:i386 \
  libwayland-server0:i386 libx11-6:i386 libx11-xcb1:i386 libxau6:i386 \
  libxcb-dri2-0:i386 libxcb-dri3-0:i386 libxcb-glx0:i386 libxcb-present0:i386 \
  libxcb-randr0:i386 libxcb-shm0:i386 libxcb-sync1:i386 libxcb-xfixes0:i386 \
  libxcb1:i386 libxdmcp6:i386 libxext6:i386 libxfixes3:i386 libxinerama1:i386 \
  libxml2:i386 libxshmfence1:i386 libxss1:i386 libxxf86vm1:i386 libzstd1:i386 \
  mesa-va-drivers mesa-va-drivers:i386 mesa-vulkan-drivers:i386 \
  steam-libs-amd64 steam-libs-i386:i386 va-driver-all va-driver-all:i386 \
  zlib1g:i386s
sudo apt-get install -y gdebi-core
wget -P ~ http://media.steampowered.com/client/installer/steam.deb
gdebi ~/steam.deb

# install discord
wget -O discord_deb "https://discord.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord_deb
sudo apt update
sudo apt install -f -y
sudo dpkg -i discord_debs

# install spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install -y spotify-client

# install keepass password safe
add-apt-repository ppa:phoerious/keepassxc -y
sudo apt update
sudo apt install keepassxc -y

# install reaper
cd ~
wget -P ~ "https://www.reaper.fm/files/6.x/reaper670_linux_x86_64.tar.xz"
tar xf ~/reaper670_linux_x86_64.tar.xz
~/reaper_linux_x86_64/install-reaper.sh  --install /opt --integrate-desktop --usr-local-bin-symlink

# install dropbox (interactive)
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd

# install wine (interactive)
sudo dpkg --add-architecture i386 && sudo apt-get update
sudo apt-get install wine32:i386 wine64 -y
wineboot
wine winecfg

# install axe fx driver (interactive)
# add-sudo apt-repository ppa:albaguirre/axe-fx2 && sudo apt -y update && sudo apt install -y axefx2-usb-firmware
wget http://archive.axefx.fr/AxeFX%20II/Drivers/Axe-Fx_II_USB_Driver_Setup_Linux_106.zip
unzip Axe-Fx_II_USB_Driver_Setup_Linux_106.zip
sudo apt install -y fxload
Axe-Fx_II_USB_Driver_Setup/axefx2setup.sh

# install axe-edit with wine (interactive) -
wget "https://www.fractalaudio.com/downloads/axe-edit/Axe-Edit-Win-v3p14p6.exe"
wine Axe-Edit-Win-v3p14p6.exe
echo "alias axe-edit='wine \"C:\Program Files (x86)\Fractal Audio\Axe-Edit\Axe-Edit.exe\"'" >> ~/.bashrc

# install jack
sudo apt-get install -y jackd2
