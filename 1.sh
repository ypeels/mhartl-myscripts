#!/bin/bash

echo
echo Section 1.2.2
echo Starting from fresh Ubuntu 12.04 image, since saasbook spoonfed WAY too much installation stuff

echo 
echo Well apparently he insists on rvm for gemsets...
sudo apt-get install ruby-rvm

echo
echo Installing Ruby 1.9.3
rvm install 1.9.3

echo 
