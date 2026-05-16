# Ubuntu 26.04 WSL setup with Ansible

このディレクトリは、リポジトリ内の `install*.sh` を Ubuntu 26.04 向けの Ansible 構成に置き換えたものです。WSL 上のローカル実行を前提に、初期セットアップをロール単位で再実行可能にしています。

## 前提条件

- Windows 側で WSL2 と Ubuntu 26.04 を作成済み
- 初回実行時に sudo できるユーザーでログインしている
- Ubuntu 側で Ansible と Git をインストール済み

```sh
sudo apt update
sudo apt install -y ansible git
```

## 実行手順

```sh
git clone https://github.com/tsubakimoto/wsl.git ~/wsl
cd ~/wsl/ansible
ansible-playbook playbooks/workstation.yml -K
```

`-K` は sudo パスワード入力用です。`wsl_configure_passwordless_sudo=true` が既定値なので、2 回目以降は不要になる構成です。

## 既定で入るもの

- WSL 共通設定: `sudoers`, `/etc/wsl.conf`, Windows Git Credential Manager 連携
- anyenv: `nodenv`, `phpenv`, `pyenv`
- .NET SDK 8
- Azure CLI / Azure Developer CLI / Azure Functions Core Tools 4
- 開発ツール: MySQL client, GitHub CLI

Docker は旧 `install.sh` と同様に **既定では無効** です。

## よく使う上書き例

### Docker も入れる

```sh
ansible-playbook playbooks/workstation.yml -K -e wsl_install_docker=true
```

### dotfiles も取得してインストーラーを流す

```sh
ansible-playbook playbooks/workstation.yml -K \
  -e wsl_dotfiles_repo=https://github.com/tsubakimoto/dotfiles.git \
  -e wsl_run_dotfiles_install=true
```

### 一部ロールだけ再実行する

```sh
ansible-playbook playbooks/workstation.yml -K --tags anyenv,dotnet
ansible-playbook playbooks/workstation.yml -K --tags docker -e wsl_install_docker=true
```

## 主要変数

| Variable | Default | Purpose |
| --- | --- | --- |
| `wsl_default_user` | `{{ ansible_user_id }}` | `/etc/wsl.conf` に書き込む既定ユーザー |
| `wsl_install_docker` | `false` | Docker ロールを有効化する |
| `wsl_git_credential_helper` | `/mnt/c/Program Files/Git/mingw64/bin/git-credential-manager.exe` | Windows 側 Git Credential Manager のパス |
| `wsl_dotfiles_repo` | `""` | dotfiles を自動取得する場合の Git URL |
| `wsl_run_dotfiles_install` | `false` | dotfiles 側 `install.sh` を実行するか |

## 実行後の反映

- `/etc/wsl.conf` を変更したあとは、Windows 側で `wsl --shutdown` を実行してから Ubuntu を開き直すと反映しやすいです。
- Docker を入れた場合は、新しいシェルを開くか `newgrp docker` を実行すると `docker` グループが反映されます。
- `wsl-service-start.bat` は必要なら引き続き使えますが、Ansible 構成では `wsl_install_docker=true` 時に `/etc/wsl.conf` の boot command を設定します。
