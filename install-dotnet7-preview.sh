# Setup .NET 7 Preview on WSL2
# https://github.com/dotnet/core/blob/main/release-notes/7.0/install-linux.md

#!/bin/bash
set -xe

sudo apt-get update -y

mkdir $HOME/dotnet_install && cd $HOME/dotnet_install
curl -L https://aka.ms/install-dotnet-preview -o install-dotnet-preview.sh
sudo bash install-dotnet-preview.sh

dotnet --list-sdks
