#!/bin/bash

cd `dirname $0`; cd ../
chef-solo -c solo.rb -j config/chef.json