# Installation

- https://learn.microsoft.com/ja-jp/windows/wsl/install

```powershell
wsl --install -d Ubuntu
```

# Auto setup

```sh
curl -L https://github.com/tsubakimoto/wsl/raw/main/install.sh | bash
```

# References

## git

- https://docs.microsoft.com/ja-jp/windows/wsl/tutorials/wsl-git
- https://blog.shibayan.jp/entry/20210728/1627450686#Git-%E3%81%AE%E8%AA%8D%E8%A8%BC%E6%83%85%E5%A0%B1%E3%82%92-Windows-%E5%81%B4%E3%81%A8%E5%85%B1%E6%9C%89
- https://github.com/tsubakimoto/dotfiles.git

## languages

### anyenv

[install-anyenv.sh](./install-anyenv.sh)

- https://github.com/anyenv/anyenv
- https://qiita.com/y4m3/items/61f99b19bc82c9591b8f#anyenv-update-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB
- [anyenvのアップデートに関するプラグイン](https://github.com/znz/anyenv-update)
- [nodenvでrehashを自動化するプラグイン](https://github.com/nodenv/nodenv-package-rehash#install-via-git-recommended)

### dotnet

- [install-dotnet.sh](./install-dotnet.sh)

https://docs.microsoft.com/ja-jp/dotnet/core/install/linux-ubuntu

## tools

### docker

[install-docker.sh](./install-docker.sh)

- https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
- https://qiita.com/ohtsuka1317/items/617a865b8a9d4fb67989

#### startup
`shell:startup` -> [wsl-service-start.bat](./wsl-service-start.bat)

### Azure tools

[install-azure-tools.sh](./install-azure-tools.sh)

- [Azure CLI](https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli-apt?view=azure-cli-latest)
- [Azure Functions Core Tools](https://github.com/Azure/azure-functions-core-tools/blob/master/README.md#linux)

### yarn

- https://yarnpkg.com/en/docs/install

### Vue.js

- https://v3.ja.vuejs.org/guide/installation.html

### composer

- https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md

### openssl

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

- https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux
