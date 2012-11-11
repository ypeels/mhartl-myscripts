#!/bin/bash
pushd ~/shared/first_app

echo
echo Section 1.4 Listing 1.5 add PostgreSQL gem to Gemfile and run bundle install --without production
gedit Gemfile

echo
echo Install heroku toolbelt
echo https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

echo
echo Create new application at Heroku
heroku create

echo 
echo grr need to install and add public key to heroku.com (i am in a fresh new VM)
echo https://devcenter.heroku.com/articles/quickstart
heroku keys:add

echo
echo push to heroku
git push heroku master

echo 
echo other stupid commands
echo "'heroku open' as a shortcut to open your deployment website"
echo "'heroku rename' to change your deployment domain name"


popd