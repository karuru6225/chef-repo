#!/bin/bash

cd ../
bundle install --path ./vendor/bundle
rbenv rehash
berks install --path ./cookbooks

./config_solo.sh