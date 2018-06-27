#!/usr/bin/env bash

sudo apt-get install build-essential -y >>/tmp/$LOG 2>&1
sudo apt-get install libssl-dev libreadline-dev zlib1g-dev -y >>/tmp/$LOG 2>&1

git clone https://github.com/rbenv/rbenv.git ~/.rbenv

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
