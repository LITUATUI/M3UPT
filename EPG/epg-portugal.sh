#!/bin/bash

tv_merge -i epg-vodafone-pt.xml -m epg-rtp.xml -o epg-portugal.xml && xz -k -f -9 epg-portugal.xml

exit 0
