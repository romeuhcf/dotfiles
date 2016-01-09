#!/bin/bash
set -e
sudo apt-get install psensor -y
cp psensor.desktop ~/.config/autostart  -v 
