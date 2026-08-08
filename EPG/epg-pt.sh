#!/bin/bash

cd /home/runner/work/M3UPT/M3UPT/iptv-org-epg && npm install

# M3UPT EPG

npm run grab --- -c=../EPG/m3upt.channels.xml -o=../EPG/epg-m3upt.xml --days=7 --maxConnections=20

# RTP EPG

npm run grab --- -s=rtp.pt -o=../EPG/epg-rtp-pt.xml --days=7 --maxConnections=20

# SIC EPG

npm run grab --- -s=opto.sic.pt -o=../EPG/epg-sic-pt.xml --days=7 --maxConnections=20

# TVI EPG

npm run grab --- -s=tvi.iol.pt -o=../EPG/epg-tvi-pt.xml --days=7 --maxConnections=20

# SportTV EPG

npm run grab --- -s=sporttv.pt -o=../EPG/epg-sporttv-pt.xml --days=7 --maxConnections=20

# Vodafone PT EPG

npm run grab --- -s=vodafone.pt -o=../EPG/epg-vodafone-pt.xml --days=7 --maxConnections=20

# Nos EPG

npm run grab --- -s=nostv.pt -o=../EPG/epg-nos-pt.xml --days=7 --maxConnections=20

# Meo EPG

npm run grab --- -s=meo.pt -o=../EPG/epg-meo-pt.xml --days=7 --maxConnections=20

# Mi.tv EPG

npm run grab --- -c=sites/mi.tv/mi.tv_br.channels.xml -o=../EPG/epg-mitv-br.xml --days=7 --maxConnections=20

# Vivo Play EPG

npm run grab --- -s=vivoplay.com.br -o=../EPG/epg-vivoplay-br.xml --days=7 --maxConnections=20

# Sky IT EPG

npm run grab --- -s=guidatv.sky.it -o=../EPG/epg-sky-it.xml --days=7 --maxConnections=20

# Sky UK EPG

npm run grab --- -s=sky.com -o=../EPG/epg-sky-uk.xml --days=7 --maxConnections=20

# Freeview Play EPG

npm run grab --- -s=freeview.co.uk -o=../EPG/epg-freeview-uk.xml --days=7 --maxConnections=20

# Sky DE EPG

# npm run grab --- -s=sky.de -o=../EPG/epg-sky-de.xml --days=7 --maxConnections=20

# Rytec EPG

cd ../EPG && wget -O epg-rytec-pt.xml.xz "http://www.xmltvepg.nl/rytecPT.xz"

# Compress EPG xml files

xz -k -f -9 epg*.xml && gzip -k -f -9 epg-m3upt.xml

# Remove EPG xml files

rm epg*.xml

exit 0
