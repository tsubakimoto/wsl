# Setup .NET on WSL2

#!/bin/bash
set -xe

# .NET 6
## https://learn.microsoft.com/ja-jp/dotnet/core/install/linux-ubuntu#2204

# Install package
sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-6.0

# .NET 7
## https://github.com/dotnet/core/blob/main/release-notes/7.0/install-linux.md
## https://github.com/dotnet/sdk/issues/28995#issuecomment-1310911847

mkdir $HOME/dotnet_install && cd $HOME/dotnet_install
curl -L https://aka.ms/install-dotnet-preview -o install-dotnet-preview.sh
sudo bash install-dotnet-preview.sh

dotnet --list-sdks
