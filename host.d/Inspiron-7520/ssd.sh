#https://www.leaseweb.com/labs/2013/07/5-crucial-optimizations-for-ssd-usage-in-ubuntu-linux/
echo -e "vm.swappiness=0" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
sudo sed 's/\(noatime,\)?errors=remount-ro/noatime,errors=remount-ro/' -i /etc/fstab
echo -e "#\x21/bin/sh\\nfstrim -v /" | sudo tee /etc/cron.daily/trim
sudo fstrim -v /
