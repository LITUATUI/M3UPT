#!/bin/bash

cd iptv-org-epg && npm install && npx epg-grabber --config=sites/meo.pt/meo.pt.config.js --channels=../EPG/meo.pt.channels.xml --output=../EPG/epg-meo-pt.xml --days=7 && cd ../EPG && xz -k -f -9 epg-meo-pt.xml && gzip -v9 -c epg-meo-pt.xml > epg-meo-pt.xml.gz

exit 0
