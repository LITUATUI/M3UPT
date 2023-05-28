#!/bin/bash

cd EPG && npm install && SITE=rtp.pt npm run grab && mv guides/pt/rtp.pt.xml epg-rtp.xml && xz -k -f -9 epg-rtp.xml && gzip -v9 -c epg-rtp.xml > epg-rtp.xml.gz

exit 0
