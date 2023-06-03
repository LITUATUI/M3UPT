#!/bin/bash

cd iptv-org-epg && npm install && SITE=meo.pt npm run grab && mv guides/pt/meo.pt.xml ../EPG/epg-meo-pt.xml && cd ../EPG && xz -k -f -9 epg-meo-pt.xml && gzip -v9 -c epg-meo-pt.xml > epg-meo-pt.xml.gz

exit 0
