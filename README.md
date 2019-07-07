# WSLのインストール
```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

# 初期構築
```sh
sudo sed -i -e 's%http://.*.ubuntu.com%http://ftp.jaist.ac.jp/pub/Linux%g' /etc/apt/sources.list
sudo apt update -y
sudo apt upgrade -y
sudo timedatectl set-timezone 'Asia/Tokyo'
sudo cp -r ~/ /mnt/c/wsl_home
sudo vim /etc/passwd
```

## /etc/passwd
```
yuta:x:1000:1000:,,,:/home/yuta:/bin/bash
↓
yuta:x:1000:1000:,,,:/mnt/c/wsl_home:/bin/bash
```

# インストール
```sh
sudo apt-get install git  
```

## nvm
https://github.com/nvm-sh/nvm#git-install

```sh
cd ~/
git clone https://github.com/nvm-sh/nvm.git .nvm
cd ~/.nvm
git checkout v0.34.0
. nvm.sh
cd ~/
echo '' >> ~/.profile
echo '# nvm' >> ~/.profile
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.profile
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.profile
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> ~/.profile
source ~/.profile
```

## pyenv
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

## dotnet
https://dotnet.microsoft.com/download/thank-you/dotnet-sdk-3.0.100-preview6-linux-x64-binaries

```sh
cd ~/
curl -O https://download.visualstudio.microsoft.com/download/pr/72ce4d40-9063-4a2e-a962-0bf2574f75d1/5463bb92cff4f9c76935838d1efbc757/dotnet-sdk-3.0.100-preview6-012264-linux-x64.tar.gz
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-3.0.100-preview6-012264-linux-x64.tar.gz -C $HOME/dotnet
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
```

## az
https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli-apt?view=azure-cli-latest

```sh
cd ~/
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

## docker
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

## phpenv
https://github.com/phpenv/phpenv-installer

```sh
curl -L https://raw.githubusercontent.com/phpenv/phpenv-installer/master/bin/phpenv-installer | bash
export PHPENV_ROOT="$HOME/.phpenv"
echo '' >> ~/.profile
echo '# phpenv' >> ~/.profile
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
  autoconf
```

