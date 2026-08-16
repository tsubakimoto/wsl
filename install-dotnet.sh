# Setup .NET on WSL2

#!/bin/bash
set -xe

# .NET 10
## https://learn.microsoft.com/ja-jp/dotnet/core/install/linux-ubuntu-install

sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-10.0

dotnet --list-sdks
