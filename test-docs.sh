#!/bin/sh

MOD_REPO="$1"

git clone https://github.com/ansible/ansible ansible-checkout
cd ansible-checkout
git submodule update --init
rm -rf "lib/ansible/modules/$MOD_REPO"
ln -s ../ "lib/ansible/modules/$MOD_REPO"

. ./hacking/env-setup
bin/ansible-doc -l
make -C docsite
