#!/bin/bash

wget -N https://iptv-org.github.io/epg/guides/pt/meo.pt.epg.xml && gzip -c meo.pt.epg.xml > meo.pt.epg.xml.gz

exit 0
