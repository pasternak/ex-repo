#!/usr/bin/env bash

for plugin in vagrant-berkshelf vagrant-cachier vagrant-chef-zero vagrant-omnibus vagrant-share vagrant-vbguest; do
  vagrant plugin install $plugin
done

vagrant up

./verify.sh
