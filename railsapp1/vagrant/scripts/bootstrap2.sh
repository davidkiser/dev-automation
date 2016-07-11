#!/bin/bash
export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-amd64
export RUBY_VERSION=2.2.4

sudo apt-get -y install unzip curl git-core openssl build-essential libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev 

# Ruby w/ rbenv and ruby-build. Needs root to mkdir
sudo mkdir /usr/local/rbenv
sudo git clone https://github.com/rbenv/rbenv.git /usr/local/rbenv
sudo git clone https://github.com/rbenv/ruby-build.git /usr/local/rbenv/plugins/ruby-build
sudo chown -R vagrant:vagrant /usr/local/rbenv

# Bash Profile
git clone https://github.com/magicmonty/bash-git-prompt.git ~vagrant/.bash-git-prompt
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~vagrant/git-completion.bash
sudo chown -R vagrant:vagrant /home/vagrant
cat <<EOT >> /home/vagrant/.bash_profile
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/

#rbenv
export RBENV_ROOT=/usr/local/rbenv
export PATH="\$RBENV_ROOT/bin:$PATH"
eval "\$(rbenv init -)"

# git prompt
source /home/vagrant/.bash-git-prompt/gitprompt.sh
source /home/vagrant/git-completion.bash

# common aliases
alias ll='ls -la'
alias be='bundle exec'

# This directory has your code
cd /vagrant
EOT

export RBENV_ROOT=/usr/local/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
rbenv install 2.2.4
rbenv global 2.2.4

cd /vagrant

cat <<EOT >> /home/vagrant/.gemrc
gem: --no-document
EOT

source ~vagrant/.bash_profile

# gems
gem sources -a https://rubygems.org
gem install bundler -v 1.12.5

# Setup Rails
cd /vagrant
wget https://s3.amazonaws.com/automationlabcitrix/hello-app.zip
unzip hello-app.zip
cd hello

bundle install

#Start rails server
rails server -b 0.0.0.0 -d


