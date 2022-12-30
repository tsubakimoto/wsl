#!/bin/bash
set -xe

# Package source
sudo sed -i -e 's%http://.*.ubuntu.com%http://ftp.jaist.ac.jp/pub/Linux%g' /etc/apt/sources.list

# Update
sudo apt-get update -y
sudo apt-get upgrade -y

# Sudo
#NEW_USER=yuta
#sudo bash -c 'echo "$NEW_USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$NEW_USER'

# Network
#sudo timedatectl set-timezone 'Asia/Tokyo'
sudo apt-get install -y net-tools

# wsl.conf
echo -e "[interop]\nappendWindowsPath=false\n\n[boot]\ncommand=service docker start" | sudo sh -c 'cat - > /etc/wsl.conf'

# Git Credential Manager
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager-core.exe"

# installers
WSL_DIR=$HOME/wsl
if [ ! -d $WSL_DIR ]; then
  git clone https://github.com/tsubakimoto/wsl.git $HOME/wsl
fi

# dotfiles
DOTFILES_DIR=$HOME/dotfiles
if [ ! -d $DOTFILES_DIR ]; then
  git clone https://github.com/tsubakimoto/dotfiles.git $HOME/dotfiles
fi

chmod +x $DOTFILES_DIR/install.sh
cd $DOTFILES_DIR
./install.sh

# anyenv
chmod +x $WSL_DIR/install-anyenv.sh
$WSL_DIR/install-anyenv.sh

# docker
chmod +x $WSL_DIR/install-docker.sh
$WSL_DIR/install-docker.sh

# dotnet
chmod +x $WSL_DIR/install-dotnet6.sh
$WSL_DIR/install-dotnet6.sh

#chmod +x $WSL_DIR/install-dotnet7-preview.sh
#$WSL_DIR/install-dotnet7-preview.sh

# azure tools
chmod +x $WSL_DIR/install-azure-tools.sh
$WSL_DIR/install-azure-tools.sh
