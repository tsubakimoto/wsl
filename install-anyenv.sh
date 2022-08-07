#!/bin/bash
set -x

# Install anyenv
cd ~/
git clone https://github.com/anyenv/anyenv ~/.anyenv
#echo '' >> ~/.profile
#echo '# anyenv' >> ~/.profile
#echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.profile
#echo 'eval "$(anyenv init -)"' >> ~/.profile
exec $SHELL -l
~/.anyenv/bin/anyenv init
anyenv install --force-init

## Install anyenv plugins
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

git clone https://github.com/nodenv/nodenv-package-rehash.git "$(nodenv root)"/plugins/nodenv-package-rehash
nodenv hooks install
nodenv package-hooks install --all

# Install binaries for phpenv
cd ~/
apt -y install build-essential
apt -y install libxml2-dev libssl-dev libbz2-dev libcurl4-openssl-dev libjpeg-dev libpng-dev libmcrypt-dev libreadline-dev libtidy-dev libxslt-dev libzip-dev autoconf pkg-config libsqlite3-dev libonig-dev

# Install *env
cd ~/
anyenv install nodenv
anyenv install phpenv
anyenv install pyenv
exec $SHELL -l
