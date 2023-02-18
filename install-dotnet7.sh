# Setup .NET 7 on WSL2
# https://github.com/dotnet/core/blob/main/release-notes/7.0/install-linux.md
# https://github.com/dotnet/sdk/issues/28995#issuecomment-1310911847

#!/bin/bash
set -xe

# Add package repository
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# Install package
sudo apt-get update && \
    sudo apt-get install -y dotnet-sdk-7.0

dotnet --list-sdks
