#1/bin/bash/

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y autoremove
sudo apt-get -y remove nodejs
sudo wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
nvm install v6.9.2
nvm alias default v6.9.2
n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local

sudo su

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

export NVM_DIR="/root/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" 

nvm install 6.9.2

cd /monerodo/

git clone https://github.com/Gingeropolous/cryptonote-xmr-pool.git ging_pool

cd ging_pool

git checkout clean

nvm alias default v6.9.2

exit

cd /monerodo/ging_pool
sudo npm update

now=$(date +"%m_%d_%Y")

cd /home/bob/monero_files/
mkdir monero_$now
cd monero_$now

wget https://downloads.getmonero.org/linux64
tar -xjvf linux64

# Copy binaries to /bin
#Restart service to use new binaries
export running=$(service mos_bitmonero status)
export mos_service="mos_bitmonero"

/home/bob/monerodo/service_off.sh

sudo cp monerod /bin
sudo cp monero-wallet-cli /bin
sudo cp monero-wallet-rpc /bin

echo "You'll have to turn monero core on again in the settings menu. Press enter to continue"
read goback
cd /home/bob/monerodo/

cp /home/bob/monerodo/conf_files/mos_poolnode.conf /home/bob/.monerodo/
sudo cp /home/bob/monerodo/conf_files/mos_poolnode.conf /etc/init/

cd /home/bob/monerodo/

./setup_pool_wallet.sh

echo "yes" > $FILEDIR/2017FORK1.txt

echo "Your Monerodo has been updated for the upcoming fork. Thanks for using the Monerodo. Please consider donating for continued development."
echo "The donation address is: 44UW4sPKb4XbWHm8PXr6K8GQi7jUs9i7t2mTsjDn2zK7jYZwNERfoHaC1Yy4PYs1eTCZ9766hkB6RLUf1y95EvCQNpCZnuu"
echo "Please press return to continue"
read goback