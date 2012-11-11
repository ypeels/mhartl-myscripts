#!/bin/bash
pushd ~/shared

if [ ! -d first_app ]; then
    echo Section 1.2.3 Listing 1.3
    rails new first_app
fi

cd first_app

echo
echo Section 1.2.4 Listing 1.4
echo Modify Gemfile to illustrate Bundler
gedit Gemfile

echo 
echo Section 1.2.5 Hello Rails
firefox localhost:3000 &
rails server


popd
