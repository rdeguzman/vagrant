#!/usr/bin/env bash

FILE="phantomjs-2.1.1-linux-x86_64"
echo "Downloading $FILE"
cd /home/vagrant/
wget "https://bitbucket.org/ariya/phantomjs/downloads/$FILE.tar.bz2"

echo "Decompressing $FILE"
bzip2 -d $FILE
tar -xf $FILE.tar

echo "Copy bin to /usr/local/bin"
sudo cp /home/vagrant/$FILE/bin/phantomjs /usr/local/bin/
