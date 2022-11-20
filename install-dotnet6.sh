# Setup .NET 6 on WSL2
# https://learn.microsoft.com/ja-jp/dotnet/core/install/linux-ubuntu#2204

#!/bin/bash
set -xe

# Install package
sudo apt-get update && \
  sudo apt-get install -y dotnet6

dotnet --list-sdks
