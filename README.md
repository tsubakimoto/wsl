# インストール
https://docs.microsoft.com/ja-jp/windows/wsl/install-win10

```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2
```

# セットアップ
## installation
PowerShellで以下を実行する。

```sh
wsl -d Ubuntu-20.04
sudo sed -i -e 's%http://.*.ubuntu.com%http://ftp.jaist.ac.jp/pub/Linux%g' /etc/apt/sources.list
sudo apt update -y
sudo apt upgrade -y
sudo timedatectl set-timezone 'Asia/Tokyo'
sudo apt-get install -y net-tools
echo -e "[interop]\nappendWindowsPath=false" | sudo sh -c 'cat - > /etc/wsl.conf'
exit
wsl --shutdown -d Ubuntu-20.04
```

## git
```sh
cd ~
sudo apt-get install -y git
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager-core.exe"
git clone https://github.com/tsubakimoto/config.git
git clone https://github.com/tsubakimoto/dotfiles.git
```

- https://docs.microsoft.com/ja-jp/windows/wsl/tutorials/wsl-git
- https://blog.shibayan.jp/entry/20210728/1627450686#Git-%E3%81%AE%E8%AA%8D%E8%A8%BC%E6%83%85%E5%A0%B1%E3%82%92-Windows-%E5%81%B4%E3%81%A8%E5%85%B1%E6%9C%89
- https://github.com/tsubakimoto/dotfiles.git

## SSHキー
```sh
mkdir ~/.ssh
```

## 言語系
### anyenv
- https://github.com/anyenv/anyenv
- https://qiita.com/y4m3/items/61f99b19bc82c9591b8f#anyenv-update-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB
- [anyenvのアップデートに関するプラグイン](https://github.com/znz/anyenv-update)
- [nodenvでrehashを自動化するプラグイン](https://github.com/nodenv/nodenv-package-rehash#install-via-git-recommended)

```sh
chmod +x ~/config/wsl/install-anyenv.sh
~/config/wsl/install-anyenv.sh
```

### dotnet
https://docs.microsoft.com/ja-jp/dotnet/core/install/linux-ubuntu

## ツール系

### docker
- https://qiita.com/ohtsuka1317/items/617a865b8a9d4fb67989
- https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

```sh
sudo apt-get update -y
sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo apt install docker-compose -y

sudo service docker start

sudo usermod -aG docker $USER

#ターミナルを再起動する
```

### yarn
https://yarnpkg.com/en/docs/install

```sh
npm install -g yarn
```

### Vue.js
https://v3.ja.vuejs.org/guide/installation.html

```sh
npm install -g @vue/cli
npm install -g @vue/cli-service-global
```

### composer
https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md

```sh
wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet
```

### az
https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli-apt?view=azure-cli-latest

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
