#!/bin/bash


doAll()             {
    instlDockr
    preprDryoct
    runDryoct
    instRepstrTask3
    bitbkImg
}
help()              {
echo "USAGE $0
doAll
instlDockr
preprDryoct
runDryoct
instRepstrTask3
bitbkImg
"
}
instlDockr()        {
    sudo apt-get update && sudo apt-get upgrade
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker [user_name]
    docker version
    docker info
    docker run hello-world
}
preprDryoct()       {
    mkdir /public/Work
    cd /public/Work
    git clone https://github.com/bstubert/dr-yocto.git
    cd dr-yocto
    git checkout ubuntu-18.04
    ./build.sh 18.04 ./18.04
}
runDryoct()         {
    cd /public/Work
    ./dr-yocto/run-shell.sh 18.04
}
instRepstrTask3()   {
	mkdir /public/Work/yoctTaskS
	rm -rf /public/Work/yoctTaskS/build-rpi3-aufgabe3/
	rm -rf /public/Work/yoctTaskS/sources/
	ls -la /public/Work/yoctTaskS/
	cd /public/Work/yoctTaskS
	repo init -u https://github.com/wolfgangFischerMas/repo-manifests.git -m repo-yocto-aufgabe3.xml 
        repo sync
}
bitbkImg()          {
	export TEMPLATECONF=/public/Work/yoctTaskS/sources/meta-aufgabe3/custom
	source ./sources/poky/oe-init-build-env build-rpi3-aufgabe3
	cd /public/Work/yoctTaskS/build-rpi3-aufgabe3
	bitbake aufgabe4-image
}

COMND="help"; if [ "$1" != "" ] ; then COMND="$1"; fi; $COMND "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9"
