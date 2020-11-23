#! /bin/bash

rm -rfd n454149301-centos-openssh-openjdk-hadoop-3.2.1.tar
rm -rfd n454149301-centos-openssh-openjdk-hadoop-3.2.1.tar.xz
sudo docker save "n454149301/centos-openssh-openjdk-hadoop:3.2.1" -o n454149301-centos-openssh-openjdk-hadoop-3.2.1.tar
sudo xz n454149301-centos-openssh-openjdk-hadoop-3.2.1.tar
