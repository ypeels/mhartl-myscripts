#!/bin/bash

echo "The amount of stuff Git can't track is decreasing."
echo "After Listing 9.30, run the following:"
echo "bundle exec rake db:reset"
echo "bundle exec rake db:populate # slooow - creates 100 fake users in development env"
echo "bundle exec rake db:test:prepare"

if [ ! -e db/migrate/*add_admin_to_users.rb ]; then
	rails generate migration add_admin_to_users admin:boolean
fi

echo
echo "After Listing 9.40: "
echo "bundle exec rake db:migrate"
echo "bundle exec rake db:test:prepare"

echo
echo "After Listing 9.41:"
echo "bundle exec rake db:reset"
echo "bundle exec rake db:populate"
echo "bundle exec rake db:test:prepare"

echo 
echo "misc"
echo "heroku config"