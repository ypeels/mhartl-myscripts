#!/bin/bash
pushd ~/sample_app

if [ ! -e app/controllers/sessions_controller.rb ]; then
	echo Section 8.1.1 rails generate SessionsController
	rails generate controller Sessions --no-test-framework
fi

if [ ! -e spec/requests/authentication_pages_spec.rb ]; then
	echo Section 8.1.1 rails generate integration test
	rails generate integration_test authentication_pages
fi

if [ ! -e db/migrate/*add_remember_token_to_users.rb ]; then
    echo Section 8.2 below Listing 8.15
    rails generate migration add_remember_token_to_users
    echo "Don't forget to run rake db:migrate, rake db:test:prepare after Listing 8.16"

    echo
    echo "Also, as described after Listing 8.25, need to re-save User in database via rails console to see effect in rails server..."
    echo "User.all.each { |user| user.save(validate: false) }" 

fi

if [ ! -d features ]; then
	echo "Listing 8.31 add cucumber, then bundle install"
	echo "Then `rails generate cucumber:install`"
fi

popd
