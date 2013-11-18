#!/bin/bash

cd `dirname $0`; cd ../

curl -L https://www.opscode.com/chef/install.sh | bash
bundle install
rbenv rehash

berks install --path ./cookbooks

./config_solo.sh