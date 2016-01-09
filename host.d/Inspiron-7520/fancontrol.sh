#!/bin/bash

set -e 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo apt-get install i8kutils -y
grep i8k /etc/modules || echo i8k | sudo tee -a /etc/modules
echo 'options i8k force=1' | sudo tee /etc/modprobe.d/i8k.conf
sudo modprobe i8k force=1
sudo cp "$DIR"/fancontrol-etc-i8kmon.conf /etc/i8kmon.conf
sudo i8kfan 2 2
sudo apt-get install psensor -y
sudo apt-get build-dep i8kutils -y
cd /tmp
sudo apt-get source i8kutils
cd i8kutils-1.*

sudo apt-get install g++-multilib -y
sudo gcc -g -O2 -Wall -I. -o smm -m32 smm.c
sudo cp smm /usr/local/bin -fv 
grep smm /etc/rc.local || echo "/usr/local/bin/smm 30a3" | sudo tee -a /etc/rc.local

sudo apt-get install linux-tools-common linux-tools-generic -y
sudo apt-get install cpufrequtils -y
sudo sed -i 's/^GOVERNOR=.*/GOVERNOR="powersave"/' /etc/init.d/cpufrequtils 

sudo apt-get install thermald
