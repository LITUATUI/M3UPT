#!/bin/bash

cd ../iptv-org-epg && npm install

# Meo EPG

npm run grab -- --site=meo.pt --output=../EPG/epg-meo-pt.xml --days=7

# Nos EPG

npm run grab -- --site=nostv.pt --output=../EPG/epg-nos-pt.xml --days=7

# RTP EPG

npm run grab -- --site=rtp.pt --output=../EPG/epg-rtp-pt.xml --days=7

# Vodafone EPG

cd ../EPG

wget -N "https://github.com/XMLTV/xmltv/raw/master/grab/pt_vodafone/tv_grab_pt_vodafone" && perl tv_grab_pt_vodafone --config-file vodafone-pt.conf --output epg-vodafone-pt.xml

# Rytec EPG

wget -O epg-rytec-pt.xml.xz "http://www.xmltvepg.nl/rytecPT.xz"

# Compress EPG xml files

xz -k -f -9 *.xml && gzip -k -f -9 *.xml

# Remove EPG xml files

rm *.xml

exit 0
