#!/bin/sh

YOCTO_BUILD_DIR=~/workdir/poky/build

mkdir -p tmp/yocto-qemu-share
cp $YOCTO_BUILD_DIR/tmp/deploy/images/qemux86-64/yocto-qemux86-64.* tmp/yocto-qemu-share/
cp $YOCTO_BUILD_DIR/tmp/deploy/images/qemux86-64/bzImage-qemux86-64.bin tmp/yocto-qemu-share/
cd tmp/yocto-qemu-share
tar czf ../../yocto-qemu-share.tar.gz *
cd ../..

mkdir -p tmp/yocto-vb-share
cp $YOCTO_BUILD_DIR/tmp/deploy/images/qemux86-64/yocto-vbx86-64.wic.vdi tmp/yocto-vb-share/
cd tmp/yocto-vb-share
tar czf ../../yocto-vb-share.tar.gz *

