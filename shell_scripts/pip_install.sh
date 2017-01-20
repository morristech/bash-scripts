#!/bin/bash
#
# install pip
# test on centos6 and centos 7
#

country=$1

function __install_pip()
{
    yum -y install python
    # wget -c https://raw.github.com/pypa/pip/master/contrib/get-pip.py
    wget -c https://bootstrap.pypa.io/get-pip.py
    python get-pip.py 

}

function __ustc_mirrors()
{
mkdir -p ~/.pip/
cat > ~/.pip/pip.conf <<EOF
[global]
index-url = https://mirrors.ustc.edu.cn/pypi/web/simple
format = columns
EOF
}


# if pip is not exist ,then install it
which pip || __install_pip


# set the default source mirror 
case $country in 
[cC][nN]) __ustc_mirrors ;;
# [cC][nN]) __ustc_mirrors ;;
esac

