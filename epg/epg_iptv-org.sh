#!/bin/bash

wget -N https://iptv-org.github.io/epg/guides/pt/meo.pt.epg.xml && gzip -c meo-epg.xml > meo-epg.xml.gz

exit 0
