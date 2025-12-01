#!/bin/sh

echo Please check that "yocto - Exein Pulsar (scarthgap)" VM is present and updated in Virtual Box.
read -p "Once done, press Enter to continue ..."

rm -rf tmp/yocto-vagrant-share
mkdir -p tmp/yocto-vagrant-share
cp utils/Vagrantfile tmp/yocto-vagrant-share
cd tmp/yocto-vagrant-share
vagrant package --base "yocto - Exein Pulsar (scarthgap)" --output yocto-vbx86-64.box
tar czf ../yocto-vagrant-share.tar.gz Vagrantfile yocto-vbx86-64.box

