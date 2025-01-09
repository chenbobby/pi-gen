#!/bin/bash -e

echo "[stage2/01-sys-tweaks/02-run.sh] Starting..."

dpkg --add-architecture armhf
apt-get update
apt-get install -y git libc6:armhf libisl23:armhf libmpfr6:armhf libmpc3:armhf libstdc++6:armhf

echo "[stage2/01-sys-tweaks/02-run.sh] Linking..."

ln -s /usr/lib/arm-linux-gnueabihf/libisl.so.23.0.0  /usr/lib/arm-linux-gnueabihf/libisl.so.10
ln -s /usr/lib/arm-linux-gnueabihf/libmpfr.so.6.1.0 /usr/lib/arm-linux-gnueabihf/libmpfr.so.4

git clone https://github.com/seemoo-lab/nexmon
cd nexmon
source setup_env.sh 
make
cd 

cd patches/bcm43436b0/9_88_4_65/nexmon
make
make backup-firmware
make install-firmware

cd ../../../../utilities/nexutil
make
make install
