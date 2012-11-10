#!/bin/bash

echo
echo Section 1.2.2
echo Starting from fresh Ubuntu 12.04 image, since saasbook spoonfed WAY too much installation stuff
echo "steps omitted here: set up git + github (no ssh - just https) - to version these scripts"

#echo 
#echo Well apparently he insists on rvm for gemsets...
#echo had to add group admin to get this to succeed?
#sudo groupadd admin
#sudo apt-get install ruby-rvm
#
#echo
#echo "Installing Ruby 1.9.3 - had to check ftp://ftp.ruby-lang.org/pub/ruby/1.9/"
#echo compile will probably take a while...
#rvm get head && rvm reload
##rvm install 1.9.3
#sudo rvm install 1.9.3-p327

#echo
#echo in the end the stuff above did not work and i just used a pre-made railsinstaller script
#echo https://github.com/rkjha/RailsOnUbuntu/blob/master/rails-installer.sh

echo
echo "rails-installer.sh doesn't work either?! try blog's step-wise instructions"
echo http://blog.sudobits.com/2012/05/02/how-to-install-ruby-on-rails-in-ubuntu-12-04-lts/
curl -L get.rvm.io | bash -s stable

echo 
echo That leads to a stackoverflow workaround
echo http://stackoverflow.com/a/9056395/497756
sudo apt-get --purge remove ruby-rvm
sudo rm -rf /usr/share/ruby-rvm /etc/rvmrc /etc/profile.d/rvm.sh

echo 
echo Nothing should be printed after this - otherwise, reboot...
env | grep rvm

echo
echo install rvm
curl -L get.rvm.io | bash -s stable --auto

echo
echo load rvm
source ~/.rvm/scripts/rvm

echo
echo list additional dependencies
rvm requirements

echo
echo install dependencies
sudo apt-get install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config

echo
echo install javascript runtime
sudo apt-add-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs

echo
echo install ruby! this seems to work now...
rvm install 1.9.3
rvm use 1.9.3 --default
ruby -v

echo 
echo create gemset
rvm use 1.9.3@railstutorial2ndEd --create --default

echo
echo fix git colors
git config --global color.ui true

echo 
echo "2012-11-10: laugh at dead link for 'download RubyGems'"
echo "no feedback form, and i don't feel like emailing the smug bastard"

echo
echo update rubygems
echo "hmm this results in 'Latest version currently installed. Aborting.'..."
gem update --system 1.8.24

echo
echo "Suppress ri and rdoc documentation in .gemrc"
echo "Listing 1.2"
gedit ~/.gemrc

echo
echo Install rails! finally!!
gem install rails -v 3.2.8

echo
echo Finally, install some other packages anyways... (apparently already done above)
sudo apt-get install libxslt-dev libxml2-dev libsqlite3-dev
