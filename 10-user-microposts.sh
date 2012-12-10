#!/bin/bash
pushd ~/shared/sample_app

if [ ! -e app/models/micropost.rb ]; then
	rails generate model Micropost content:string user_id:integer
	echo "Then Listings 10.1-10.2 and  bundle exec rake db:migrate && bundle exec rake db:test:prepare"
	echo "tests should pass after that"
fi

popd
