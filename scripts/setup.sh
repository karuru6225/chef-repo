#!/bin/bash

#以下のコマンドで実行する
#curl -L https://raw.github.com/karuru6225/chef-repo/master/scripts/setup.sh | bash

set -ex

yum update -y
yum install git
curl -L https://www.opscode.com/chef/install.sh | bash
