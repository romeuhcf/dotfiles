function host_label(){
  sudo dmidecode -t 1 | grep 'Product Name' | sed 's/.*: //;s/\s\+/-/g'
}
