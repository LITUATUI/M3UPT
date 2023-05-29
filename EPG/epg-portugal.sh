#!/bin/bash

tv_sort --by-channel --output epg-vodafone-pt-sorted.xml  epg-vodafone-pt.xml && tv_sort --by-channel --output epg-rtp-sorted.xml  epg-rtp.xml 

tv_merge -i epg-vodafone-pt-sorted.xml -m epg-rtp-sorted.xml -o epg-portugal.xml && xz -k -f -9 epg-portugal.xml

exit 0
