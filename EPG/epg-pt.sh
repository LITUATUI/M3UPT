#!/bin/bash

cd EPG

# Rytec EPG

wget -O epg-rytec-pt.xml.xz "http://www.xmltvepg.nl/rytecPT.xz"

# Vodafone EPG

wget -N "https://github.com/XMLTV/xmltv/raw/master/grab/pt_vodafone/tv_grab_pt_vodafone" && perl tv_grab_pt_vodafone --config-file vodafone-pt.conf --output epg-vodafone-pt.xml && xz -k -f -9 epg-vodafone-pt.xml && gzip -k -f -9 epg-vodafone-pt.xml

# Meo EPG

cd ../iptv-org-epg && npm install && npx epg-grabber --config=sites/meo.pt/meo.pt.config.js --channels=../EPG/meo.pt.channels.xml --output=../EPG/epg-meo-pt.xml --days=7 && cd ../EPG && xz -k -f -9 epg-meo-pt.xml && gzip -k -f -9 epg-meo-pt.xml

# Remove xml files

rm *.xml

exit 0
