#!/bin/bash
pushd ~/shared

echo "Starting with this chapter, in the shell scripts, I'm only going to document steps that Git can't track"

if [ ! -d mhartl-sample_app ]; then
	echo Creating sample_app
	rails new sample_app --skip-test-unit
fi

cd sample_app

echo
echo Listing 3.1
echo "Then script will run 'bundle install --without production'" 
echo "and 'rails generate rspec:install'"
echo "Note that you MAY need to keep the \"gem 'therubyracer'\" line in the Gemfile to satisfy the JS runtime requirement"
echo "Ugh I had to run 'gem install rails -v 3.2.9' and 'bundle update' because his tutorial's version numbers changed!"
echo "I can't believe that dorky bastard charges people money for this...I guess I'm reading a free version though..."
gedit Gemfile
bundle install --without production

if [ ! -e .rspec ]; then
    echo Initializing RSpec files
    rails generate rspec:install
fi

if [ $( | grep -c heroku) -eq 0 ]; then
    echo Initializing Heroku
    heroku create --stack cedar
    git push heroku master
fi

if [ ! -e app/controllers/static_pages_controller.rb ]; then
    echo Listing 3.4 Generating StaticPages controller
    git checkout -b static-pages
    rails generate controller StaticPages home help --no-test-framework
fi

if [ ! -e spec/requests/static_pages_spec.rb ]; then
    echo Above Listing 3.9 - generate integration tests for static pages
    rails generate integration_test static_pages
fi

echo Running integration test
bundle exec rspec spec/requests/static_pages.rb

popd