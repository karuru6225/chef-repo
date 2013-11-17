#!/bin/sh

cd `dirname $0`
BASEDIR=`pwd`
cd - > /dev/null

OUTPUT_SOLO=${BASEDIR}/solo.rb
OUTPUT_KNIFE=${BASEDIR}/knife.rb

[ -d /tmp/chef-solo ] || mkdir -p /tmp/chef-solo

cat<<EOF>$OUTPUT_SOLO
file_cache_path "/tmp/chef-solo"
cookbook_path ["cookbooks", "site-cookbooks"]
data_bag_path "data_bags"
role_path "roles"
EOF

cp $OUTPUT_SOLO $OUTPUT_KNIFE
