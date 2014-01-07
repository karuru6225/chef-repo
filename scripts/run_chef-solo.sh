#!/bin/bash

cd `dirname $0`; cd ../
echo -n 'Please input config file : '
read CFILE
chef-solo -c solo.rb -j ${CFILE}
