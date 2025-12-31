#!/bin/bash

cd /home/runner/work/M3UPT/M3UPT/iptv-org-epg && npm install

# PT EPG

npm run grab --- --channels=../EPG/m3upt.channels.xml --output=../EPG/epg-m3upt.xml --days=7 --maxConnections=20

# RTP EPG

npm run grab --- --site=rtp.pt --output=../EPG/epg-rtp-pt.xml --days=7 --maxConnections=20

# SIC EPG

npm run grab --- --site=opto.sic.pt --output=../EPG/epg-sic-pt.xml --days=7 --maxConnections=20

# TVI EPG

npm run grab --- --site=tvi.iol.pt --output=../EPG/epg-tvi-pt.xml --days=7 --maxConnections=20

# SportTV EPG

npm run grab --- --site=sporttv.pt --output=../EPG/epg-sporttv-pt.xml --days=7 --maxConnections=20

# Vodafone PT EPG

npm run grab --- --site=vodafone.pt --output=../EPG/epg-vodafone-pt.xml --days=7 --maxConnections=20

# Nos EPG

npm run grab --- --site=nostv.pt --output=../EPG/epg-nos-pt.xml --days=7 --maxConnections=20

# Meo EPG

npm run grab --- --site=meo.pt --output=../EPG/epg-meo-pt.xml --days=7 --maxConnections=10

# Mi.tv EPG

npm run grab --- --channels=sites/mi.tv/mi.tv_br.channels.xml --output=../EPG/epg-mitv-br.xml --days=7 --maxConnections=20

# Claro EPG

npm run grab --- --site=claro.com.br --output=../EPG/epg-claro-br.xml --days=7 --maxConnections=20

# Vivo Play EPG

npm run grab --- --site=vivoplay.com.br --output=../EPG/epg-vivoplay-br.xml --days=7 --maxConnections=20

# Zap EPG

npm run grab --- --site=zap.co.ao --output=../EPG/epg-zap-ao.xml --days=7 --maxConnections=20

# Movistar Plus+ EPG

npm run grab --- --site=movistarplus.es --output=../EPG/epg-movistarplus-es.xml --days=7 --maxConnections=20

# Orange EPG

npm run grab --- --site=chaines-tv.orange.fr --output=../EPG/epg-orange-fr.xml --days=7 --maxConnections=20

# Sky IT EPG

npm run grab --- --site=guidatv.sky.it --output=../EPG/epg-sky-it.xml --days=7 --maxConnections=20

# Sky UK EPG

npm run grab --- --site=sky.com --output=../EPG/epg-sky-uk.xml --days=7 --maxConnections=20

# Freeview Play EPG

npm run grab --- --site=freeview.co.uk --output=../EPG/epg-freeview-uk.xml --days=7 --maxConnections=20

# Sky DE EPG

npm run grab --- --site=sky.de --output=../EPG/epg-sky-de.xml --days=7 --maxConnections=20

# Rytec EPG

cd ../EPG && wget -O epg-rytec-pt.xml.xz "http://www.xmltvepg.nl/rytecPT.xz"

# Compress EPG xml files

xz -k -f -9 epg*.xml && gzip -k -f -9 epg*.xml

# Remove EPG xml files

rm epg*.xml

exit 0
