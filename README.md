# yocto-pulsar-images
Yocto core-minimal prebuilt images for qemu and Virtual Box which supports Exein Pulsar and Pulsar Enterprise. The images include the [meta-exein layer](https://github.com/exein-io/meta-exein).

## Prerequisites
Install qemu to run the qemu image
For Fedora
```
sudo dnf install qemu -y
```
For Ubuntu
```
sudo apt install qemu-kvm
```

Install [Virtual Box](https://www.virtualbox.org/wiki/Downloads) to run the Virtual Box image

## Boot the qemu image
```
mkdir -p yocto-qemu 
cd yocto-qemu
tar xzf ../yocto-qemu-share.tar.gz
qemu-system-x86_64 \
-device virtio-net-pci,netdev=net0,mac=52:54:00:12:35:02 \
-netdev user,id=net0,hostfwd=tcp:127.0.0.1:2222-:22,hostfwd=tcp:127.0.0.1:2323-:23 \
-m 2048 \
-kernel bzImage-qemux86-64.bin \
-drive file=yocto-qemux86-64.ext4,format=raw \
-append "root=/dev/sda console=ttyS0" \
-net nic \
-net user \
-cpu IvyBridge \
-nographic
```
Login with root (no password), or ssh to the running qemu image from your host with this command:
```
ssh -o StrictHostKeyChecking=no root@127.0.0.1 -p 2222
```
To exit the qemu session, type `Ctrl+A, X`

## Boot the Virtual Box image
```
mkdir -p yocto-vb
cd yocto-vb
tar xzf yocto-vb-share.tar.gz
```
To boot your image with Virtual Box
- Launch Virtual Box
- Create a New Machine
   - VM Name: yocto-vb
   - Specify virtual hard disk - Use an Existing Virtual Hard Disk File - select <YOCTO_BUILD_DIR>/tmp/deploy/images/qemux86-64/yocto-vbx86-64.wic.vdi
   - Press OK
- Go to Settings - System - tick UEFI
- Go to Network - Attached to Bridge Adapter (select you adapter Name)
- Go to Network - Promiscuous Mode: Allow All
- Press OK
- Run the yocto-vb Virtual Machine

Login with root (no password), or ssh to the running image from your host with this command:
```
ssh -o StrictHostKeyChecking=no root@yocto-vb.local
```

## Run Pulsar
Launch `pulsard`

