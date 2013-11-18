#!/bin/bash

cd `dirname $0`; cd ../

bundle install
rbenv rehash

berks install --path ./cookbooks

./config_solo.sh