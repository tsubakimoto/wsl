#!/bin/bash
set -xe

# Package source
sudo sed -i -e 's%http://.*.ubuntu.com%http://ftp.jaist.ac.jp/pub/Linux%g' /etc/apt/sources.list

# Update
sudo apt-get update -y
sudo apt-get upgrade -y

# Sudo
echo "Input username"
read username
echo -e "$username ALL=(ALL) NOPASSWD: ALL" | sudo sh -c "cat - > /etc/sudoers.d/$username"

# Network
#sudo timedatectl set-timezone 'Asia/Tokyo'
sudo apt-get install -y net-tools

# wsl.conf
echo -e "[interop]\nappendWindowsPath=false\n\n[boot]\ncommand=service docker start\n\n[user]\ndefault=yuta" | sudo sh -c "cat - > /etc/wsl.conf"

# Git Credential Manager
# http://microsoft.github.io/Git-Credential-Manager-for-Windows/Docs/CredentialManager.html
GIT_CREENTIAL_MANAGER_CORE_PATH="/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager-core.exe"
#if [ ! -e "$GIT_CREENTIAL_MANAGER_CORE_PATH" ]; then
#  GIT_CREENTIAL_MANAGER_CORE_PATH="/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe"
#fi
git config --global credential.helper "$GIT_CREENTIAL_MANAGER_CORE_PATH"

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
chmod +x $WSL_DIR/install-dotnet.sh
$WSL_DIR/install-dotnet.sh

# azure tools
chmod +x $WSL_DIR/install-azure-tools.sh
$WSL_DIR/install-azure-tools.sh

# dev tools
chmod +x $WSL_DIR/install-dev-tools.sh
$WSL_DIR/install-dev-tools.sh
