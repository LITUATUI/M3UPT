#!/bin/bash

cd EPG

tv_sort --by-channel --output epg-vodafone-pt-sorted.xml epg-vodafone-pt.xml && tv_sort --by-channel --output epg-rtp-sorted.xml epg-rtp.xml 

tv_merge -i epg-vodafone-pt-sorted.xml -m epg-rtp-sorted.xml -o epg-portugal.xml && xz -k -f -9 epg-portugal.xml && gzip -v9 -c epg-portugal.xml > epg-portugal.xml.gz

exit 0
