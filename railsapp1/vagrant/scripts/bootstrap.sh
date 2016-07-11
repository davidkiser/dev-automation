#!/bin/bash

add-apt-repository ppa:git-core/ppa
apt-add-repository ppa:brightbox/ruby-ng # for ruby > 2.0
apt-get update -q -y
apt-get install -y vim git-core curl build-essential python-dev autotools-dev automake ruby2.3 ruby2.3-dev libcurl3 libcurl3-gnutls libcurl4-openssl-dev

# Install gem dependencies for ci scripts
gem install curb:0.9.3 spinning_cursor:0.3.0 --no-ri --no-rdoc

echo "StrictHostKeyChecking no" >> /home/vagrant/.ssh/config
chown vagrant:vagrant /home/vagrant/.ssh/config
ssh-keyscan -H github.com >> ~/.ssh/known_hosts

#cp /vagrant/vagrant/scripts/rc.local /etc/rc.local
