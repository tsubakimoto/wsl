# Setup .NET 6 on WSL2
# https://docs.microsoft.com/ja-jp/dotnet/core/install/linux-ubuntu#2004

#!/bin/bash
set -xe

sudo apt-get update -y

# Install package
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# Install SDK
sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-6.0

dotnet --list-sdks
