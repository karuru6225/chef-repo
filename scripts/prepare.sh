#!/bin/bash

cd `dirname $0`; cd ../

curl -L https://www.opscode.com/chef/install.sh | bash
BASE="/opt/chef/embedded/bin"
PATH=${BASE}:${PATH}
bundle install
berks install --path ./cookbooks
./config_solo.sh