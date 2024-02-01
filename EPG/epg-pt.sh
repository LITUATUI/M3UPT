#!/bin/bash

cd EPG

# Rytec EPG

wget -O epg-rytec-pt.xml.xz "http://www.xmltvepg.nl/rytecPT.xz"

# Vodafone EPG

wget -N "https://github.com/XMLTV/xmltv/raw/master/grab/pt_vodafone/tv_grab_pt_vodafone" && perl tv_grab_pt_vodafone --config-file vodafone-pt.conf --output epg-vodafone-pt.xml

# Meo EPG

cd ../iptv-org-epg && npm run grab -- --site=meo.pt --output=../EPG/epg-meo-pt.xml --days=7

# Nos EPG

cd ../iptv-org-epg && npm run grab -- --site=nostv.pt --output=../EPG/epg-nos-pt.xml --days=7

# RTP EPG

cd ../iptv-org-epg && npm run grab -- --site=rtp.pt --output=../EPG/epg-rtp-pt.xml --days=7

# Compress EPG xml files

cd ../EPG && xz -k -f -9 *.xml && gzip -k -f -9 *.xml

# Remove EPG xml files

rm *.xml

exit 0
