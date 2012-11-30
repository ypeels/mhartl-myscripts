#!/bin/bash
pushd ~/sample_app

if [ ! -e app/models/user.rb ]; then
	echo
	echo "Listing 6.1: rails generate model User name:string email:string"
	rails generate model User name:string email:string
	bundle exec rake db:migrate
fi

echo
echo Listing 6.4 - automatically annotate model code files
bundle exec annotate

echo Useful tips
echo "- Section 6.1.3 `rails console --sandbox` - 'Any modifications you make will be rolled back on exit'"
echo "- Section 6.2.2 `user.errors.full_messages` to determine why validation failed"
echo "- Section 6.3.5 `rails console` to add entries to development db - and view using SQLite Manager"

if [ ! -e db/migrate/*_add_index_to_users_email.rb ]; then
	echo Generating email index migration (have to fill in by hand and then run rake db:migrate - Listing 6.22)
	rails generate migration add_index_to_users_email
	gedit db/migrate/*_add_index_to_users_email.rb
	bundle exec
fi

if [ ! -e db/migrate/*_add_password_digest_to_users.rb ]; then
	echo "Generating and applying password migration"
	rails generate migration add_password_digest_to_users password_digest:string
	bundle exec rake db:migrate
	bundle exec rake db:test:prepare
fi


popd
