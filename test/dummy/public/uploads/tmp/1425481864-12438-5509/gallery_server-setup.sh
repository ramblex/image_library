Ubuntu 14.04

sudo apt-get update
sudo apt-get install git

# install rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

sudo apt-get install postgresql
sudo apt-get install build-essential libreadline6 libreadline6-dev libssl-dev zlib1g zlib1g-dev libyaml-dev libxslt-dev libxml2-dev libcurl4-openssl-dev
rbenv install 2.1.5
rbenv global 2.1.5
echo 'gem: --no-ri --no-rdoc' > ~/.gemrc
gem install passenger

sudo dd if=/dev/zero of=/swap bs=1M count=1024
sudo mkswap /swap
sudo swapon /swap

export ORIG_PATH="$PATH"
sudo -s -E
export PATH="$ORIG_PATH"
/home/deploy/.rbenv/versions/2.1.5/bin/ruby /home/deploy/.rbenv/versions/2.1.5/lib/ruby/gems/2.1.0/gems/passenger-4.0.58/bin/passenger-install-nginx-module 

gem install bundler
sudo apt-get install imagemagick
