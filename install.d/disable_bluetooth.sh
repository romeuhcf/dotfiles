#!/bin/bash
sudo rfkill block bluetooth
grep 'rfkill block bluetooth' /etc/rc.local -q || sudo sed 's/^exit 0/rfkill block bluetooth\nexit 0/' -i /etc/rc.local

