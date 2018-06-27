echo "Installing dotfiles"
git clone https://github.com/rdeguzman/dotfiles /home/vagrant/.dotfiles

echo "Backing up old .bashrc"
mv /home/vagrant/.bashrc /home/vagrant/.bashrc.old

echo "Creating symbolic links"
ln -s /home/vagrant/.dotfiles/ubuntu/bash /home/vagrant/.bash 
ln -s /home/vagrant/.dotfiles/ubuntu/bashrc /home/vagrant/.bashrc 
ln -s /home/vagrant/.dotfiles/ubuntu/localrc /home/vagrant/.localrc
ln -s /home/vagrant/.dotfiles/vimrc /home/vagrant/.vimrc

echo "chown -Rf vagrant:vagrant /home/vagrant"
chown -Rf vagrant:vagrant /home/vagrant

echo "Setup vim plugin"
curl -fLo /home/vagrant/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo chown -Rf vagrant:vagrant /home/vagrant/.vim
