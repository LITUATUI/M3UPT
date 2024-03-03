#!/bin/bash

cd /home/runner/work/M3UPT/M3UPT/iptv-org-epg && npm install

# Meo EPG

npm run grab -- --channels=../EPG/meo.pt.channels.xml --output=../EPG/epg-meo-pt.xml --days=7

# Nos EPG

npm run grab -- --channels=../EPG/nostv.pt.channels.xml --output=../EPG/epg-meo-pt.xml --days=7

# RTP EPG

npm run grab -- --site=rtp.pt --output=../EPG/epg-rtp-pt.xml --days=7

# Rytec EPG

wget -O epg-rytec-pt.xml.xz "http://www.xmltvepg.nl/rytecPT.xz"

# Compress EPG xml files

xz -k -f -9 *.xml && gzip -k -f -9 *.xml

# Remove EPG xml files

rm *.xml

exit 0
