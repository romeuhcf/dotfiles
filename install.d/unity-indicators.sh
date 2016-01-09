#!/bin/bash 

sudo apt-get install indicator-cpufreq -y indicator-multiload
indicator-cpufreq & 
indicator-multiload &
