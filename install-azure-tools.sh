# Setup Azure tools on WSL2
# https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli-linux
# https://github.com/Azure/azure-functions-core-tools/blob/master/README.md#linux

#!/bin/bash
set -xe

sudo apt-get update -y

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure Functions Core Tools
sudo apt-get update -y
sudo apt-get install -y azure-functions-core-tools-4
