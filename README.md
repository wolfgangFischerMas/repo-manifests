# repo-manifests

## installation
cd /public/Work
./dr-yocto/run-shell.sh 18.04

rm -rf /public/Work/yoctTaskS/build-rpi3-aufgabe3/
rm -rf /public/Work/yoctTaskS/sources/
ls -la /public/Work/yoctTaskS/
cd /public/Work/yoctTaskS
repo sync 

export TEMPLATECONF=/public/Work/yoctTaskS/sources/meta-aufgabe3/custom
source ./sources/poky/oe-init-build-env build-rpi3-aufgabe3
cd /public/Work/yoctTaskS/build-rpi3-aufgabe3
bitbake aufgabe4-image
