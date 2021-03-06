# Front-end ressources installation

HOME_DIR="/home/ubuntu"
PROJECT_DIR="/vagrant"
EXPRESS_DIR=$PROJECT_DIR/src/server/express

echo 'EXPRESS_DIR="/vagrant/src/server/express"' >> .bashrc
source .bashrc

apt-get install -y npm
# Install nodejs V8, bug with default 4.2.6 and webpack
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install -y nodejs

# Fix error with shared folder and npm modules
# https://medium.com/@dtinth/isolating-node-modules-in-vagrant-9e646067b36
mkdir $HOME_DIR/vagrant_node_modules
mkdir $PROJECT_DIR/node_modules
mount --bind $HOME_DIR/vagrant_node_modules $PROJECT_DIR/node_modules

cd $PROJECT_DIR
npm install
npm run build