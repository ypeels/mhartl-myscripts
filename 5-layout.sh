#!/bin/bash
pushd ~/shared/sample_app

if [ ! -e app/controllers/users_controller.rb ]; then
    echo
    echo Listing 5.28
    echo "Generating Users controller: rails generate controller Users new --no-test-framework"
    rails generate controller Users new --no-test-framework
fi

if [ ! -e spec/requests/user_pages_spec.rb ]; then
    echo
    echo Section 5.4.2
    echo "Generating User pages' tests: rails generate integration_test user_pages"
    rails generate integration_test user_pages
fi

popd
