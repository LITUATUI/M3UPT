#!/bin/bash

cd /home/runner/work/M3UPT/M3UPT/iptv-org-epg && npm install

# PT EPG

npm run grab -- --channels=../EPG/pt.channels.xml --output=../EPG/epg-pt.xml --days=7 --maxConnections=10

# Meo EPG

npm run grab -- --site=meo.pt --output=../EPG/epg-meo-pt.xml --days=7 --maxConnections=2

# Nos EPG

npm run grab -- --site=nostv.pt --output=../EPG/epg-nos-pt.xml --days=7 --maxConnections=10

# RTP EPG

npm run grab -- --site=rtp.pt --output=../EPG/epg-rtp-pt.xml --days=7 --maxConnections=5

# Mi.tv EPG

npm run grab -- --channels=sites/mi.tv/mi.tv_br.channels.xml --output=../EPG/epg-mitv-br.xml --days=7 --maxConnections=10

# Rytec EPG

cd ../EPG

wget -O epg-rytec-pt.xml.xz "http://www.xmltvepg.nl/rytecPT.xz"

# Compress EPG xml files

xz -k -f -9 epg*.xml && gzip -k -f -9 epg*.xml

# Remove EPG xml files

rm epg*.xml

exit 0
