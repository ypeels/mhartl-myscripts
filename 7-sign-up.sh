#!/bin/bash
pushd ~/sample_app

echo Helpful tips
echo "Box 7.1"
echo "- `rails console test` to load test environment"
echo "- `rails server --environment production`"
echo "- `bundle exec rake db:migrate RAILS_ENV=production`"
echo "- `heroku run console` (!!! defaults to production environment)"
echo
echo Section 7.1.4
echo "rails console: user.update_attributes - since user.save might get refused..."
echo
echo Section 7.2
echo "- `bundle exec rake db:reset && bundle exec rake db:test:prepare`"
echo "- bundle exec rspec spec -e \"signup\"` will run all tests with 'signup' substring" 


popd
