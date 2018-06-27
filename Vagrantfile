# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'
settings = YAML.load_file 'settings.yml'

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"  # Ubuntu16.04
  #config.vm.box = "ubuntu/trusty64" # Ubuntu14.04

  config.vm.hostname = "dbox"

  config.vm.network "private_network", ip: "192.168.33.10"

  #config.vm.network "forwarded_port", guest: 8080, host: 8080 # node
  config.vm.network "forwarded_port", guest: 5432, host: 5432 # postgres
  config.vm.network "forwarded_port", guest: 3000, host: 3000 # rails or node
  config.vm.network "forwarded_port", guest: 3100, host: 3100 # ember
  #config.vm.network "forwarded_port", guest: 8888, host: 8888 # nginx
  #config.vm.network "forwarded_port", guest: 2222, host: 22

  config.vm.synced_folder settings['project_directory'], "/var/www", :mount_options => ["dmode=777", "fmode=766"]

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", settings['memory']]
    vb.cpus = settings['cpus']
  end

  config.vm.provision :shell, path: "scripts/dotfiles.sh"
  config.vm.provision :shell, path: "scripts/db.sh"
  config.vm.provision :shell, path: "scripts/db-setup.sh"
  #config.vm.provision :shell, path: "scripts/rvm.sh", args: "stable"
  #config.vm.provision :shell, path: "scripts/rvm-postinstall.sh", args: "ubuntu"
  #config.vm.provision :shell, path: "scripts/ruby.sh", args: "2.1.1 bundler"
  #config.vm.provision :shell, path: "scripts/ruby.sh", args: "2.3.1 bundler"
  config.vm.provision :shell, path: "scripts/node.sh"
  config.vm.provision :shell, path: "scripts/nginx.sh"
  config.vm.provision :shell, path: "scripts/phantomjs.sh"
end
