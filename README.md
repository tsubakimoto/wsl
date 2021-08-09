# インストール
## WSL
```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

## WSL2
https://docs.microsoft.com/ja-jp/windows/wsl/install-win10

```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2
```

# セットアップ
## 初期構築
```sh
sudo sed -i -e 's%http://.*.ubuntu.com%http://ftp.jaist.ac.jp/pub/Linux%g' /etc/apt/sources.list
sudo apt update -y
sudo apt upgrade -y
sudo timedatectl set-timezone 'Asia/Tokyo'
```

## シンボリックリンク
```sh
cd ~
ln -sf /mnt/d/src/ ~/src
```

## git
```sh
sudo apt-get install -y git
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe"
```

https://blog.shibayan.jp/entry/20210728/1627450686#Git-%E3%81%AE%E8%AA%8D%E8%A8%BC%E6%83%85%E5%A0%B1%E3%82%92-Windows-%E5%81%B4%E3%81%A8%E5%85%B1%E6%9C%89

### business
```
git config --global user.name "y-matsumura"
git config --global user.email "y-matsumura@alterbooth.com"
```

### private
```
git config --global user.name "tsubakimoto"
git config --global user.email "tkmbmbr@gmail.com"
```

## SSHキー
```sh
mkdir ~/.ssh
```

OneDriveからSSHキーをコピーする

```sh
chmod 700 ~/.ssh
chmod 400 ~/.ssh/id_rsa
ssh -T git@github.com
```

## 言語系
### anyenv
- https://github.com/anyenv/anyenv
- https://qiita.com/y4m3/items/61f99b19bc82c9591b8f#anyenv-update-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB

```sh
cd ~/
git clone https://github.com/anyenv/anyenv ~/.anyenv
echo '' >> ~/.profile
echo '# anyenv' >> ~/.profile
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.profile
echo 'eval "$(anyenv init -)"' >> ~/.profile
exec $SHELL -l
~/.anyenv/bin/anyenv init
anyenv install --force-init
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
```

#### *env install
- https://github.com/nodenv/nodenv
- https://github.com/phpenv/phpenv
- https://github.com/pyenv/pyenv

```sh
anyenv install nodenv
anyenv install phpenv
anyenv install pyenv
exec $SHELL -l
```

phpenvでのPHPビルドに必要なパッケージ

```sh
sudo apt -y install build-essential
sudo apt -y install libxml2-dev libssl-dev libbz2-dev libcurl4-openssl-dev libjpeg-dev libpng-dev libmcrypt-dev libreadline-dev libtidy-dev libxslt-dev libzip-dev autoconf pkg-config
```

### nvm (obsoluted)
https://github.com/nvm-sh/nvm#git-install

```sh
cd ~/
git clone https://github.com/nvm-sh/nvm.git .nvm
cd ~/.nvm
git checkout v0.36.0
. nvm.sh
cd ~/
echo '' >> ~/.profile
echo '# nvm' >> ~/.profile
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.profile
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.profile
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> ~/.profile
source ~/.profile
```

### yarn
https://yarnpkg.com/en/docs/install#debian-stable

```sh
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn -y
```

### pyenv (obsoluted)
https://github.com/pyenv/pyenv#installation  
https://github.com/pyenv/pyenv/wiki/Common-build-problems#prerequisites

```sh
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
  xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

cd ~/
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo '' >> ~/.profile
echo '# pyenv' >> ~/.profile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.profile
source ~/.profile
```

### dotnet
https://docs.microsoft.com/ja-jp/dotnet/core/install/linux-ubuntu

```sh
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-5.0
```

### phpenv (obsoluted)
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

### composer
```sh
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
```

## ツール系
### az
https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli-apt?view=azure-cli-latest

```sh
cd ~/
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

### azure functions
https://github.com/Azure/azure-functions-core-tools/blob/master/README.md#linux

### openssl (自己証明書)
```
sudo apt install openssl
cd ~/
mkdir certs
cd certs
openssl genrsa -out http-server-localhost.key 2048
openssl req -new -key http-server-localhost.key -subj "/CN=ymat" -out http-server-localhost.csr
openssl x509 -req -in http-server-localhost.csr -signkey http-server-localhost.key -CAcreateserial -out http-server-localhost.crt -days 1000
```

### kubectl
https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux

### docker (WSL1)
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

### docker (WSL2)
https://www.docker.com/products/docker-desktop
