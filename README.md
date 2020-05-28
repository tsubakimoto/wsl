# WSLのインストール
```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

# WSL2のインストール
https://docs.microsoft.com/ja-jp/windows/wsl/install-win10

```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2
```

# 初期構築
```sh
sudo sed -i -e 's%http://.*.ubuntu.com%http://ftp.jaist.ac.jp/pub/Linux%g' /etc/apt/sources.list
sudo apt update -y
sudo apt upgrade -y
sudo timedatectl set-timezone 'Asia/Tokyo'
```

# シンボリックリンク
```sh
cd ~
ln -sf /mnt/d/src/ ~/src
```

# Git
```sh
sudo apt-get install -y git
```

# nvm
https://github.com/nvm-sh/nvm#git-install

```sh
cd ~/
git clone https://github.com/nvm-sh/nvm.git .nvm
cd ~/.nvm
git checkout v0.35.0
. nvm.sh
cd ~/
echo '' >> ~/.profile
echo '# nvm' >> ~/.profile
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.profile
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.profile
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> ~/.profile
source ~/.profile
```

# yarn
https://yarnpkg.com/en/docs/install#debian-stable

```sh
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn -y
```

# pyenv
https://github.com/pyenv/pyenv#installation

```sh
cd ~/
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo '' >> ~/.profile
echo '# pyenv' >> ~/.profile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.profile
source ~/.profile
```

# dotnet
https://dotnet.microsoft.com/download/thank-you/dotnet-sdk-3.0.100-preview6-linux-x64-binaries

```sh
cd ~/
curl -O https://download.visualstudio.microsoft.com/download/pr/886b4a4c-30af-454b-8bec-81c72b7b4e1f/d1a0c8de9abb36d8535363ede4a15de6/dotnet-sdk-3.0.100-linux-x64.tar.gz
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-3.0.100-linux-x64.tar.gz -C $HOME/dotnet
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
```

# az
https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli-apt?view=azure-cli-latest

```sh
cd ~/
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

# docker (WSL1)
https://docs.docker.com/install/linux/docker-ce/ubuntu/

```sh
sudo apt-get update
sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

sudo apt-get update
sudo apt-get install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io

apt-cache madison docker-ce

echo '' >> ~/.profile
echo '# docker' >> ~/.profile
echo 'export DOCKER_HOST=tcp://localhost:2375' >> ~/.profile
echo 'alias docker="DOCKER_HOST=${DOCKER_HOST} docker"' >> ~/.profile
source ~/.profile
```

# docker (WSL2)
https://www.docker.com/products/docker-desktop

# phpenv
https://github.com/phpenv/phpenv-installer

```sh
curl -L https://raw.githubusercontent.com/phpenv/phpenv-installer/master/bin/phpenv-installer | bash
echo '' >> ~/.profile
echo '# phpenv' >> ~/.profile
echo 'export PHPENV_ROOT="$HOME/.phpenv"' >> ~/.profile
echo -e 'if [ -d "${PHPENV_ROOT}" ]; then\n  export PATH="${PHPENV_ROOT}/bin:${PATH}"\n  eval "$(phpenv init -)"\nfi' >> ~/.profile
source ~/.profile
sudo apt-get update
sudo apt -y install build-essential
sudo apt -y install \
  libxml2-dev \
  libssl-dev \
  libbz2-dev \
  libcurl4-openssl-dev \
  libjpeg-dev \
  libpng-dev \
  libmcrypt-dev \
  libreadline-dev \
  libtidy-dev \
  libxslt-dev \
  libzip-dev \
  autoconf
```

# composer
```sh
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
```

# azure functions
https://github.com/Azure/azure-functions-core-tools/blob/master/README.md#linux

```sh
wget -q https://packages.microsoft.com/config/ubuntu/18.10/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y azure-functions-core-tools
```
