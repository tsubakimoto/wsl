# Setup .NET on WSL2

#!/bin/bash
set -xe

# .NET 8
## https://learn.microsoft.com/ja-jp/dotnet/core/install/linux-ubuntu-install

# Install package
sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-8.0

# .NET 9
## https://github.com/dotnet/core/blob/main/release-notes/9.0/install-linux.md

# mkdir $HOME/dotnet_install && cd $HOME/dotnet_install
# curl -L https://aka.ms/install-dotnet-preview -o install-dotnet-preview.sh
# sudo bash install-dotnet-preview.sh

dotnet --list-sdks
