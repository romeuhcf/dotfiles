#!/bin/bash
sudo apt-get install i8kutils -y
grep i8k /etc/modules || echo i8k | sudo tee -a /etc/modules

echo 'options i8k force=1' | sudo tee /etc/modprobe.d/i8k.conf
sudo modprobe i8k force=1

sudo apt-get install ruby
sudo cp tempmon /usr/local/bin/tempmon
sudo chmod +x /usr/local/bin/tempmon
cp tempmon.desktop ~/.config/autostart 


