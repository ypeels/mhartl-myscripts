#!/bin/bash
pushd ~/sample_app

if [ ! -e app/models/relationship.rb ]; then
	rails generate model Relationship follower_id:integer followed_id:integer
	echo "Apply Listing 11.1, then run:"
	echo "bundle exec rake db:migrate && bundle exec rake db:test:prepare"
fi

popd
