#!/bin/bash
pushd ~/shared/sample_app

if [ ! -e app/models/micropost.rb ]; then
	rails generate model Micropost content:string user_id:integer
	echo "Then Listings 10.1-10.2 and  bundle exec rake db:migrate && bundle exec rake db:test:prepare"
	echo "tests should pass after that"
fi

echo 
echo "After Listing 10.23 run:"
echo "'bundle exec rake db:reset'"
echo "'bundle exec rake db:populate' (SLOW!)"
echo "'bundle exec rake db:test:prepare'"

echo
echo "Before Listing 10.29"
echo "rails generate integration_test micropost_pages"

popd
