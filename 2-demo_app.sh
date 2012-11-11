#!/bin/bash
pushd ~/shared

if [ ! -d demo_app ]; then

    echo 
    echo Section 2.1 initial Rails infrastructure and commit

    echo
    echo Run rails new
    rails new demo_app
    
    cd demo_app

    echo 
    echo Listing 2.1: freeze gem versions and run bundle install
    gedit Gemfile
    bundle install --without production

    echo 
    echo initialize git
    git init
    git add .
    git commit -m "Initial commit"
    git remote add origin https://github.com/ypeels/mhartl-demo_app.git
    git push -u origin master
    
fi


pushd ~/shared/demo_app
if [ ! -e app/models/user.rb ]; then

    echo
    echo Section 2.2 The Users resource
    
    echo
    echo generate scaffold
    cd ~/shared/demo_app
    rails generate scaffold User name:string email:string
    
    echo
    echo migrate database
    bundle exec rake db:migrate

    echo
    echo behold your handiwork
    firefox localhost:3000 &
    rails s

fi
popd

echo
echo "Box 2.1 - Useful Rake (Ruby make) commands"
echo bundle exec rake -T db - list of database tasks
echo bundle exec rake -T - list of ALL Rake tasks

echo
echo Section 2.2.1 user tour
echo http://localhost:3000/users/
echo http://localhost:3000/users/new/
echo http://localhost:3000/users/1/
echo http://localhost:3000/users/1/edit

pushd ~/shared/demo_app
if [ ! -e app/models/micropost.rb ]; then
    echo
    echo Section 2.3 The Micropost resource
    
    echo
    echo rails generate scaffold for micropost
    rails generate scaffold Micropost content:string user_id:integer 
    
    echo
    echo migrate db
    bundle exec rake db:migrate
fi
popd

pushd ~/shared/demo_app


echo
echo stupid incomplete development environment
echo http://stackoverflow.com/questions/8990828/
echo Add to .bashrc
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"'

echo 
echo Section 2.3.5 deploy
echo "hmm, any way to detect whether i've done this already?"
heroku create --stack cedar
git push heroku master
heroku run rake db:migrate
heroku open

echo
echo "stupid TA - there are deployment issues - looks ok in development"
echo "stupid rails and/or saas - when it works it works, but when it doesn't..."

popd



popd
