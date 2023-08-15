# Setup Azure tools on WSL2
# https://learn.microsoft.com/ja-jp/cli/azure/install-azure-cli-linux
# https://learn.microsoft.com/ja-jp/azure/developer/azure-developer-cli/install-azd
# https://github.com/Azure/azure-functions-core-tools/blob/master/README.md#linux

#!/bin/bash
set -xe

sudo apt-get update -y

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | sudo bash

# Azure Functions Core Tools
wget -q https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update -y
sudo apt-get install -y azure-functions-core-tools-4
