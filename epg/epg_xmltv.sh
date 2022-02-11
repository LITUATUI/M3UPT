#!/bin/bash

wget -N https://github.com/XMLTV/xmltv/raw/master/grab/pt_meo/tv_grab_pt_meo && perl tv_grab_pt_meo --config-file meo.conf --days 2 --output meo-epg.xml && gzip -c meo-epg.xml > meo-epg.xml.gz

exit 0
