#!/usr/bin/env bash
PGVERSION=10
POSTGIS_VERSION=2.4
LOG="provision-script.log"

sudo add-apt-repository 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main'

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
    sudo apt-key add -

sudo apt-get update -y >>/tmp/$LOG 2>&1

sudo apt-get install software-properties-common -y >>/tmp/$LOG 2>&1

echo "Installing: bash openssl libssl-dev libssl-doc"
sudo apt-get install bash openssl libssl-dev libssl-doc -y >>/tmp/$LOG 2>&1

echo "Installing: libpq-dev python-psycopg2"
sudo apt-get install libpq-dev python-psycopg2 -y >>/tmp/$LOG 2>&1

echo "Installing: postgresql-$PGVERSION"
sudo apt-get install postgresql-$PGVERSION postgresql-server-dev-$PGVERSION postgresql-contrib-$PGVERSION -y >>/tmp/$LOG 2>&1

echo "Installing: postgis-$POSTGIS_VERSION"
sudo apt-get install postgresql-$PGVERSION-postgis-$POSTGIS_VERSION >>/tmp/$LOG 2>&1

echo "Update postgresql.conf"
echo "listen_addresses = '*'" >> /etc/postgresql/$PGVERSION/main/postgresql.conf 

echo "Update pg_hba.conf"
rm /etc/postgresql/$PGVERSION/main/pg_hba.conf
echo "local   all   postgres   trust
local   all   all        trust
host    all   all        0.0.0.0/0     trust" >> /etc/postgresql/$PGVERSION/main/pg_hba.conf

echo "Restarting postgres"
sudo /etc/init.d/postgresql restart
