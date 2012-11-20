#!/bin/bash
pushd ~/shared

echo "Starting with this chapter, in the shell scripts, I'm only going to document steps that Git can't track"

if [ ! -d mhartl-sample_app ]; then
	echo Creating sample_app
	rails new mhartl-sample_app --skip-test-unit
fi

cd mhartl-sample_app

echo
echo Listing 3.1
echo "Then script will run 'bundle install --without production'" 
echo "and 'rails generate rspec:install'"
echo "Note that you should keep the \"gem 'therubyracer'\" line in the Gemfile to satisfy the JS runtime requirement"
gedit Gemfile
bundle install --without production
rails generate rspec:install

popd