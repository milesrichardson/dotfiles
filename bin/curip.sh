curl -s http://checkip.dyndns.com/ | perl -n -e '/(\d+\.\d+\.\d+\.\d+)/ && print $1'
