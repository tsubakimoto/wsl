#!/bin/bash
set -xe

# Install anyenv
git clone https://github.com/anyenv/anyenv $HOME/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> $HOME/.bash_profile
#$HOME/.anyenv/bin/anyenv init
echo 'eval "$(anyenv init -)"' >> $HOME/.bash_profile
yes | anyenv install --init

# Install anyenv plugins
ANYENV_ROOT=`anyenv root`
mkdir -p $ANYENV_ROOT/plugins
git clone https://github.com/znz/anyenv-update.git $ANYENV_ROOT/plugins/anyenv-update

# Install binaries for phpenv
apt -y install build-essential
apt -y install libxml2-dev libssl-dev libbz2-dev libcurl4-openssl-dev libjpeg-dev libpng-dev libmcrypt-dev libreadline-dev libtidy-dev libxslt-dev libzip-dev autoconf pkg-config libsqlite3-dev libonig-dev

# Install *env
anyenv install nodenv
anyenv install phpenv
anyenv install pyenv
exec $SHELL -l

# Install nodenv plugin
NODENV_ROOT=`nodenv root`
git clone https://github.com/nodenv/nodenv-package-rehash.git $NODENV_ROOT/plugins/nodenv-package-rehash
nodenv hooks install
nodenv package-hooks install --all
