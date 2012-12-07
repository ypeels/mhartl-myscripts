#!/bin/bash
pushd ~/sample_app

if [ ! -e app/controllers/sessions_controller.rb ]; then
	echo Section 8.1.1 rails generate SessionsController
	rails generate controller Sessions --no-test-framework
fi

if [ ! -e spec/requests/authentication_pages_spec.rb ]; then
	echo Section 8.1.1 rails generate integration test
	rails rails generate integration_test authentication_pages
fi

popd
